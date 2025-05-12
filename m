Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 206C3C3ABBC
	for <intel-xe@archiver.kernel.org>; Mon, 12 May 2025 10:09:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9CB2810E348;
	Mon, 12 May 2025 10:09:12 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 76D1410E169;
 Mon, 12 May 2025 10:09:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1327111743045841613=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Reduce_DPT_table?=
 =?utf-8?q?_alignment_as_in_i915?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tvrtko Ursulin" <tvrtko.ursulin@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 12 May 2025 10:09:11 -0000
Message-ID: <174704455145.68358.14866217001909269549@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250512080156.57512-1-tvrtko.ursulin@igalia.com>
In-Reply-To: <20250512080156.57512-1-tvrtko.ursulin@igalia.com>
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

--===============1327111743045841613==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Reduce DPT table alignment as in i915
URL   : https://patchwork.freedesktop.org/series/148868/
State : failure

== Summary ==

CI Bug Log - changes from xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9_FULL -> xe-pw-148868v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-148868v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-148868v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-148868v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][1] +3 other tests dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-7/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-3-4:
    - shard-bmg:          [PASS][2] -> [DMESG-WARN][3] +19 other tests dmesg-warn
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-1/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-3-4.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-3-4.html

  * igt@kms_async_flips@crc:
    - shard-bmg:          [PASS][4] -> [DMESG-FAIL][5] +1 other test dmesg-fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_async_flips@crc.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_async_flips@crc.html

  * igt@kms_async_flips@crc-atomic@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@kms_async_flips@crc-atomic@pipe-a-dp-2.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          [PASS][8] -> [FAIL][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_pm_rpm@universal-planes:
    - shard-adlp:         [PASS][10] -> [SKIP][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-8/igt@kms_pm_rpm@universal-planes.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_pm_rpm@universal-planes.html

  
#### Warnings ####

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          [SKIP][12] ([Intel XE#2320]) -> [SKIP][13] +1 other test skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_cursor_crc@cursor-onscreen-64x21.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_feature_discovery@display-3x:
    - shard-bmg:          [SKIP][14] ([Intel XE#2373]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_feature_discovery@display-3x.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_feature_discovery@display-3x.html

  
New tests
---------

  New tests have been introduced between xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9_FULL and xe-pw-148868v1_FULL:

### New IGT tests (1) ###

  * igt@kms_addfb_basic:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in xe-pw-148868v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@fbdev@unaligned-write:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#2134])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@fbdev@unaligned-write.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@fbdev@unaligned-write.html
    - shard-adlp:         [PASS][18] -> [SKIP][19] ([Intel XE#2134])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-3/igt@fbdev@unaligned-write.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@fbdev@unaligned-write.html
    - shard-dg2-set2:     [PASS][20] -> [SKIP][21] ([Intel XE#2134])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@fbdev@unaligned-write.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@fbdev@unaligned-write.html
    - shard-lnl:          [PASS][22] -> [SKIP][23] ([Intel XE#2134])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-3/igt@fbdev@unaligned-write.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@fbdev@unaligned-write.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-bmg:          NOTRUN -> [FAIL][24] ([Intel XE#3701] / [Intel XE#3718] / [Intel XE#827])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][25] ([Intel XE#827])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-7/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-1-y:
    - shard-adlp:         [PASS][26] -> [DMESG-WARN][27] ([Intel XE#4543]) +5 other tests dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-1-y.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-1-y.html

  * igt@kms_async_flips@crc-atomic:
    - shard-bmg:          [PASS][28] -> [DMESG-FAIL][29] ([Intel XE#4626]) +1 other test dmesg-fail
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_async_flips@crc-atomic.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][30] ([Intel XE#4626]) +2 other tests dmesg-fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@kms_async_flips@crc-atomic@pipe-c-dp-2.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][31] -> [FAIL][32] ([Intel XE#4677]) +2 other tests fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html

  * igt@kms_async_flips@crc@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][33] -> [FAIL][34] ([Intel XE#3884]) +2 other tests fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_async_flips@crc@pipe-d-hdmi-a-3.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#3768])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2327]) +2 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [PASS][37] -> [SKIP][38] ([Intel XE#2231] / [Intel XE#4996])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-bmg:          [PASS][39] -> [SKIP][40] ([Intel XE#2231])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#316]) +3 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#316])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-9/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1407]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-6/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][44] ([Intel XE#4543])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#1467])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][46] ([Intel XE#1124]) +4 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [PASS][47] -> [DMESG-FAIL][48] ([Intel XE#4543]) +10 other tests dmesg-fail
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#1124]) +1 other test skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1124]) +4 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#1124]) +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#2191])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2314] / [Intel XE#2894])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#2191])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#367])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#367])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#367]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#367]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1512])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@kms_bw@linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][60] -> [SKIP][61] ([Intel XE#2351] / [Intel XE#4208]) +13 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#2351] / [Intel XE#4208]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#787]) +83 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#2887]) +4 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#3432])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#3432]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#787]) +20 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2887]) +5 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][71] -> [INCOMPLETE][72] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][73] -> [INCOMPLETE][74] ([Intel XE#3124])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][75] -> [DMESG-WARN][76] ([Intel XE#1727] / [Intel XE#3113])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#2907])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#2907])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [SKIP][79] ([Intel XE#2652] / [Intel XE#787]) +8 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][80] ([Intel XE#4418])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2724])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#4416]) +3 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-bmg:          NOTRUN -> [SKIP][83] ([Intel XE#2325]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@degamma:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#306]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_chamelium_color@degamma.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#306])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-466/igt@kms_chamelium_color@degamma.html
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#306])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#373]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-storm-disable:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#2252]) +3 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-storm-disable.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#373]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-storm.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#4208] / [i915#2575]) +22 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#373]) +3 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][92] ([Intel XE#1178])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#455]) +11 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][94] ([Intel XE#1178])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@kms_content_protection@lic-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#3278])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@kms_content_protection@lic-type-0.html
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2341])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][97] ([Intel XE#3304])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@kms_content_protection@lic-type-0@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-32x32:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#2320]) +3 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1424]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-32x32.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][100] -> [SKIP][101] ([Intel XE#2291]) +7 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#323]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#309]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2291])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][105] -> [FAIL][106] ([Intel XE#1475])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@kms_cursor_legacy@flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#323]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][108] ([Intel XE#2286])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [PASS][109] -> [SKIP][110] ([Intel XE#3009])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@kms_dp_aux_dev.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][111] ([Intel XE#4354])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#4354])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2244]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#4422])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#776])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@psr1:
    - shard-adlp:         NOTRUN -> [SKIP][116] ([Intel XE#1135])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@kms_feature_discovery@psr1.html
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2374])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_feature_discovery@psr1.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#1135])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@kms_feature_discovery@psr1.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [PASS][119] -> [SKIP][120] ([Intel XE#2316]) +6 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-3/igt@kms_flip@2x-flip-vs-dpms.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][121] ([Intel XE#3321]) +2 other tests fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][122] ([Intel XE#310]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@2x-wf_vblank-ts-check:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2316]) +1 other test skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-check.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][124] -> [SKIP][125] ([Intel XE#4208] / [i915#2575]) +118 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_flip@busy-flip.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-dpms-on-nop@a-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][126] ([Intel XE#3098]) +1 other test fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-8/igt@kms_flip@flip-vs-dpms-on-nop@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-bmg:          [PASS][127] -> [FAIL][128] ([Intel XE#3321])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [PASS][129] -> [FAIL][130] ([Intel XE#301]) +6 other tests fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][131] -> [FAIL][132] ([Intel XE#301]) +1 other test fail
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [PASS][133] -> [INCOMPLETE][134] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][135] ([Intel XE#2049] / [Intel XE#2597])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend@a-dp2:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][136] ([Intel XE#2049] / [Intel XE#2597])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-dp2.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1397] / [Intel XE#1745])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1397])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-adlp:         [PASS][139] -> [SKIP][140] ([Intel XE#2351])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
    - shard-bmg:          [PASS][141] -> [SKIP][142] ([Intel XE#2231] / [Intel XE#4954])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][143] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#1401]) +3 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#455]) +5 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2293]) +4 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#352])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#651]) +12 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#656]) +18 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][151] ([Intel XE#651]) +5 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][152] ([Intel XE#4141]) +8 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][153] ([Intel XE#651]) +7 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2311]) +13 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#2313]) +12 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#656]) +18 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2312]) +8 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#1158])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
    - shard-bmg:          NOTRUN -> [SKIP][159] ([Intel XE#2350])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][160] ([Intel XE#653]) +6 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#653]) +10 other tests skip
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][162] -> [SKIP][163] ([Intel XE#1503]) +2 other tests skip
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_hdr@static-toggle-suspend.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#2925])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-9/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2934])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#2925])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@kms_joiner@basic-force-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#2934])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-6/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#346])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][169] ([Intel XE#2927])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_lease@lease-uevent:
    - shard-adlp:         [PASS][170] -> [DMESG-WARN][171] ([Intel XE#4173]) +2 other tests dmesg-warn
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-9/igt@kms_lease@lease-uevent.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_lease@lease-uevent.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][172] ([Intel XE#616]) +2 other tests fail
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#599]) +7 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][174] -> [SKIP][175] ([Intel XE#2571])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-lnl:          NOTRUN -> [SKIP][176] ([Intel XE#3307])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][177] ([Intel XE#4212])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [ABORT][178] ([Intel XE#4760]) +1 other test abort
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][179] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-adlp:         NOTRUN -> [SKIP][180] ([Intel XE#2763]) +2 other tests skip
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][181] ([Intel XE#2763] / [Intel XE#455]) +5 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-d.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][182] ([Intel XE#2763]) +19 other tests skip
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][183] ([Intel XE#2763]) +8 other tests skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][184] ([Intel XE#2763]) +7 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-adlp:         NOTRUN -> [SKIP][185] ([Intel XE#1129])
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][186] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_properties@get_properties-sanity-atomic:
    - shard-adlp:         NOTRUN -> [FAIL][187] ([Intel XE#5017])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@kms_properties@get_properties-sanity-atomic.html

  * igt@kms_properties@get_properties-sanity-non-atomic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][188] ([Intel XE#5017])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-463/igt@kms_properties@get_properties-sanity-non-atomic.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#2893] / [Intel XE#4608])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][190] ([Intel XE#4608]) +2 other tests skip
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][191] ([Intel XE#1489]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#1489]) +4 other tests skip
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html
    - shard-lnl:          NOTRUN -> [SKIP][193] ([Intel XE#2893]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][194] ([Intel XE#1489]) +1 other test skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-lnl:          [PASS][195] -> [SKIP][196] ([Intel XE#2351] / [Intel XE#4996]) +3 other tests skip
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@kms_psr@fbc-psr-sprite-render.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-cursor-render:
    - shard-lnl:          NOTRUN -> [SKIP][197] ([Intel XE#1406])
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render.html

  * igt@kms_psr@fbc-psr2-cursor-render@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][198] ([Intel XE#4609])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-render@edp-1.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][199] ([Intel XE#2850] / [Intel XE#929]) +6 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][200] ([Intel XE#2234] / [Intel XE#2850]) +7 other tests skip
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-lnl:          [PASS][201] -> [SKIP][202] ([Intel XE#2351])
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-3/igt@kms_psr@psr2-sprite-plane-move.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_psr@psr2-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][203] ([Intel XE#2850] / [Intel XE#929]) +7 other tests skip
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_psr@psr2-suspend.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:
    - shard-adlp:         NOTRUN -> [FAIL][204] ([Intel XE#1874])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-bottom.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-adlp:         [PASS][205] -> [SKIP][206] ([Intel XE#4950] / [Intel XE#4996])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][207] ([Intel XE#1127])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-bmg:          NOTRUN -> [SKIP][208] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
    - shard-lnl:          NOTRUN -> [SKIP][209] ([Intel XE#3414] / [Intel XE#3904])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         NOTRUN -> [SKIP][210] ([Intel XE#3414]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][211] ([Intel XE#2413])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          NOTRUN -> [SKIP][212] ([Intel XE#1499])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_vrr@flipline.html

  * igt@xe_ccs@ctrl-surf-copy-new-ctx:
    - shard-adlp:         NOTRUN -> [SKIP][213] ([Intel XE#455] / [Intel XE#488])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@xe_ccs@ctrl-surf-copy-new-ctx.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][214] ([Intel XE#1126]) +1 other test skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-3/igt@xe_copy_basic@mem-set-linear-0x3fff.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][215] ([Intel XE#1126])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eu_stall@blocking-read:
    - shard-adlp:         NOTRUN -> [SKIP][216] ([Intel XE#4497])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@xe_eu_stall@blocking-read.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][217] ([Intel XE#4497])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-434/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@basic-read-event:
    - shard-lnl:          NOTRUN -> [SKIP][218] ([Intel XE#4837]) +4 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-7/igt@xe_eudebug@basic-read-event.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][219] ([Intel XE#4837]) +10 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@read-metadata:
    - shard-adlp:         NOTRUN -> [SKIP][220] ([Intel XE#4837]) +5 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@xe_eudebug@read-metadata.html

  * igt@xe_eudebug_online@resume-dss:
    - shard-dg2-set2:     NOTRUN -> [SKIP][221] ([Intel XE#4837]) +4 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@xe_eudebug_online@resume-dss.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-bmg:          NOTRUN -> [SKIP][222] ([Intel XE#4518])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][223] ([Intel XE#4518])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][224] ([Intel XE#261] / [Intel XE#688])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-1/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][225] ([Intel XE#688]) +3 other tests skip
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][226] ([Intel XE#4208]) +98 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_balancer@twice-virtual-basic:
    - shard-dg2-set2:     [PASS][227] -> [SKIP][228] ([Intel XE#4208]) +225 other tests skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_exec_balancer@twice-virtual-basic.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_exec_balancer@twice-virtual-basic.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][229] -> [SKIP][230] ([Intel XE#1392]) +2 other tests skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][231] ([Intel XE#2322]) +2 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][232] ([Intel XE#1392]) +2 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][233] ([Intel XE#1392]) +2 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-rebind.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-userptr-rebind:
    - shard-bmg:          [PASS][234] -> [SKIP][235] ([Intel XE#4954] / [Intel XE#4996]) +1 other test skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-1/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-rebind.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@xe_exec_compute_mode@once-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][236] ([Intel XE#4996]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][237] ([Intel XE#288]) +8 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][238] ([Intel XE#288]) +10 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-adlp:         NOTRUN -> [SKIP][239] ([Intel XE#2360])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-3/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][240] ([Intel XE#2360])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][241] ([Intel XE#4943]) +13 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][242] ([Intel XE#4915]) +65 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-434/igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-shared-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][243] ([Intel XE#4996])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@xe_exec_system_allocator@process-many-stride-mmap-shared-nomemset.html

  * igt@xe_exec_system_allocator@processes-evict-malloc:
    - shard-adlp:         NOTRUN -> [SKIP][244] ([Intel XE#4915]) +86 other tests skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@xe_exec_system_allocator@processes-evict-malloc.html

  * igt@xe_exec_system_allocator@threads-many-large-new-nomemset:
    - shard-bmg:          [PASS][245] -> [SKIP][246] ([Intel XE#4996]) +5 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@xe_exec_system_allocator@threads-many-large-new-nomemset.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@xe_exec_system_allocator@threads-many-large-new-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge-nomemset:
    - shard-lnl:          NOTRUN -> [SKIP][247] ([Intel XE#4943]) +9 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-huge-nomemset.html

  * igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate:
    - shard-bmg:          [PASS][248] -> [SKIP][249] ([Intel XE#4954]) +11 other tests skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html
    - shard-adlp:         [PASS][250] -> [SKIP][251] ([Intel XE#4996]) +13 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-adlp:         [PASS][252] -> [SKIP][253] ([Intel XE#4945] / [Intel XE#4996])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec_threads@threads-hang-rebind-err.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:
    - shard-adlp:         [PASS][254] -> [DMESG-WARN][255] ([Intel XE#4792])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-3/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.html

  * igt@xe_media_fill@media-fill:
    - shard-bmg:          NOTRUN -> [SKIP][256] ([Intel XE#2459] / [Intel XE#2596])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-3/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@pci-membarrier-bad-object:
    - shard-adlp:         NOTRUN -> [SKIP][257] ([Intel XE#4045])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@xe_mmap@pci-membarrier-bad-object.html
    - shard-lnl:          NOTRUN -> [SKIP][258] ([Intel XE#4045])
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@xe_mmap@pci-membarrier-bad-object.html

  * igt@xe_oa@buffer-fill:
    - shard-adlp:         NOTRUN -> [SKIP][259] ([Intel XE#2541] / [Intel XE#3573])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-dg2-set2:     NOTRUN -> [SKIP][260] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][261] ([Intel XE#2427])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@xe_peer2peer@write.html
    - shard-adlp:         NOTRUN -> [SKIP][262] ([Intel XE#1061])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@xe_peer2peer@write.html
    - shard-lnl:          NOTRUN -> [SKIP][263] ([Intel XE#1061])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@xe_peer2peer@write.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][264] ([Intel XE#1173]) +1 other test fail
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-bmg:          NOTRUN -> [SKIP][265] ([Intel XE#2284])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][266] -> [ABORT][267] ([Intel XE#1794])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pmu@fn-engine-activity-load:
    - shard-bmg:          NOTRUN -> [SKIP][268] ([Intel XE#4650])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@xe_pmu@fn-engine-activity-load.html

  * igt@xe_pxp@pxp-optout:
    - shard-adlp:         NOTRUN -> [SKIP][269] ([Intel XE#4733])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@xe_pxp@pxp-optout.html
    - shard-bmg:          NOTRUN -> [SKIP][270] ([Intel XE#4733])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@xe_pxp@pxp-optout.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][271] ([Intel XE#4733])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@xe_pxp@pxp-optout.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][272] ([Intel XE#944])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-adlp:         NOTRUN -> [SKIP][273] ([Intel XE#944]) +2 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-3/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-lnl:          NOTRUN -> [SKIP][274] ([Intel XE#944])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][275] ([Intel XE#944])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_spin_batch@spin-basic:
    - shard-lnl:          [PASS][276] -> [SKIP][277] ([Intel XE#4996]) +19 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-4/igt@xe_spin_batch@spin-basic.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@xe_spin_batch@spin-basic.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-lnl:          NOTRUN -> [SKIP][278] ([Intel XE#4130])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-bmg:          NOTRUN -> [SKIP][279] ([Intel XE#4130]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][280] ([Intel XE#4130])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-434/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_sriov_scheduling@equal-throughput:
    - shard-lnl:          NOTRUN -> [SKIP][281] ([Intel XE#4351])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@xe_sriov_scheduling@equal-throughput.html

  
#### Possible fixes ####

  * {igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1}:
    - shard-lnl:          [FAIL][282] ([Intel XE#911]) -> [PASS][283] +7 other tests pass
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][284] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][285]
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][286] ([Intel XE#4173]) -> [PASS][287] +1 other test pass
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [SKIP][288] ([Intel XE#2291]) -> [PASS][289] +5 other tests pass
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [SKIP][290] ([Intel XE#4996]) -> [PASS][291] +7 other tests pass
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#4208] / [i915#2575]) -> [PASS][293] +2 other tests pass
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [SKIP][294] ([Intel XE#4354]) -> [PASS][295]
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_dp_link_training@non-uhbr-sst.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_fbcon_fbt@psr-suspend:
    - shard-lnl:          [FAIL][296] ([Intel XE#4164]) -> [PASS][297]
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-7/igt@kms_fbcon_fbt@psr-suspend.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-2/igt@kms_fbcon_fbt@psr-suspend.html

  * igt@kms_feature_discovery@display-2x:
    - shard-bmg:          [SKIP][298] ([Intel XE#2373]) -> [PASS][299]
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_feature_discovery@display-2x.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-3/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [SKIP][300] ([Intel XE#2316]) -> [PASS][301] +11 other tests pass
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [FAIL][302] ([Intel XE#886]) -> [PASS][303] +1 other test pass
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-bmg:          [FAIL][304] ([Intel XE#3321]) -> [PASS][305]
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [INCOMPLETE][306] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][307] +2 other tests pass
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][308] ([Intel XE#4543]) -> [PASS][309] +11 other tests pass
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         [DMESG-FAIL][310] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][311] +1 other test pass
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [SKIP][312] ([Intel XE#1503]) -> [PASS][313] +1 other test pass
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_hdr@static-toggle.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [SKIP][314] ([Intel XE#3012]) -> [PASS][315]
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-7/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][316] ([Intel XE#4596]) -> [PASS][317] +1 other test pass
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_plane_multiple@2x-tiling-4.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-adlp:         [SKIP][318] ([Intel XE#4950]) -> [PASS][319]
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][320] ([Intel XE#718]) -> [PASS][321]
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][322] ([Intel XE#718]) -> [PASS][323]
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-bmg:          [SKIP][324] ([Intel XE#1435]) -> [PASS][325]
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#1392]) -> [PASS][327]
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@many-execqueues-userptr-unmap:
    - shard-adlp:         [SKIP][328] ([Intel XE#4945]) -> [PASS][329]
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec_compute_mode@many-execqueues-userptr-unmap.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-1/igt@xe_exec_compute_mode@many-execqueues-userptr-unmap.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate:
    - shard-lnl:          [SKIP][330] ([Intel XE#4996]) -> [PASS][331] +16 other tests pass
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@xe_exec_fault_mode@many-userptr-invalidate.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-8/igt@xe_exec_fault_mode@many-userptr-invalidate.html

  * igt@xe_exec_reset@spin-signaled:
    - shard-adlp:         [SKIP][332] ([Intel XE#4996]) -> [PASS][333] +5 other tests pass
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec_reset@spin-signaled.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@xe_exec_reset@spin-signaled.html
    - shard-bmg:          [SKIP][334] ([Intel XE#4954] / [Intel XE#4996]) -> [PASS][335]
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@xe_exec_reset@spin-signaled.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@xe_exec_reset@spin-signaled.html
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#4208]) -> [PASS][337] +2 other tests pass
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_exec_reset@spin-signaled.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-434/igt@xe_exec_reset@spin-signaled.html

  * igt@xe_module_load@load:
    - shard-dg2-set2:     ([PASS][338], [PASS][339], [PASS][340], [PASS][341], [SKIP][342], [PASS][343], [PASS][344], [PASS][345], [PASS][346], [PASS][347], [PASS][348], [PASS][349], [PASS][350], [PASS][351], [PASS][352], [PASS][353], [PASS][354], [PASS][355], [PASS][356], [PASS][357], [PASS][358], [PASS][359], [PASS][360], [PASS][361], [PASS][362], [PASS][363]) ([Intel XE#378]) -> ([PASS][364], [PASS][365], [PASS][366], [PASS][367], [PASS][368], [PASS][369], [PASS][370], [PASS][371], [PASS][372], [PASS][373], [PASS][374], [PASS][375], [PASS][376], [PASS][377], [PASS][378], [PASS][379], [PASS][380], [PASS][381], [PASS][382], [PASS][383], [PASS][384], [PASS][385], [PASS][386], [PASS][387])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_module_load@load.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_module_load@load.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_module_load@load.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_module_load@load.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_module_load@load.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_module_load@load.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_module_load@load.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_module_load@load.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_module_load@load.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@xe_module_load@load.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@xe_module_load@load.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@xe_module_load@load.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@xe_module_load@load.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@xe_module_load@load.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@xe_module_load@load.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@xe_module_load@load.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@xe_module_load@load.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@xe_module_load@load.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@xe_module_load@load.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@xe_module_load@load.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@xe_module_load@load.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@xe_module_load@load.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@xe_module_load@load.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@xe_module_load@load.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@xe_module_load@load.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@xe_module_load@load.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@xe_module_load@load.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/igt@xe_module_load@load.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/igt@xe_module_load@load.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-466/igt@xe_module_load@load.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_module_load@load.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_module_load@load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_module_load@load.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_module_load@load.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-466/igt@xe_module_load@load.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/igt@xe_module_load@load.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@xe_module_load@load.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_module_load@load.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-463/igt@xe_module_load@load.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-463/igt@xe_module_load@load.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@xe_module_load@load.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@xe_module_load@load.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@xe_module_load@load.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@xe_module_load@load.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@xe_module_load@load.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@xe_module_load@load.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_module_load@load.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-434/igt@xe_module_load@load.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-434/igt@xe_module_load@load.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@xe_module_load@load.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][388] ([Intel XE#1794]) -> [PASS][389] +1 other test pass
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-9/igt@xe_pm@s4-basic.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-3/igt@xe_pm@s4-basic.html
    - shard-lnl:          [ABORT][390] ([Intel XE#1794]) -> [PASS][391] +1 other test pass
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-2/igt@xe_pm@s4-basic.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@xe_pm@s4-basic.html

  * igt@xe_vm@large-split-misaligned-binds-4194304:
    - shard-bmg:          [SKIP][392] ([Intel XE#4954]) -> [PASS][393] +8 other tests pass
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@xe_vm@large-split-misaligned-binds-4194304.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@xe_vm@large-split-misaligned-binds-4194304.html

  
#### Warnings ####

  * igt@kms_async_flips@crc-atomic:
    - shard-adlp:         [DMESG-FAIL][394] ([Intel XE#4543]) -> [DMESG-FAIL][395] ([Intel XE#4543] / [Intel XE#4626])
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_async_flips@crc-atomic.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@kms_async_flips@crc-atomic.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][396] ([Intel XE#3884]) -> [DMESG-FAIL][397] ([Intel XE#4543] / [Intel XE#4626])
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#873]) -> [SKIP][399] ([Intel XE#4208] / [i915#2575])
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_async_flips@invalid-async-flip.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:
    - shard-adlp:         [SKIP][400] ([Intel XE#607]) -> [SKIP][401] ([Intel XE#4996])
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [SKIP][402] ([Intel XE#1124]) -> [SKIP][403] ([Intel XE#4996])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
    - shard-lnl:          [SKIP][404] ([Intel XE#3658]) -> [SKIP][405] ([Intel XE#2351] / [Intel XE#4996])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#316]) -> [SKIP][407] ([Intel XE#2351] / [Intel XE#4208])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#316]) -> [SKIP][409] ([Intel XE#4208]) +4 other tests skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][410] ([Intel XE#1124]) -> [SKIP][411] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#619]) -> [SKIP][413] ([Intel XE#2351] / [Intel XE#4208])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#607]) -> [SKIP][415] ([Intel XE#4208])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#1124]) -> [SKIP][417] ([Intel XE#4208]) +10 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         [SKIP][418] ([Intel XE#4996]) -> [SKIP][419] ([Intel XE#2191])
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
    - shard-lnl:          [SKIP][420] ([Intel XE#4996]) -> [SKIP][421] ([Intel XE#2191])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#367]) -> [SKIP][423] ([Intel XE#4208] / [i915#2575]) +3 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-1920x1080p:
    - shard-adlp:         [SKIP][424] ([Intel XE#4996]) -> [SKIP][425] ([Intel XE#367])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-1/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
    - shard-bmg:          [SKIP][426] ([Intel XE#4996]) -> [SKIP][427] ([Intel XE#367])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
    - shard-lnl:          [SKIP][428] ([Intel XE#4996]) -> [SKIP][429] ([Intel XE#367])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#2907]) -> [SKIP][431] ([Intel XE#4208]) +2 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-adlp:         [SKIP][432] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][433] ([Intel XE#2351])
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
    - shard-bmg:          [SKIP][434] ([Intel XE#2887]) -> [SKIP][435] ([Intel XE#2231])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
    - shard-lnl:          [SKIP][436] ([Intel XE#2887]) -> [SKIP][437] ([Intel XE#2351])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][439] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#3442]) -> [SKIP][441] ([Intel XE#4208])
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][442] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [INCOMPLETE][443] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][444] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][445] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][447] ([Intel XE#4208]) +10 other tests skip
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     [SKIP][448] ([Intel XE#306]) -> [SKIP][449] ([Intel XE#4208] / [i915#2575])
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_chamelium_color@ctm-0-25.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#373]) -> [SKIP][451] ([Intel XE#4208] / [i915#2575]) +12 other tests skip
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-adlp:         [SKIP][452] ([Intel XE#4996]) -> [SKIP][453] ([Intel XE#373])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-3/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
    - shard-bmg:          [SKIP][454] ([Intel XE#4996]) -> [SKIP][455] ([Intel XE#2252])
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#4208] / [i915#2575]) -> [SKIP][457] ([Intel XE#373])
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
    - shard-lnl:          [SKIP][458] ([Intel XE#4996]) -> [SKIP][459] ([Intel XE#373])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_content_protection@atomic:
    - shard-dg2-set2:     [FAIL][460] ([Intel XE#1178]) -> [SKIP][461] ([Intel XE#4208] / [i915#2575])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_content_protection@atomic.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [SKIP][462] ([Intel XE#2341]) -> [FAIL][463] ([Intel XE#1178])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#307]) -> [SKIP][465] ([Intel XE#4208] / [i915#2575])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     [SKIP][466] ([Intel XE#308]) -> [SKIP][467] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x512.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#455]) -> [SKIP][469] ([Intel XE#4208] / [i915#2575]) +8 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-max-size.html
    - shard-lnl:          [SKIP][470] ([Intel XE#1424]) -> [SKIP][471] ([Intel XE#4996]) +1 other test skip
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-max-size.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-lnl:          [SKIP][472] ([Intel XE#4354]) -> [SKIP][473] ([Intel XE#2351] / [Intel XE#4996])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-7/igt@kms_dp_link_training@uhbr-mst.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_dp_link_training@uhbr-mst.html
    - shard-adlp:         [SKIP][474] ([Intel XE#4356]) -> [SKIP][475] ([Intel XE#4996])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_dp_link_training@uhbr-mst.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_dp_link_training@uhbr-mst.html
    - shard-bmg:          [SKIP][476] ([Intel XE#4354]) -> [SKIP][477] ([Intel XE#2231])
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_dp_link_training@uhbr-mst.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst.html
    - shard-dg2-set2:     [SKIP][478] ([Intel XE#4356]) -> [SKIP][479] ([Intel XE#4208])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_dp_link_training@uhbr-mst.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#455]) -> [SKIP][481] ([Intel XE#2351] / [Intel XE#4208]) +2 other tests skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_dsc@dsc-with-bpc-formats.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-lnl:          [SKIP][482] ([Intel XE#703]) -> [SKIP][483] ([Intel XE#4996])
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-7/igt@kms_feature_discovery@display-3x.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_feature_discovery@display-3x.html
    - shard-adlp:         [SKIP][484] ([Intel XE#703]) -> [SKIP][485] ([Intel XE#4996])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_feature_discovery@display-3x.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_feature_discovery@display-3x.html
    - shard-dg2-set2:     [SKIP][486] ([Intel XE#703]) -> [SKIP][487] ([Intel XE#4208] / [i915#2575])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_feature_discovery@display-3x.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_feature_discovery@display-3x.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][488] ([Intel XE#1138]) -> [SKIP][489] ([Intel XE#4208] / [i915#2575])
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_feature_discovery@display-4x.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][490] ([Intel XE#1137]) -> [SKIP][491] ([Intel XE#4208] / [i915#2575])
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_feature_discovery@psr2:
    - shard-dg2-set2:     [SKIP][492] ([Intel XE#1135]) -> [SKIP][493] ([Intel XE#4208] / [i915#2575])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_feature_discovery@psr2.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_feature_discovery@psr2.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][494] ([Intel XE#3321]) -> [SKIP][495] ([Intel XE#2316])
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [SKIP][496] ([Intel XE#2316]) -> [FAIL][497] ([Intel XE#3321])
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][498] ([Intel XE#301]) -> [SKIP][499] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-lnl:          [SKIP][500] ([Intel XE#1397] / [Intel XE#1745]) -> [SKIP][501] ([Intel XE#2351])
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-lnl:          [SKIP][502] ([Intel XE#2351]) -> [SKIP][503] ([Intel XE#1401] / [Intel XE#1745])
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
    - shard-bmg:          [SKIP][504] ([Intel XE#2231] / [Intel XE#4954]) -> [SKIP][505] ([Intel XE#2293] / [Intel XE#2380])
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][506] ([Intel XE#455]) -> [SKIP][507] ([Intel XE#4208])
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][508] ([Intel XE#2312]) -> [SKIP][509] ([Intel XE#2311]) +13 other tests skip
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-lnl:          [SKIP][510] ([Intel XE#656]) -> [SKIP][511] ([Intel XE#2351] / [Intel XE#4996])
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
    - shard-bmg:          [SKIP][512] ([Intel XE#2311]) -> [SKIP][513] ([Intel XE#2231] / [Intel XE#4954]) +1 other test skip
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][514] ([Intel XE#656]) -> [SKIP][515] ([Intel XE#4947])
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
    - shard-lnl:          [SKIP][516] ([Intel XE#656]) -> [SKIP][517] ([Intel XE#2351])
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][518] ([Intel XE#651]) -> [SKIP][519] ([Intel XE#2351] / [Intel XE#4208]) +11 other tests skip
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][520] ([Intel XE#4141]) -> [SKIP][521] ([Intel XE#2231] / [Intel XE#4954])
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][522] ([Intel XE#2312]) -> [SKIP][523] ([Intel XE#4141]) +8 other tests skip
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][524] ([Intel XE#4141]) -> [SKIP][525] ([Intel XE#2312]) +7 other tests skip
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][526] ([Intel XE#651]) -> [SKIP][527] ([Intel XE#4208]) +27 other tests skip
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [SKIP][528] ([Intel XE#4996]) -> [SKIP][529] ([Intel XE#651])
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
    - shard-bmg:          [SKIP][530] ([Intel XE#2231] / [Intel XE#4954]) -> [SKIP][531] ([Intel XE#2311])
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
    - shard-lnl:          [SKIP][532] ([Intel XE#2351]) -> [SKIP][533] ([Intel XE#651])
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][534] ([Intel XE#2311]) -> [SKIP][535] ([Intel XE#2312]) +14 other tests skip
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][536] ([Intel XE#658]) -> [SKIP][537] ([Intel XE#2351] / [Intel XE#4208])
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         [SKIP][538] ([Intel XE#653]) -> [SKIP][539] ([Intel XE#4996])
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
    - shard-bmg:          [SKIP][540] ([Intel XE#2313]) -> [SKIP][541] ([Intel XE#2231] / [Intel XE#4954])
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][542] ([Intel XE#2312]) -> [SKIP][543] ([Intel XE#2313]) +18 other tests skip
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][544] ([Intel XE#653]) -> [SKIP][545] ([Intel XE#2351] / [Intel XE#4208]) +8 other tests skip
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     [SKIP][546] ([Intel XE#653]) -> [SKIP][547] ([Intel XE#4208]) +28 other tests skip
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][548] ([Intel XE#2313]) -> [SKIP][549] ([Intel XE#2312]) +20 other tests skip
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][550] ([Intel XE#605]) -> [SKIP][551] ([Intel XE#4208] / [i915#2575])
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_getfb@getfb-reject-ccs.html
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-dg2-set2:     [SKIP][552] ([Intel XE#2927]) -> [SKIP][553] ([Intel XE#4208])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_joiner@basic-ultra-joiner.html
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-dg2-set2:     [SKIP][554] ([Intel XE#356]) -> [SKIP][555] ([Intel XE#4208] / [i915#2575])
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane_lowres@tiling-yf:
    - shard-adlp:         [SKIP][556] ([Intel XE#455]) -> [SKIP][557] ([Intel XE#4996]) +1 other test skip
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-8/igt@kms_plane_lowres@tiling-yf.html
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_plane_lowres@tiling-yf.html
    - shard-bmg:          [SKIP][558] ([Intel XE#2393]) -> [SKIP][559] ([Intel XE#4954])
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@kms_plane_lowres@tiling-yf.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_plane_lowres@tiling-yf.html
    - shard-lnl:          [SKIP][560] ([Intel XE#599]) -> [SKIP][561] ([Intel XE#4996])
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-7/igt@kms_plane_lowres@tiling-yf.html
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_plane_lowres@tiling-yf.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     [SKIP][562] ([Intel XE#5021]) -> [SKIP][563] ([Intel XE#4208] / [i915#2575])
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_plane_multiple@2x-tiling-y.html
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][564] ([Intel XE#5020]) -> [SKIP][565] ([Intel XE#4208] / [i915#2575])
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_plane_multiple@tiling-y.html
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][566] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][567] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][568] ([Intel XE#870]) -> [SKIP][569] ([Intel XE#4208])
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     [SKIP][570] ([Intel XE#908]) -> [SKIP][571] ([Intel XE#2351] / [Intel XE#4208])
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][572] ([Intel XE#1489]) -> [SKIP][573] ([Intel XE#4208]) +9 other tests skip
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-dg2-set2:     [SKIP][574] ([Intel XE#1122]) -> [SKIP][575] ([Intel XE#4208])
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_psr2_su@page_flip-p010.html
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-bmg:          [SKIP][576] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][577] ([Intel XE#2231] / [Intel XE#4954]) +1 other test skip
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_psr@fbc-psr-sprite-render.html
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_psr@fbc-psr-sprite-render.html
    - shard-adlp:         [SKIP][578] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][579] ([Intel XE#4996])
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-9/igt@kms_psr@fbc-psr-sprite-render.html
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][580] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][581] ([Intel XE#4208]) +11 other tests skip
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-dg2-set2:     [SKIP][582] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][583] ([Intel XE#2351] / [Intel XE#4208]) +4 other tests skip
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_psr@pr-primary-page-flip.html
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-adlp:         [SKIP][584] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][585] ([Intel XE#4947])
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-8/igt@kms_psr@psr2-sprite-plane-move.html
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][586] ([Intel XE#2939]) -> [SKIP][587] ([Intel XE#2351] / [Intel XE#4208])
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][588] ([Intel XE#3414]) -> [SKIP][589] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][590] ([Intel XE#2330]) -> [SKIP][591] ([Intel XE#4954])
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-dg2-set2:     [SKIP][592] ([Intel XE#1127]) -> [SKIP][593] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-lnl:          [SKIP][594] ([Intel XE#1127]) -> [SKIP][595] ([Intel XE#4996])
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-4/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-adlp:         [SKIP][596] ([Intel XE#3414]) -> [SKIP][597] ([Intel XE#4950] / [Intel XE#4996])
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-9/igt@kms_rotation_crc@sprite-rotation-90.html
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-bmg:          [SKIP][598] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][599] ([Intel XE#4954])
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90.html
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html
    - shard-lnl:          [SKIP][600] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][601] ([Intel XE#4996])
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@kms_rotation_crc@sprite-rotation-90.html
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          [SKIP][602] ([Intel XE#4954]) -> [SKIP][603] ([Intel XE#1435])
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-adlp:         [SKIP][604] ([Intel XE#4996]) -> [SKIP][605] ([Intel XE#455]) +1 other test skip
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_setmode@clone-exclusive-crtc.html
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-9/igt@kms_setmode@clone-exclusive-crtc.html
    - shard-lnl:          [SKIP][606] ([Intel XE#4996]) -> [SKIP][607] ([Intel XE#1435])
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@kms_setmode@clone-exclusive-crtc.html
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][608] ([Intel XE#1729]) -> [SKIP][609] ([Intel XE#4208] / [i915#2575])
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern.html
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][610] ([Intel XE#756]) -> [SKIP][611] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_ccs@block-multicopy-compressed:
    - shard-adlp:         [SKIP][612] ([Intel XE#4996]) -> [SKIP][613] ([Intel XE#455] / [Intel XE#488])
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_ccs@block-multicopy-compressed.html
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-3/igt@xe_ccs@block-multicopy-compressed.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][614] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][615] ([Intel XE#4208]) +1 other test skip
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     [SKIP][616] ([Intel XE#1126]) -> [SKIP][617] ([Intel XE#4208])
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x369.html
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-adlp:         [SKIP][618] ([Intel XE#4837]) -> [SKIP][619] ([Intel XE#4945] / [Intel XE#4996])
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
    - shard-bmg:          [SKIP][620] ([Intel XE#4837]) -> [SKIP][621] ([Intel XE#4954])
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
    - shard-lnl:          [SKIP][622] ([Intel XE#4837]) -> [SKIP][623] ([Intel XE#4996])
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         [SKIP][624] ([Intel XE#688]) -> [SKIP][625] ([Intel XE#4996])
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-3/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
    - shard-lnl:          [SKIP][626] ([Intel XE#688]) -> [SKIP][627] ([Intel XE#4996])
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-3/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:
    - shard-adlp:         [SKIP][628] ([Intel XE#1392]) -> [SKIP][629] ([Intel XE#4996]) +1 other test skip
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-8/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
    - shard-bmg:          [SKIP][630] ([Intel XE#2322]) -> [SKIP][631] ([Intel XE#4954]) +1 other test skip
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
    - shard-dg2-set2:     [SKIP][632] ([Intel XE#1392]) -> [SKIP][633] ([Intel XE#4208])
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
    - shard-lnl:          [SKIP][634] ([Intel XE#1392]) -> [SKIP][635] ([Intel XE#4996]) +1 other test skip
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:
    - shard-adlp:         [SKIP][636] ([Intel XE#4996]) -> [SKIP][637] ([Intel XE#288]) +1 other test skip
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html
    - shard-dg2-set2:     [SKIP][638] ([Intel XE#4208]) -> [SKIP][639] ([Intel XE#288])
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][640] ([Intel XE#288]) -> [SKIP][641] ([Intel XE#4208]) +33 other tests skip
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     [SKIP][642] ([Intel XE#2360]) -> [SKIP][643] ([Intel XE#4208])
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-dg2-set2:     [SKIP][644] ([Intel XE#4837]) -> [SKIP][645] ([Intel XE#4208]) +15 other tests skip
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@xe_exec_sip_eudebug@breakpoint-writesip.html
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset:
    - shard-adlp:         [SKIP][646] ([Intel XE#4915]) -> [SKIP][647] ([Intel XE#4996]) +6 other tests skip
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-2/igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset.html
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset.html

  * igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race:
    - shard-adlp:         [SKIP][648] ([Intel XE#4996]) -> [SKIP][649] ([Intel XE#4915]) +2 other tests skip
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race.html
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-3/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race.html
    - shard-dg2-set2:     [SKIP][650] ([Intel XE#4208]) -> [SKIP][651] ([Intel XE#4915]) +1 other test skip
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race.html
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race.html

  * igt@xe_exec_system_allocator@many-mmap-huge-nomemset:
    - shard-lnl:          [SKIP][652] ([Intel XE#4943]) -> [SKIP][653] ([Intel XE#4996])
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-4/igt@xe_exec_system_allocator@many-mmap-huge-nomemset.html
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@xe_exec_system_allocator@many-mmap-huge-nomemset.html
    - shard-bmg:          [SKIP][654] ([Intel XE#4943]) -> [SKIP][655] ([Intel XE#4996])
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@xe_exec_system_allocator@many-mmap-huge-nomemset.html
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@xe_exec_system_allocator@many-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-many-stride-mmap-nomemset:
    - shard-adlp:         [SKIP][656] ([Intel XE#4945]) -> [SKIP][657] ([Intel XE#4915])
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec_system_allocator@threads-many-stride-mmap-nomemset.html
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@xe_exec_system_allocator@threads-many-stride-mmap-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:
    - shard-dg2-set2:     [SKIP][658] ([Intel XE#4915]) -> [SKIP][659] ([Intel XE#4208]) +223 other tests skip
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     [FAIL][660] ([Intel XE#5012]) -> [SKIP][661] ([Intel XE#4208])
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_oa@invalid-oa-format-id:
    - shard-adlp:         [SKIP][662] ([Intel XE#4996]) -> [SKIP][663] ([Intel XE#2541] / [Intel XE#3573])
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_oa@invalid-oa-format-id.html
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@xe_oa@invalid-oa-format-id.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     [SKIP][664] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][665] ([Intel XE#4208]) +7 other tests skip
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@xe_oa@non-privileged-map-oa-buffer.html
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     [SKIP][666] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) -> [SKIP][667] ([Intel XE#4208]) +1 other test skip
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@xe_oa@syncs-ufence-wait-cfg.html
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][668] ([Intel XE#979]) -> [SKIP][669] ([Intel XE#4208])
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][670] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][671] ([Intel XE#4208]) +2 other tests skip
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@xe_pm@d3cold-basic-exec.html
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][672] ([Intel XE#2284]) -> [SKIP][673] ([Intel XE#4208])
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@xe_pm@d3cold-mocs.html
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pmu@fn-engine-activity-sched-if-idle:
    - shard-lnl:          [SKIP][674] ([Intel XE#4650]) -> [SKIP][675] ([Intel XE#4996])
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [675]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
    - shard-bmg:          [SKIP][676] ([Intel XE#4650]) -> [SKIP][677] ([Intel XE#4954])
   [676]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [677]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
    - shard-dg2-set2:     [SKIP][678] ([Intel XE#4650]) -> [SKIP][679] ([Intel XE#4208])
   [678]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_pmu@fn-engine-activity-sched-if-idle.html
   [679]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_pmu@fn-engine-activity-sched-if-idle.html

  * igt@xe_pxp@pxp-stale-bo-bind-post-rpm:
    - shard-dg2-set2:     [SKIP][680] ([Intel XE#4733]) -> [SKIP][681] ([Intel XE#4208]) +3 other tests skip
   [680]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html
   [681]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_pxp@pxp-stale-bo-bind-post-rpm.html

  * igt@xe_query@multigpu-query-uc-fw-version-guc:
    - shard-dg2-set2:     [SKIP][682] ([Intel XE#944]) -> [SKIP][683] ([Intel XE#4208]) +2 other tests skip
   [682]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@xe_query@multigpu-query-uc-fw-version-guc.html
   [683]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_query@multigpu-query-uc-fw-version-guc.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     [SKIP][684] ([Intel XE#4130]) -> [SKIP][685] ([Intel XE#4208]) +1 other test skip
   [684]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
   [685]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1135]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1135
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2350]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2350
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2373
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2459
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2596
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3307
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3701
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4164]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4164
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4351
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4418]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4418
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4626]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4626
  [Intel XE#4650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4650
  [Intel XE#4677]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4677
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#4792]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4792
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4954]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954
  [Intel XE#4983]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4983
  [Intel XE#4996]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996
  [Intel XE#5012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5012
  [Intel XE#5017]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5017
  [Intel XE#5020]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5020
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8359 -> IGT_8361
  * Linux: xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9 -> xe-pw-148868v1

  IGT_8359: 807f0cbcc771d1d0bb0d27a78231a5f92dc02126 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8361: 8361
  xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9: b0db97d4270c697ade930cfefdb7aaef12cd80c9
  xe-pw-148868v1: 148868v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/index.html

--===============1327111743045841613==
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
<tr><td><b>Series:</b></td><td>drm/xe: Reduce DPT table alignment as in i91=
5</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/148868/">https://patchwork.freedesktop.org/series/148868/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148868v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148868v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3060-b0db97d4270c697ade930cfefdb7aaef1=
2cd80c9_FULL -&gt; xe-pw-148868v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-148868v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-148868v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1488=
68v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-7/igt@kms_async_flips@async-flip-su=
spend-resume@pipe-c-dp-2.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a=
-3-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-1/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-tiled@pipe-a-hdmi-a-3-4.html">PASS=
</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14886=
8v1/shard-bmg-3/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@=
pipe-a-hdmi-a-3-4.html">DMESG-WARN</a> +19 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_asyn=
c_flips@crc.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_async_flips@crc.html">DMESG-F=
AIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@kms_async_flips@crc-atomic@pi=
pe-a-dp-2.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-180.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/i=
gt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a></=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-8/igt@kms_pm_=
rpm@universal-planes.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_pm_rpm@universal-pl=
anes.html">SKIP</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_curs=
or_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@km=
s_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_feat=
ure_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3060-b0db97d4270c697ade930cfef=
db7aaef12cd80c9_FULL and xe-pw-148868v1_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_addfb_basic:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-148868v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@fbdev@unaligned-write:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@fbdev@un=
aligned-write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@fbdev@unaligned-write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134"=
>Intel XE#2134</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-3/igt@fbdev@u=
naligned-write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@fbdev@unaligned-write.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/213=
4">Intel XE#2134</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@fbdev@=
unaligned-write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@fbdev@unaligned-write.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
134">Intel XE#2134</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-3/igt@fbdev@un=
aligned-write.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@fbdev@unaligned-write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134"=
>Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-7/igt@kms_async_flips@alternate-syn=
c-async-flip-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3701">Intel XE#3701</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-7/igt@kms_async_flips@alternate-syn=
c-async-flip-atomic@pipe-b-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d=
-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events-tiled-atomic@pipe-d-hdmi-a-1-y.ht=
ml">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148868v1/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-even=
ts-tiled-atomic@pipe-d-hdmi-a-1-y.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +5 oth=
er tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_asyn=
c_flips@crc-atomic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@kms_async_flips@crc-atomic=
.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4626">Intel XE#4626</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@kms_async_flips@crc-atomic@pi=
pe-c-dp-2.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4626">Intel XE#4626</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_asyn=
c_flips@crc-atomic@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@kms_async_=
flips@crc-atomic@pipe-c-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4677">Intel XE#4677</a>) +2 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_asyn=
c_flips@crc@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_async_flips@c=
rc@pipe-d-hdmi-a-3.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3884">Intel XE#3884</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@kms_async_flips@invalid-asy=
nc-flip-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_big_=
fb@4-tiled-addfb-size-offset-overflow.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_big=
_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#499=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-3/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/sh=
ard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async=
-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-463/igt@kms_big_fb@linear-16bpp-rot=
ate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-9/igt@kms_big_fb@linear-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-6/igt@kms_big_fb@x-tiled-64bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-st=
ride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1467">Intel XE#1467</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-s=
tride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/i=
gt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">In=
tel XE#4543</a>) +10 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other=
 tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-8/igt@kms_bw@connected-linear-tilin=
g-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_bw@connected-linear-tilin=
g-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_bw@connected-linear-tili=
ng-2-displays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@kms_bw@linear-tiling-2-disp=
lays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_bw@linear-tiling-3-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_bw@linear-tiling-4-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@kms_bw@linear-tiling-4-displ=
ays-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@kms_bw@linear-tiling-4-displa=
ys-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_cc=
s@bad-rotation-90-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/igt@kms_ccs@crc-primary-basic-y=
-tiled-gen12-rc-ccs-cc@pipe-a-dp-4.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +83 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-2/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-=
4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-y=
f-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_ccs@crc-sprite-planes-ba=
sic-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +20 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-434/igt@kms_ccs@crc-sprite-planes-b=
asic-y-tiled-gen12-rc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-43=
3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727=
">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-46=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124=
">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg=
2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">=
DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-ti=
led-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2907">Intel XE#2907</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_ccs@random-ccs-data-4-til=
ed-lnl-ccs@pipe-d-hdmi-a-3.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@kms_cdclk@mode-transition-a=
ll-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4418">Intel XE#4418</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@kms_cdclk@plane-scaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-7/igt@kms_chamelium_color@ctm-0-50.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_chamelium_color@degamma.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-466/igt@kms_chamelium_color@degamma=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@kms_chamelium_color@degamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_chamelium_edid@hdmi-edid=
-read.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm-disable:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_chamelium_hpd@dp-hpd-stor=
m-disable.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd-=
storm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd-=
with-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +22 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-with-enabled-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-wit=
h-enabled-mode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@kms_content_protection@atomic=
-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_content_protection@legac=
y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@kms_content_protection@lic-=
type-0.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1178">Intel XE#1178</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@kms_content_protection@lic-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3278">Intel XE#3278</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_content_protection@lic-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@kms_content_protection@lic-=
type-0@pipe-a-dp-4.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x32:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_cursor_crc@cursor-offscre=
en-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_cursor_crc@cursor-offscre=
en-32x32.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_cursor=
_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +7 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_cursor_legacy@basic-busy=
-flip-before-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-=
flipa-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_curs=
or_legacy@flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@kms_cursor_le=
gacy@flip-vs-cursor-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@kms_dp_a=
ux_dev.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-463/igt@kms_dp_link_training@non-uh=
br-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-3/igt@kms_dsc@dsc-with-output-forma=
ts.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-7/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-dirtyfb-tests.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@kms_fbcon_fbt@psr-suspend.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/776">Intel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@kms_feature_discovery@psr1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1135">Intel XE#1135</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_feature_discovery@psr1.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2374">Intel XE#2374</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@kms_feature_discovery@psr1.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1135">Intel XE#1135</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2316">Intel XE#2316</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-v=
blank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other te=
sts fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@kms_flip@2x-plain-flip-fb-re=
create-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_flip@2x-wf_vblank-ts-chec=
k.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_fl=
ip@busy-flip.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_flip@busy-flip.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">I=
ntel XE#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kerne=
l/-/issues/2575">i915#2575</a>) +118 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-dpms-on-nop@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-8/igt@kms_flip@flip-vs-dpms-on-nop@=
a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@a-dp2.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@k=
ms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-dp4.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/=
igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#3=
01</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-1/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-8/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_fl=
ip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-463/igt@kms_flip@f=
lip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a=
>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-7/igt@kms_flip@flip-vs-suspend-inte=
rruptible@d-hdmi-a3.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend@a-=
dp2.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bp=
p-linear-to-64bpp-linear-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bp=
p-linear-to-64bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE=
#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_fli=
p_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shar=
d-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscalin=
g.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2351">Intel XE#2351</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_flip=
_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard=
-bmg-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2231">Intel XE#2231</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4954">Intel XE#4954</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE=
#2380</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">In=
tel XE#1401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 =
other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE=
#1745</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-valid-mode.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Inte=
l XE#2293</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@kms_force_connector_basic@pru=
ne-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/igt@kms_frontbuffer_tracking@dr=
rs-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +12 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs=
-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs=
-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc=
drrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-spr-indfb-fullscreen:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +13 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcp=
sr-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
psr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcp=
sr-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@kms_frontbuffer_tracking@pl=
ane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1158">Intel XE#1158</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@plan=
e-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2350">Intel XE#2350</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@kms_frontbuffer_tracking@ps=
r-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_hdr@=
static-toggle-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_hdr@static-toggle-s=
uspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1503">Intel XE#1503</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-9/igt@kms_joiner@basic-force-ultra=
-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2934">Intel XE#2934</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@kms_joiner@basic-force-ultr=
a-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2925">Intel XE#2925</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-6/igt@kms_joiner@basic-force-ultra-=
joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@kms_joiner@invalid-modeset-b=
ig-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_joiner@invalid-modeset-ul=
tra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lease-uevent:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-9/igt@kms_lea=
se@lease-uevent.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_lease@lease-uevent.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-2-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-2-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_plane_lowres@tiling-none@=
pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/599">Intel XE#599</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_plan=
e_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_plane_scal=
ing@2x-scaler-multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_plane_scaling@intel-max-s=
rc-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3307">Intel XE#3307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-dp-4.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@kms_plane_scaling@intel-max=
-src-size@pipe-a-hdmi-a-6.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>) +1 other test abort=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-c:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_plane_scaling@planes-dow=
nscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@p=
ipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-466/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-upscale-factor-0-25@pipe-d.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25@p=
ipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +=
19 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/igt@kms_plane_scaling@planes-up=
scale-factor-0-25-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)=
 +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75@p=
ipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@kms_plane_scaling@planes-upsc=
ale-factor-0-25-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +=
7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">=
Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_pm_rpm@dpms-lpsp.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439=
">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@get_properties-sanity-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@kms_properties@get_propertie=
s-sanity-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5017">Intel XE#5017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@get_properties-sanity-non-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-463/igt@kms_properties@get_properti=
es-sanity-non-atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/5017">Intel XE#5017</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf@pipe-a-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-1/igt@kms_psr2_sf@pr-overlay-plane=
-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_psr2_sf@pr-overlay-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-8/igt@kms_psr2_sf@pr-overlay-plane-=
update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@kms_psr2_sf@psr2-overlay-pl=
ane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@kms_psr@=
fbc-psr-sprite-render.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_psr@fbc-psr-sprite-=
render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@kms_psr@fbc-psr2-cursor-rende=
r@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-434/igt@kms_psr@pr-sprite-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@kms_psr@psr2-sprite-blt.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2850">Intel XE#2850</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-3/igt@kms_psr@=
psr2-sprite-plane-move.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_psr@psr2-sprite-pl=
ane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@kms_psr@psr2-suspend.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/285=
0">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/929">Intel XE#929</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-bottom:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@kms_rotation_crc@multiplane-=
rotation-cropping-bottom.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-2/igt@kms_rot=
ation_crc@primary-y-tiled-reflect-x-0.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#499=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-3/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test=
 skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-3/igt@kms_rotation_crc@sprite-rota=
tion-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_scaling_modes@scaling-mod=
e-full.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_vrr@flipline.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">In=
tel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy-new-ctx:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@xe_ccs@ctrl-surf-copy-new-ct=
x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-3/igt@xe_copy_basic@mem-set-linear=
-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linea=
r-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@xe_eu_stall@blocking-read.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4497">Intel XE#4497</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-434/igt@xe_eu_stall@blocking-read.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-read-event:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-7/igt@xe_eudebug@basic-read-event.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@xe_eudebug@basic-vm-bind-meta=
data-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@read-metadata:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@xe_eudebug@read-metadata.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4837">Intel XE#4837</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@resume-dss:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@xe_eudebug_online@resume-ds=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@xe_eudebug_sriov@deny-sriov.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4518">Intel XE#4518</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/igt@xe_eudebug_sriov@deny-sriov=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-1/igt@xe_evict@evict-beng-large-ex=
ternal-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@xe_evict_ccs@evict-overcommit=
-parallel-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_exec_balancer@once-paral=
lel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4208">Intel XE#4208</a>) +98 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@twice-virtual-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_exe=
c_balancer@twice-virtual-basic.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_exec_bala=
ncer@twice-virtual-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +225 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/sha=
rd-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-m=
map.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-6/igt@xe_exec_basic@multigpu-no-ex=
ec-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exe=
c-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-1/igt@xe_exec_=
compute_mode@once-bindexecqueue-userptr-rebind.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/ig=
t@xe_exec_compute_mode@once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE=
#4954</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4996">Intel XE#4996</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-=
race-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@xe_exec_fault_mode@many-exec=
queues-bindexecqueue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#49=
96</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@xe_exec_fault_mode@once-user=
ptr-invalidate-race-imm.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@xe_exec_fault_mode@twice-us=
erptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-3/igt@xe_exec_mix_modes@exec-spinn=
er-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-spin=
ner-interrupted-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@xe_exec_system_allocator@many=
-execqueues-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +13 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-free-race-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-434/igt@xe_exec_system_allocator@pr=
ocess-many-mmap-free-race-nomemset.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +65 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-shared-nomemset:</=
p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@xe_exec_system_allocator@proc=
ess-many-stride-mmap-shared-nomemset.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@processes-evict-malloc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@xe_exec_system_allocator@pro=
cesses-evict-malloc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +86 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-large-new-nomemset:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@xe_exec_=
system_allocator@threads-many-large-new-nomemset.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/=
igt@xe_exec_system_allocator@threads-many-large-new-nomemset.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Inte=
l XE#4996</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-free-hug=
e-nomemset:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-2/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-stride-mmap-free-huge-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943=
</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@xe_exec_=
threads@threads-bal-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/=
igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Inte=
l XE#4954</a>) +11 other tests skip</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@xe_exec=
_threads@threads-bal-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-=
2/igt@xe_exec_threads@threads-bal-shared-vm-userptr-invalidate.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">In=
tel XE#4996</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec=
_threads@threads-hang-rebind-err.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@xe_exec_thr=
eads@threads-hang-rebind-err.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-3/igt@xe_faul=
t_injection@inject-fault-probe-function-xe_guc_log_init.html">PASS</a> -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard=
-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_log_init.=
html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4792">Intel XE#4792</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-3/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2459">Intel XE#2459</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2596">Intel XE#2596</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-object:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@xe_mmap@pci-membarrier-bad-o=
bject.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4045">Intel XE#4045</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@xe_mmap@pci-membarrier-bad-ob=
ject.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/4045">Intel XE#4045</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@xe_oa@buffer-fill.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">=
Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@xe_oa@closed-fd-and-unmappe=
d-access.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">=
Intel XE#2427</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@xe_peer2peer@write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061"=
>Intel XE#1061</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">=
Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@xe_pm@d3cold-multiple-execs.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@xe_pm@s4=
-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148868v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-load:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@xe_pmu@fn-engine-activity-loa=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4650">Intel XE#4650</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-optout:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@xe_pxp@pxp-optout.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">=
Intel XE#4733</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@xe_pxp@pxp-optout.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">I=
ntel XE#4733</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@xe_pxp@pxp-optout.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733"=
>Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-433/igt@xe_query@multigpu-query-cs-=
cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-3/igt@xe_query@multigpu-query-inva=
lid-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@xe_query@multigpu-query-inval=
id-extension.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/igt@xe_query@multigpu-query-topol=
ogy-l3-bank-mask.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-4/igt@xe_spin_=
batch@spin-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@xe_spin_batch@spin-basic.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4996">Intel XE#4996</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-4/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@xe_sriov_auto_provisioning@se=
lfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other te=
st skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-dg2-434/igt@xe_sriov_auto_provisioning@=
selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@xe_sriov_scheduling@equal-thr=
oughput.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4351">Intel XE#4351</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>{igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe=
-c-edp-1}:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-7/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911=
">Intel XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-148868v1/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-fli=
p-events-linear-atomic@pipe-c-edp-1.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148868v1/shard-bmg-3/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_cur=
sor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/sh=
ard-adlp-8/igt@kms_cursor_crc@cursor-suspend@pipe-a-hdmi-a-1.html">PASS</a>=
 +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_curs=
or_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel =
XE#2291</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148868v1/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-trans=
itions-varying-size.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_curs=
or_legacy@flip-vs-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/ig=
t@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> +7 other tests pas=
s</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_cu=
rsor_legacy@flip-vs-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1=
/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> +=
2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_dp_l=
ink_training@non-uhbr-sst.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@kms_d=
p_link_training@non-uhbr-sst.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-7/igt@kms_fbco=
n_fbt@psr-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4164">Intel XE#4164</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-2/igt@kms_fbcon_fbt=
@psr-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_feat=
ure_discovery@display-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2373">Intel XE#2373</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-3/igt@kms_fe=
ature_discovery@display-2x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg=
-2/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">PASS</a> +11 oth=
er tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@kms_flip=
@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/ig=
t@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> +1 other test p=
ass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@kms_flip=
@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/sha=
rd-bmg-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-1/igt@kms_flip=
@flip-vs-suspend.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-=
1/igt@kms_flip@flip-vs-suspend.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-2/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">In=
tel XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148868v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16=
bpp-xtile-downscaling.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">In=
tel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4921">Intel XE#4921</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64b=
pp-ytile-to-32bpp-ytile-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_hdr@=
static-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_hdr@static-to=
ggle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_join=
er@basic-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-7/igt@kms_j=
oiner@basic-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_pla=
ne_scaling@plane-scaler-unity-scaling-with-pixel-format.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#=
4950</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148868v1/shard-adlp-8/igt@kms_plane_scaling@plane-scaler-unity-scaling-with=
-pixel-format.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@kms_pm_d=
c@dc5-psr.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_pm_dc@dc5-psr.html"=
>PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_pm_=
dc@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_setm=
ode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bm=
g-2/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-ra=
ce:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-userptr-invalidate-race.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">=
Intel XE#1392</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-148868v1/shard-dg2-435/igt@xe_exec_basic@multigpu-many-execqueues-=
many-vm-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-userptr-unmap:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec=
_compute_mode@many-execqueues-userptr-unmap.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/sha=
rd-adlp-1/igt@xe_exec_compute_mode@many-execqueues-userptr-unmap.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@xe_exec_=
fault_mode@many-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-8/=
igt@xe_exec_fault_mode@many-userptr-invalidate.html">PASS</a> +16 other tes=
ts pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@spin-signaled:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec=
_reset@spin-signaled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@xe_exec_r=
eset@spin-signaled.html">PASS</a> +5 other tests pass</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@xe_exec_=
reset@spin-signaled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4954">Intel XE#4954</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-8/i=
gt@xe_exec_reset@spin-signaled.html">PASS</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_exe=
c_reset@spin-signaled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-434/igt@xe_exec=
_reset@spin-signaled.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard=
-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9=
/shard-dg2-434/igt@xe_module_load@load.html">SKIP</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12=
cd80c9/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7=
aaef12cd80c9/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930=
cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697=
ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d42=
70c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0d=
b97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-30=
60-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-d=
g2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/s=
hard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd=
80c9/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfefdb7aa=
ef12cd80c9/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade930cfe=
fdb7aaef12cd80c9/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c697ade=
930cfefdb7aaef12cd80c9/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97d4270c=
697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-b0db97=
d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-3060-=
b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@xe_m=
odule_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; (<a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-148868v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-43=
3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-466/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8868v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/sh=
ard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-466/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-148868v1/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-4=
36/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48868v1/shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-463/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148868v1/shard-dg2-436/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/s=
hard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-432/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-148868v1/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-=
435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-435/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148868v1/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-434/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-148868v1/shard-dg2-434/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/=
shard-dg2-435/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-9/igt@xe_pm@s=
4-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-3/igt@xe_pm@s4-basic.html">=
PASS</a> +1 other test pass</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-2/igt@xe_pm@s4=
-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/igt@xe_pm@s4-basic.html">PA=
SS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-4194304:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@xe_vm@la=
rge-split-misaligned-binds-4194304.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/=
igt@xe_vm@large-split-misaligned-binds-4194304.html">PASS</a> +8 other test=
s pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_asy=
nc_flips@crc-atomic.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@kms_=
async_flips@crc-atomic.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4626">Intel XE#4626</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_asy=
nc_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-=
4/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">DMESG-FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4=
543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/46=
26">Intel XE#4626</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_as=
ync_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@km=
s_async_flips@invalid-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_big=
_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp=
-2/igt@kms_big_fb@4-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#499=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-2/igt@kms_big=
_fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel=
 XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148868v1/shard-adlp-2/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate=
-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-1/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel =
XE#3658</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148868v1/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-1=
80-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_bi=
g_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@km=
s_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@km=
s_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@kms_bi=
g_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@=
kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@kms_bi=
g_fb@yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_big_fb@=
yf-tiled-addfb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg=
2-464/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_bi=
g_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Int=
el XE#1124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-148868v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-ro=
tate-180-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +10 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_bw@=
connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/s=
hard-adlp-3/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/21=
91">Intel XE#2191</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/sh=
ard-lnl-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191=
">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_bw=
@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-46=
4/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575=
">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_bw@=
linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-=
1/igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)=
</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_bw@l=
inear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-3/=
igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</=
li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@kms_bw@l=
inear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-3/=
igt@kms_bw@linear-tiling-3-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_cc=
s@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464=
/igt@kms_ccs@bad-rotation-90-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-9/igt@kms_ccs=
@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868=
v1/shard-adlp-2/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">=
Intel XE#2351</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_ccs@=
crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-=
1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231=
</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@kms_ccs@=
crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-=
1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@kms_cc=
s@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</=
a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">In=
tel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-148868v1/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-y-tiled-g=
en12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +4 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2=
-464/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-148868v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-d=
g2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel X=
E#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-466/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel X=
E#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_cc=
s@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/=
shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_ch=
amelium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_cham=
elium_color@ctm-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_ch=
amelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/=
igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i9=
15#2575</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_cha=
melium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-3/=
igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_cham=
elium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-5/ig=
t@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_ch=
amelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v=
1/shard-dg2-436/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel=
 XE#373</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@kms_cham=
elium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-2/ig=
t@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_co=
ntent_protection@atomic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_c=
ontent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_cont=
ent_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-2/igt@kms_=
content_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_co=
ntent_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@=
kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_cu=
rsor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt=
@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_cu=
rsor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/=
igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915=
#2575</a>) +8 other tests skip</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-4/igt@kms_curs=
or_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/ig=
t@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-7/igt@kms_dp_l=
ink_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_dp_li=
nk_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_dp_=
link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_dp_=
link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_dp_l=
ink_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_dp_li=
nk_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_dp=
_link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_d=
p_link_training@uhbr-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_ds=
c@dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_dsc@=
dsc-with-bpc-formats.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-7/igt@kms_feat=
ure_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_feat=
ure_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@kms_fea=
ture_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_fe=
ature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_=
feature_discovery@display-3x.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_fe=
ature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@km=
s_feature_discovery@display-4x.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_fe=
ature_discovery@dp-mst.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@psr2:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_fe=
ature_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1135">Intel XE#1135</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_feat=
ure_discovery@psr2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_flip=
@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_=
flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-=
bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel =
XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@kms_fl=
ip@flip-vs-expired-vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_f=
lip@flip-vs-expired-vblank.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 ot=
her test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-2/igt@kms_flip=
_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#=
1397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
745">Intel XE#1745</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-xtile=
-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@kms_flip=
_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel X=
E#2351</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148868v1/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-y=
ftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_flip=
_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel X=
E#2231</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4954">Intel XE#4954</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-148868v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yft=
ile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_fl=
ip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148868v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-yt=
ile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/sh=
ard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311=
">Intel XE#2311</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/=
shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4996">Intel XE#4996</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v=
1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2231">Intel XE#2231</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4954">Intel XE#4954</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-9/igt@kms_fro=
ntbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48868v1/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-2/igt@kms_fron=
tbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#6=
56</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8868v1/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt=
@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#420=
8</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-3/igt@kms_fron=
tbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#=
4141</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
148868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb=
-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48868v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v=
1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel=
 XE#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-148868v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-=
cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4=
996</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48868v1/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/651">Intel XE#651</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#22=
31</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/495=
4">Intel XE#4954</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-148868v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pr=
imscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@kms_fron=
tbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#23=
51</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8868v1/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-m=
sflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel=
 XE#2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-148868v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-c=
ur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@kms_fr=
ontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464=
/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Inte=
l XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel X=
E#653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148868v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel X=
E#2313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-148868v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-=
indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48868v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#=
653</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48868v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +8 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868=
v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#23=
13</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8868v1/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2312">Intel XE#2312</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_ge=
tfb@getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_getfb@=
getfb-reject-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_jo=
iner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_j=
oiner@basic-ultra-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@kms_mu=
ltipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg=
2-464/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/iss=
ues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-yf:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-8/igt@kms_pla=
ne_lowres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@kms_plane_lo=
wres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4996">Intel XE#4996</a>) +1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-2/igt@kms_plan=
e_lowres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2393">Intel XE#2393</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/igt@kms_plane_lo=
wres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4954">Intel XE#4954</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-7/igt@kms_plan=
e_lowres@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/599">Intel XE#599</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/igt@kms_plane_lowr=
es@tiling-yf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@kms_pl=
ane_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_=
plane_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@kms_pl=
ane_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5020">Intel XE#5020</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_pla=
ne_multiple@tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_pl=
ane_scaling@planes-upscale-20x20-downscale-factor-0-25.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2=
763</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_plane_scaling@planes-upscale-20x2=
0-downscale-factor-0-25.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_pm=
_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@km=
s_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_pm=
_dc@dc6-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/908">Intel XE#908</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_pm_dc@dc6-dpms=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2351">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_ps=
r2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1=
489</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48868v1/shard-dg2-464/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exce=
ed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4208">Intel XE#4208</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@kms_ps=
r2_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@kms_psr2=
_su@page_flip-p010.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_psr@=
fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1=
/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a=
>) +1 other test skip</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-9/igt@kms_psr=
@fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2=
/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_ps=
r@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2=
-464/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +11 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_ps=
r@pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-46=
4/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-8/igt@kms_psr=
@psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-=
2/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_ps=
r_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/s=
hard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@kms_ro=
tation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@k=
ms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-8/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-=
1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954=
</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg=
2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a> / <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issue=
s/2575">i915#2575</a>) +1 other test skip</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-4/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-=
1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-9/igt@kms_rot=
ation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-2/igt@k=
ms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a=
>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@kms_rota=
tion_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard=
-bmg-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a>)=
</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@kms_rota=
tion_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard=
-lnl-1/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@kms_setm=
ode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4954">Intel XE#4954</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-4/igt@kms_se=
tmode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@kms_set=
mode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-9/igt@kms_=
setmode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip<=
/li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@kms_setm=
ode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-5/igt@kms_se=
tmode@clone-exclusive-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@kms_ti=
led_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/=
igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2=
575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@kms_wr=
iteback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464=
/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">=
i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-multicopy-compressed:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_ccs@=
block-multicopy-compressed.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-3/igt@xe_=
ccs@block-multicopy-compressed.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_com=
pute_preempt@compute-preempt-many.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/s=
hard-dg2-464/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE=
#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_cop=
y_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@=
xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-1/igt@xe_eude=
bug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-ad=
lp-2/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4=
945</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
96">Intel XE#4996</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-5/igt@xe_eudeb=
ug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg=
-1/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#495=
4</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-8/igt@xe_eudeb=
ug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl=
-1/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#499=
6</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-3/igt@xe_evic=
t_ccs@evict-overcommit-standalone-nofree-reopen.html">SKIP</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/s=
hard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4996">Intel XE#4996</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-3/igt@xe_evict=
_ccs@evict-overcommit-standalone-nofree-reopen.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/sh=
ard-lnl-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
96">Intel XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-8/igt@xe_exec=
_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/sh=
ard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996=
">Intel XE#4996</a>) +1 other test skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-4/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/sha=
rd-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4954">=
Intel XE#4954</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/s=
hard-dg2-464/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>)</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-3/igt@xe_exec_=
basic@multigpu-many-execqueues-many-vm-null.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/sha=
rd-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">=
Intel XE#4996</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec=
_fault_mode@twice-bindexecqueue-userptr-imm.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/sha=
rd-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">I=
ntel XE#288</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_exe=
c_fault_mode@twice-bindexecqueue-userptr-imm.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/sh=
ard-dg2-433/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-imm.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288"=
>Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@xe_exe=
c_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/=
igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +33=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-dma-fence.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/s=
hard-dg2-464/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
08">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@xe_exe=
c_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464=
/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +=
15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-execqueues-new-busy-nomemset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-2/igt@xe_exec=
_system_allocator@many-execqueues-new-busy-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v1/shard-adlp-2/igt@xe_exec_system_allocator@many-execqueues-new-busy-nom=
emset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4996">Intel XE#4996</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-large-execqueues-mmap-new-race:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec=
_system_allocator@many-large-execqueues-mmap-new-race.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#49=
96</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-14=
8868v1/shard-adlp-3/igt@xe_exec_system_allocator@many-large-execqueues-mmap=
-new-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4915">Intel XE#4915</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_exe=
c_system_allocator@many-large-execqueues-mmap-new-race.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4=
208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
48868v1/shard-dg2-432/igt@xe_exec_system_allocator@many-large-execqueues-mm=
ap-new-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4915">Intel XE#4915</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-mmap-huge-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-4/igt@xe_exec_=
system_allocator@many-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-=
lnl-1/igt@xe_exec_system_allocator@many-mmap-huge-nomemset.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel =
XE#4996</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-6/igt@xe_exec_=
system_allocator@many-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-=
bmg-1/igt@xe_exec_system_allocator@many-mmap-huge-nomemset.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel =
XE#4996</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-stride-mmap-nomemset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_exec=
_system_allocator@threads-many-stride-mmap-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v1/shard-adlp-8/igt@xe_exec_system_allocator@threads-many-stride-mmap-nom=
emset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/4915">Intel XE#4915</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shar=
ed-nomemset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-436/igt@xe_exe=
c_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4915">Intel XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_exec_system_allocator@threa=
ds-shared-vm-many-execqueues-mmap-shared-nomemset.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +223 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-464/igt@xe_fau=
lt_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5012">Intel XE#5012=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v1/shard-dg2-464/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_r=
ecv.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-format-id:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-adlp-6/igt@xe_oa@i=
nvalid-oa-format-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4996">Intel XE#4996</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-adlp-4/igt@xe_oa@inva=
lid-oa-format-id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-433/igt@xe_oa@=
non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shar=
d-dg2-464/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a=
>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-463/igt@xe_oa@=
syncs-ufence-wait-cfg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1488=
68v1/shard-dg2-464/igt@xe_oa@syncs-ufence-wait-cfg.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@xe_pat=
@pat-index-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_pat@pat-ind=
ex-xelpg.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@xe_pm@=
d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt=
@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-435/igt@xe_pm@=
d3cold-mocs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@xe_pm@d3cold-mocs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pmu@fn-engine-activity-sched-if-idle:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-lnl-5/igt@xe_pmu@f=
n-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-lnl-1/ig=
t@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4996">Intel XE#4996</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-bmg-7/igt@xe_pmu@f=
n-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-bmg-1/ig=
t@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4954">Intel XE#4954</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-434/igt@xe_pmu=
@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4650">Intel XE#4650</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464=
/igt@xe_pmu@fn-engine-activity-sched-if-idle.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</=
li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-bind-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-432/igt@xe_pxp=
@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464/igt@x=
e_pxp@pxp-stale-bo-bind-post-rpm.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +3 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-guc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@xe_que=
ry@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148868v1/shard-dg2-464=
/igt@xe_query@multigpu-query-uc-fw-version-guc.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9/shard-dg2-466/igt@xe_sri=
ov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE=
#4130</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-148868v1/shard-dg2-464/igt@xe_sriov_auto_provisioning@resources-released-o=
n-vfs-disabling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8359 -&gt; IGT_8361</li>
<li>Linux: xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9 -&gt; xe-pw-148=
868v1</li>
</ul>
<p>IGT_8359: 807f0cbcc771d1d0bb0d27a78231a5f92dc02126 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8361: 8361<br />
  xe-3060-b0db97d4270c697ade930cfefdb7aaef12cd80c9: b0db97d4270c697ade930cf=
efdb7aaef12cd80c9<br />
  xe-pw-148868v1: 148868v1</p>

</body>
</html>

--===============1327111743045841613==--
