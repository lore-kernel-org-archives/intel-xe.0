Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26888CDD1CE
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 17:23:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB62110E1C9;
	Fri, 27 Sep 2024 17:23:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3C60710E1C9;
 Fri, 27 Sep 2024 17:23:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4048468972456813028=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Ultrajoiner_basic_functionality?=
 =?utf-8?q?_series_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Sep 2024 17:23:28 -0000
Message-ID: <172745780823.1112553.16636744211096447317@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240926072638.3689367-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240926072638.3689367-1-ankit.k.nautiyal@intel.com>
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

--===============4048468972456813028==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Ultrajoiner basic functionality series (rev4)
URL   : https://patchwork.freedesktop.org/series/138827/
State : failure

== Summary ==

CI Bug Log - changes from xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334_full -> xe-pw-138827v4_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-138827v4_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-138827v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-138827v4_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-2/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-2/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1.html

  * igt@kms_big_joiner@basic-force-joiner:
    - shard-lnl:          [PASS][3] -> [SKIP][4] +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-4/igt@kms_big_joiner@basic-force-joiner.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_big_joiner@basic-force-joiner.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][5] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-3/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
    - shard-lnl:          [PASS][6] -> [FAIL][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html

  * igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128:
    - shard-lnl:          [PASS][8] -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-7/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-8/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][10] -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:
    - shard-adlp:         [PASS][12] -> [DMESG-WARN][13] +3 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html

  
#### Warnings ####

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][14] ([Intel XE#1201]) -> [SKIP][15] +9 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_async_flips@crc@pipe-b-hdmi-a-3:
    - {shard-bmg}:        [FAIL][16] ([Intel XE#1288]) -> [DMESG-FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-1/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-8/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html

  * igt@kms_async_flips@crc@pipe-d-dp-2:
    - {shard-bmg}:        [FAIL][18] ([Intel XE#1656]) -> [DMESG-FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-1/igt@kms_async_flips@crc@pipe-d-dp-2.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-8/igt@kms_async_flips@crc@pipe-d-dp-2.html

  * igt@kms_big_joiner@invalid-modeset-force-joiner:
    - {shard-bmg}:        [PASS][20] -> [SKIP][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-1/igt@kms_big_joiner@invalid-modeset-force-joiner.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-5/igt@kms_big_joiner@invalid-modeset-force-joiner.html

  * igt@kms_flip@bo-too-big:
    - {shard-bmg}:        [SKIP][22] -> [INCOMPLETE][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_flip@bo-too-big.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-1/igt@kms_flip@bo-too-big.html

  * igt@kms_flip@bo-too-big@b-dp2:
    - {shard-bmg}:        NOTRUN -> [INCOMPLETE][24]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-1/igt@kms_flip@bo-too-big@b-dp2.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - {shard-bmg}:        NOTRUN -> [SKIP][25] +6 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_plane_lowres@tiling-none:
    - {shard-bmg}:        [PASS][26] -> [INCOMPLETE][27] +1 other test incomplete
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-2/igt@kms_plane_lowres@tiling-none.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-7/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_pm_rpm@cursor:
    - {shard-bmg}:        [SKIP][28] ([Intel XE#2446]) -> [DMESG-WARN][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_pm_rpm@cursor.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-1/igt@kms_pm_rpm@cursor.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - {shard-bmg}:        [SKIP][30] ([Intel XE#2446]) -> [SKIP][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_setmode@basic:
    - {shard-bmg}:        [SKIP][32] -> [FAIL][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_setmode@basic.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-3/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-dp-2:
    - {shard-bmg}:        NOTRUN -> [FAIL][34] +5 other tests fail
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-3/igt@kms_setmode@basic@pipe-a-dp-2.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - {shard-bmg}:        [SKIP][35] ([Intel XE#1130]) -> [SKIP][36]
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_pm@s4-d3cold-basic-exec.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-1/igt@xe_pm@s4-d3cold-basic-exec.html

  
Known issues
------------

  Here are the changes found in xe-pw-138827v4_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][37] -> [DMESG-WARN][38] ([Intel XE#1033]) +1 other test dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [PASS][39] -> [FAIL][40] ([Intel XE#1426]) +1 other test fail
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#1201] / [Intel XE#316])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#1407])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][44] -> [FAIL][45] ([Intel XE#1204])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][46] ([Intel XE#1204])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#1124]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][48] -> [FAIL][49] ([Intel XE#1231])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_joiner@basic-force-joiner:
    - shard-dg2-set2:     [PASS][51] -> [SKIP][52] ([Intel XE#1201]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_big_joiner@basic-force-joiner.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-435/igt@kms_big_joiner@basic-force-joiner.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#2191])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1512])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#367])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#787]) +13 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1399]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][59] ([Intel XE#616]) +7 other tests fail
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][60] -> [INCOMPLETE][61] ([Intel XE#1195] / [Intel XE#1727])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][62] -> [INCOMPLETE][63] ([Intel XE#1195]) +1 other test incomplete
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#787]) +5 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#373]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#373]) +2 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-1/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#308])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-max-size.html
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#1424]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-4/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#886]) +2 other tests fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#1397] / [Intel XE#1745])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][78] ([Intel XE#1397])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][79] -> [DMESG-FAIL][80] ([Intel XE#324]) +2 other tests dmesg-fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][81] -> [FAIL][82] ([Intel XE#1874]) +10 other tests fail
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [PASS][84] -> [FAIL][85] ([Intel XE#1861])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#656]) +7 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#651]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#651]) +1 other test skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#656]) +8 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane@plane-position-covered@pipe-a-plane-1:
    - shard-lnl:          [PASS][93] -> [DMESG-FAIL][94] ([Intel XE#324]) +2 other tests dmesg-fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          [PASS][95] -> [DMESG-WARN][96] ([Intel XE#324]) +5 other tests dmesg-warn
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [PASS][97] -> [DMESG-WARN][98] ([Intel XE#2687])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-7/igt@kms_plane_cursor@primary.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-8/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [PASS][99] -> [FAIL][100] ([Intel XE#616]) +1 other test fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_plane_cursor@viewport.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_plane_cursor@viewport.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][101] -> [FAIL][102] ([Intel XE#1430])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][103] -> [FAIL][104] ([Intel XE#2029])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201]) +6 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-6/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1406]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-3/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#1201] / [Intel XE#2850]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-464/igt@kms_psr@psr2-dpms.html

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1201])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-434/igt@kms_psr@psr2-primary-render.html
    - shard-lnl:          NOTRUN -> [FAIL][109] ([Intel XE#1649]) +1 other test fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1435])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#362])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#330])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [PASS][114] -> [FAIL][115] ([Intel XE#899]) +1 other test fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][116] -> [FAIL][117] ([Intel XE#2443]) +1 other test fail
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_vrr@flip-basic.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#1201] / [Intel XE#756])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#756])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-2/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [PASS][120] -> [TIMEOUT][121] ([Intel XE#1473])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][122] -> [TIMEOUT][123] ([Intel XE#1473] / [Intel XE#402])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-2/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][125] ([Intel XE#688]) +1 other test skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@xe_evict@evict-beng-threads-small.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1392]) +1 other test skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-1/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1201] / [Intel XE#1392])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-8/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_fault_mode@invalid-va:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-4/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1201] / [Intel XE#2541]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-464/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@oa-formats:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#1201] / [Intel XE#2541])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@xe_oa@oa-formats.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          [PASS][132] -> [FAIL][133] ([Intel XE#2514]) +1 other test fail
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [PASS][134] -> [ABORT][135] ([Intel XE#1358] / [Intel XE#1607])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-4/igt@xe_pm@s4-basic.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-adlp:         [PASS][136] -> [ABORT][137] ([Intel XE#1794])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-2/igt@xe_pm@s4-mocs.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@xe_pm@s4-mocs.html

  * igt@xe_spin_batch@spin-fixed-duration-with-preempter:
    - shard-adlp:         [PASS][138] -> [FAIL][139] ([Intel XE#1081])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - {shard-bmg}:        [FAIL][140] ([Intel XE#2452]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@core_getversion@all-cards.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-1/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotreplug:
    - shard-lnl:          [ABORT][142] -> [PASS][143]
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-4/igt@core_hotunplug@hotreplug.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-1/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@eof:
    - {shard-bmg}:        [SKIP][144] ([Intel XE#2134]) -> [PASS][145] +2 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@fbdev@eof.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-2/igt@fbdev@eof.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][146] -> [PASS][147] +5 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [FAIL][148] ([Intel XE#1426]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - {shard-bmg}:        [SKIP][150] -> [PASS][151] +161 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-lnl:          [FAIL][152] ([Intel XE#1659]) -> [PASS][153]
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         [FAIL][154] ([Intel XE#1874]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][156] ([Intel XE#1231]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][158] ([Intel XE#1195]) -> [PASS][159] +3 other tests pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - {shard-bmg}:        [DMESG-WARN][160] ([Intel XE#877]) -> [PASS][161] +5 other tests pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-lnl:          [FAIL][162] ([Intel XE#2631]) -> [PASS][163] +1 other test pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-5/igt@kms_flip@absolute-wf_vblank.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-1/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][164] -> [PASS][165] +2 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][166] ([Intel XE#886]) -> [PASS][167] +5 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:
    - {shard-bmg}:        [INCOMPLETE][168] -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         [DMESG-FAIL][170] ([Intel XE#324]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][172] ([Intel XE#1861]) -> [PASS][173] +2 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [SKIP][174] ([Intel XE#455]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_hdr@invalid-hdr.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [DMESG-WARN][176] ([Intel XE#324]) -> [PASS][177] +2 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-4:
    - shard-lnl:          [DMESG-FAIL][178] ([Intel XE#324]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html

  * igt@kms_plane_cursor@overlay:
    - shard-lnl:          [DMESG-WARN][180] -> [PASS][181] +1 other test pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_plane_cursor@overlay.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-1/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][182] ([Intel XE#616]) -> [PASS][183] +3 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][184] -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-adlp:         [FAIL][186] ([Intel XE#718]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@i2c:
    - {shard-bmg}:        [SKIP][188] ([Intel XE#2446]) -> [PASS][189] +4 other tests pass
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_pm_rpm@i2c.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-8/igt@kms_pm_rpm@i2c.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][190] ([Intel XE#1473]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_module_load@reload-no-display:
    - {shard-bmg}:        [FAIL][192] ([Intel XE#2136]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_module_load@reload-no-display.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-7/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@oa-exponents:
    - shard-lnl:          [FAIL][194] ([Intel XE#2723]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@xe_oa@oa-exponents.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@xe_oa@oa-exponents.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][196] ([Intel XE#1794]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_spin_batch@spin-all:
    - {shard-bmg}:        [SKIP][198] ([Intel XE#1130]) -> [PASS][199] +289 other tests pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_spin_batch@spin-all.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-3/igt@xe_spin_batch@spin-all.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][200] ([Intel XE#316]) -> [SKIP][201] ([Intel XE#1201] / [Intel XE#316])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][202] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][203] ([Intel XE#316]) +3 other tests skip
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][204] ([Intel XE#1124]) -> [SKIP][205] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][207] ([Intel XE#1124]) +5 other tests skip
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][208] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][209] ([Intel XE#367]) +1 other test skip
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][210] ([Intel XE#2191]) -> [SKIP][211] ([Intel XE#1201] / [Intel XE#2191])
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][212] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][213] ([Intel XE#2191])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#367]) -> [SKIP][215] ([Intel XE#1201] / [Intel XE#367])
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][216] ([Intel XE#787]) -> [SKIP][217] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][218] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][219] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-433/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][220] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][221] ([Intel XE#1252]) +1 other test skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][222] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][223] ([Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][225] ([Intel XE#787]) +48 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-dp-4.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][226] ([Intel XE#1252]) -> [SKIP][227] ([Intel XE#1201] / [Intel XE#1252]) +2 other tests skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-dg2-set2:     [SKIP][228] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][229] ([Intel XE#373]) +4 other tests skip
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_chamelium_audio@hdmi-audio-edid.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][231] ([Intel XE#306])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_chamelium_color@gamma.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][232] ([Intel XE#373]) -> [SKIP][233] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#308]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#308])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][237] ([Intel XE#323])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#323]) -> [SKIP][239] ([Intel XE#1201] / [Intel XE#323])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#455]) -> [SKIP][241] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          [TIMEOUT][242] ([Intel XE#1504]) -> [INCOMPLETE][243] ([Intel XE#1504]) +1 other test incomplete
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_flip@bo-too-big-interruptible@a-edp1.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][244] ([i915#5274]) -> [SKIP][245] ([Intel XE#1201] / [i915#5274])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][247] ([Intel XE#651]) +16 other tests skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][249] ([Intel XE#658])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#651]) -> [SKIP][251] ([Intel XE#1201] / [Intel XE#651]) +19 other tests skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][253] ([Intel XE#653]) +16 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#653]) -> [SKIP][255] ([Intel XE#1201] / [Intel XE#653]) +15 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#605]) -> [SKIP][257] ([Intel XE#1201] / [Intel XE#605])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][259] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#2763]) -> [SKIP][261] ([Intel XE#1201] / [Intel XE#2763]) +2 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#1201] / [Intel XE#2763]) -> [SKIP][263] ([Intel XE#2763]) +2 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) -> [SKIP][265] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html

  * igt@kms_psr2_sf@fbc-cursor-plane-update-sf:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#1489]) -> [SKIP][267] ([Intel XE#1201] / [Intel XE#1489])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-434/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][269] ([Intel XE#1489]) +3 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@plane-move-sf-dmg-area:
    - shard-lnl:          [FAIL][270] ([Intel XE#2880]) -> [SKIP][271] ([Intel XE#1489])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-5/igt@kms_psr2_sf@plane-move-sf-dmg-area.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_psr2_sf@plane-move-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#1201] / [Intel XE#2850]) -> [SKIP][273] ([Intel XE#2850]) +8 other tests skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#2850]) -> [SKIP][275] ([Intel XE#1201] / [Intel XE#2850]) +8 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#1127]) -> [SKIP][277] ([Intel XE#1127] / [Intel XE#1201])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#1201] / [Intel XE#1500]) -> [SKIP][279] ([Intel XE#1201] / [Intel XE#362])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][281] ([Intel XE#455]) +13 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_vrr@flipline.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-check-output:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][283] ([Intel XE#756])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_writeback@writeback-check-output.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_writeback@writeback-check-output.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#756]) -> [SKIP][285] ([Intel XE#1201] / [Intel XE#756])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][287] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-imm:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][289] ([Intel XE#288]) +11 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#288]) -> [SKIP][291] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#255]) -> [SKIP][293] ([Intel XE#1201] / [Intel XE#255])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-464/igt@xe_huc_copy@huc_copy.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#1201] / [Intel XE#560]) -> [SKIP][295] ([Intel XE#560])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_media_fill@media-fill.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][297] ([Intel XE#512])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@xe_mmap@small-bar.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@xe_mmap@small-bar.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     [SKIP][298] ([Intel XE#2541]) -> [SKIP][299] ([Intel XE#1201] / [Intel XE#2541]) +2 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_oa@missing-sample-flags.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-466/igt@xe_oa@missing-sample-flags.html

  * igt@xe_oa@oa-tlb-invalidate:
    - shard-dg2-set2:     [SKIP][300] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][301] ([Intel XE#2541]) +2 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@xe_oa@oa-tlb-invalidate.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][303] ([Intel XE#366]) +2 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][304] -> [SKIP][305] ([Intel XE#1201]) +3 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#944]) -> [SKIP][307] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-436/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][309] ([Intel XE#944]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_query@multigpu-query-invalid-extension.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2452]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2452
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2631]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2631
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2723]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2880]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2880
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8032 -> IGT_8034
  * Linux: xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334 -> xe-pw-138827v4

  IGT_8032: 8032
  IGT_8034: 73eed10d50c7d1f07df07214ae62924d4e377e12 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334: ec87b409d3a9358c9a079186d528fad3f7d64334
  xe-pw-138827v4: 138827v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/index.html

--===============4048468972456813028==
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
<tr><td><b>Series:</b></td><td>Ultrajoiner basic functionality series (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138827/">https://patchwork.freedesktop.org/series/138827/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334_full -&gt; xe-pw-138827v4_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-138827v4_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-138827v4_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-138827v4_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-2/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-2/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic-force-joiner:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-4/igt@kms_big_joiner@basic-force-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_big_joiner@basic-force-joiner.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-3/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-stridechange:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-7/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-8/igt@kms_plane_cursor@primary@pipe-b-edp-1-size-128.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation@pipe-a.html">DMESG-WARN</a> +3 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_copy_basic@mem-copy-linear-0xfffe:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> +9 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_async_flips@crc@pipe-b-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-1/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1288">Intel XE#1288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-8/igt@kms_async_flips@crc@pipe-b-hdmi-a-3.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc@pipe-d-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-1/igt@kms_async_flips@crc@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1656">Intel XE#1656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-8/igt@kms_async_flips@crc@pipe-d-dp-2.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@invalid-modeset-force-joiner:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-1/igt@kms_big_joiner@invalid-modeset-force-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-5/igt@kms_big_joiner@invalid-modeset-force-joiner.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_flip@bo-too-big.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-1/igt@kms_flip@bo-too-big.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big@b-dp2:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-1/igt@kms_flip@bo-too-big@b-dp2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-2/igt@kms_plane_lowres@tiling-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-7/igt@kms_plane_lowres@tiling-none.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-1/igt@kms_pm_rpm@cursor.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-2/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_setmode@basic.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-3/igt@kms_setmode@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-3/igt@kms_setmode@basic@pipe-a-dp-2.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-1/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-138827v4_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-464/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic-force-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_big_joiner@basic-force-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-435/igt@kms_big_joiner@basic-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-1/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-436/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-464/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-436/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-1/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-464/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-464/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-4/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-5/igt@kms_flip@flip-vs-absolute-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-1/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +10 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-a-plane-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-7/igt@kms_plane_cursor@primary.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-8/igt@kms_plane_cursor@primary.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_plane_cursor@viewport.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-1/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-6/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-3/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-464/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-434/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@kms_psr@psr2-primary-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-6/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-8/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-2/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-2/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@xe_evict@evict-beng-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-1/igt@xe_exec_basic@multigpu-once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-8/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-4/igt@xe_exec_fault_mode@invalid-va.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-464/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@xe_oa@oa-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-7/igt@xe_oa@oa-regs-whitelisted.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-5/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-4/igt@xe_pm@s4-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-2/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-fixed-duration-with-preempter:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-4/igt@xe_spin_batch@spin-fixed-duration-with-preempter.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2452">Intel XE#2452</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-1/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-4/igt@core_hotunplug@hotreplug.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-1/igt@core_hotunplug@hotreplug.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-2/igt@fbdev@eof.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-2/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +161 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-5/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-4/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-8/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-5/igt@kms_flip@absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2631">Intel XE#2631</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-1/igt@kms_flip@absolute-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-3/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-2/igt@kms_plane@plane-position-hole@pipe-a-plane-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_plane_cursor@overlay.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-1/igt@kms_plane_cursor@overlay.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-6/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-8/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-8/igt@kms_pm_rpm@i2c.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-7/igt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@xe_oa@oa-exponents.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2723">Intel XE#2723</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-7/igt@xe_oa@oa-exponents.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-adlp-8/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_spin_batch@spin-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-bmg-3/igt@xe_spin_batch@spin-all.html">PASS</a> +289 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-433/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-433/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-y-tiled-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_chamelium_color@gamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-466/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-436/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-464/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-436/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-434/igt@kms_psr2_sf@fbc-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-5/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2880">Intel XE#2880</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-lnl-4/igt@kms_psr2_sf@plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-436/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-464/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-466/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-tlb-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@xe_oa@oa-tlb-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-435/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-436/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138827v4/shard-dg2-432/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8032 -&gt; IGT_8034</li>
<li>Linux: xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334 -&gt; xe-pw-138827v4</li>
</ul>
<p>IGT_8032: 8032<br />
  IGT_8034: 73eed10d50c7d1f07df07214ae62924d4e377e12 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334: ec87b409d3a9358c9a079186d528fad3f7d64334<br />
  xe-pw-138827v4: 138827v4</p>

</body>
</html>

--===============4048468972456813028==--
