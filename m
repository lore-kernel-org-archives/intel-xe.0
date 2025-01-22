Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D75FAC02181
	for <intel-xe@archiver.kernel.org>; Wed, 22 Jan 2025 06:20:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7755710E148;
	Wed, 22 Jan 2025 06:20:00 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D09A910E148;
 Wed, 22 Jan 2025 06:19:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4667727541657745534=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/i915/cmtg=3A_Disable_t?=
 =?utf-8?q?he_CMTG_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Gustavo Sousa" <gustavo.sousa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 Jan 2025 06:19:58 -0000
Message-ID: <173752679883.2926172.6810219605034004779@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250121202806.76103-1-gustavo.sousa@intel.com>
In-Reply-To: <20250121202806.76103-1-gustavo.sousa@intel.com>
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

--===============4667727541657745534==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cmtg: Disable the CMTG (rev6)
URL   : https://patchwork.freedesktop.org/series/142946/
State : failure

== Summary ==

CI Bug Log - changes from xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e_full -> xe-pw-142946v6_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-142946v6_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-142946v6_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-142946v6_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_atomic_transition@modeset-transition@1x-outputs:
    - shard-bmg:          [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-8/igt@kms_atomic_transition@modeset-transition@1x-outputs.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_atomic_transition@modeset-transition@1x-outputs.html

  * igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a1:
    - shard-adlp:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-3/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-2/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a1.html

  * igt@kms_vblank@query-idle@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][5] -> [INCOMPLETE][6] +2 other tests incomplete
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_vblank@query-idle@pipe-a-hdmi-a-6.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_vblank@query-idle@pipe-a-hdmi-a-6.html

  * igt@xe_wedged@basic-wedged:
    - shard-adlp:         [PASS][7] -> [DMESG-WARN][8] +1 other test dmesg-warn
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-4/igt@xe_wedged@basic-wedged.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-1/igt@xe_wedged@basic-wedged.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [DMESG-WARN][9] ([Intel XE#1033]) -> [DMESG-WARN][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][11] ([Intel XE#2136]) -> [DMESG-WARN][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  
Known issues
------------

  Here are the changes found in xe-pw-142946v6_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#1125])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [PASS][14] -> [DMESG-WARN][15] ([Intel XE#1033]) +2 other tests dmesg-warn
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_async_flips@test-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#664])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-7/igt@kms_async_flips@test-cursor-atomic.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [PASS][17] -> [SKIP][18] ([Intel XE#2423] / [i915#2575]) +11 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_atomic@plane-invalid-params-fence.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_atomic_transition@modeset-transition:
    - shard-bmg:          [PASS][19] -> [INCOMPLETE][20] ([Intel XE#2613])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-8/igt@kms_atomic_transition@modeset-transition.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_atomic_transition@modeset-transition.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#316]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1407]) +2 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-bmg:          [PASS][23] -> [SKIP][24] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1124]) +5 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#3658]) +1 other test skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - shard-dg2-set2:     [PASS][27] -> [SKIP][28] ([Intel XE#2136]) +4 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][29] ([Intel XE#316]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][30] -> [DMESG-FAIL][31] ([Intel XE#1033]) +11 other tests dmesg-fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][32] ([Intel XE#1033])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#1124]) +9 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#367]) +1 other test skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2191]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#2191])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#367]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#367]) +2 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#787]) +27 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#2669]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][41] ([Intel XE#1033]) +1 other test dmesg-warn
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#3442])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#455] / [Intel XE#787]) +6 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][44] ([Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#3432]) +3 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#787]) +23 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][47] ([Intel XE#2887]) +7 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [PASS][48] -> [INCOMPLETE][49] ([Intel XE#1727] / [Intel XE#3124])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][50] -> [INCOMPLETE][51] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_chamelium_frames@hdmi-crc-fast:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#3007])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_chamelium_frames@hdmi-crc-fast.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#2423] / [i915#2575])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#373]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#373]) +4 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html

  * igt@kms_color@invalid-ctm-matrix-sizes:
    - shard-bmg:          [PASS][56] -> [SKIP][57] ([Intel XE#3007]) +13 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-5/igt@kms_color@invalid-ctm-matrix-sizes.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_color@invalid-ctm-matrix-sizes.html

  * igt@kms_content_protection@content-type-change:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#455]) +17 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_content_protection@content-type-change.html
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#3278]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-7/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#307])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-3/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][61] ([Intel XE#1188])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][62] ([Intel XE#1188])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_content_protection@uevent@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#308])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#2321])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#308])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1424]) +1 other test skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#309])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][68] -> [DMESG-WARN][69] ([Intel XE#877])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#2244]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#702])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-6/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#310]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][73] -> [FAIL][74] ([Intel XE#301]) +1 other test fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1421]) +6 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-dg2-set2:     [PASS][76] -> [DMESG-WARN][77] ([Intel XE#1033]) +72 other tests dmesg-warn
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-463/igt@kms_flip@blocking-wf_vblank.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_flip@blocking-wf_vblank.html
    - shard-lnl:          [PASS][78] -> [FAIL][79] ([Intel XE#886]) +3 other tests fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [PASS][80] -> [FAIL][81] ([Intel XE#3321]) +2 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-adlp:         [PASS][82] -> [FAIL][83] ([Intel XE#2882]) +1 other test fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-3/igt@kms_flip@plain-flip-fb-recreate.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-2/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:
    - shard-adlp:         [PASS][84] -> [FAIL][85] ([Intel XE#886]) +2 other tests fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-2/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-9/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#1397] / [Intel XE#1745]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1397]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][89] ([Intel XE#1401]) +3 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#656]) +17 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#651]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2311]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#651]) +5 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-dg2-set2:     [PASS][94] -> [SKIP][95] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#656]) +26 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#651]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#653]) +2 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#653]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#1341])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-2/igt@kms_getfb@getfb-reject-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#605])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@static-swap@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][102] ([Intel XE#1033]) +1 other test dmesg-warn
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#4090])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#2763]) +4 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#2763]) +7 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#870])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#736])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][108] -> [FAIL][109] ([Intel XE#718])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1439] / [Intel XE#3141])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-6/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][111] -> [DMESG-WARN][112] ([Intel XE#1033] / [Intel XE#2042])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#2893]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1489]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][115] ([Intel XE#1489]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1128])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#1122])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#2850] / [Intel XE#929]) +5 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr2-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-9/igt@kms_psr@fbc-psr2-suspend.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1406]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-7/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#1127])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html
    - shard-lnl:          NOTRUN -> [SKIP][122] ([Intel XE#3414] / [Intel XE#3904])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][123] ([Intel XE#1127])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#3414])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#1435])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][126] -> [FAIL][127] ([Intel XE#1522]) +9 other tests fail
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-lnl-5/igt@kms_vrr@flip-basic.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#455]) +5 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_vrr@flip-dpms.html
    - shard-lnl:          NOTRUN -> [FAIL][129] ([Intel XE#1522]) +1 other test fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-7/igt@kms_vrr@flip-dpms.html

  * igt@kms_vrr@lobf:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#1499])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-4/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output:
    - shard-lnl:          NOTRUN -> [SKIP][131] ([Intel XE#756])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-6/igt@kms_writeback@writeback-check-output.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#455] / [Intel XE#488]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-6/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#1123])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_eudebug@basic-connect:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#2905]) +6 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-8/igt@xe_eudebug@basic-connect.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#3889])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#2905]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-9/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_eudebug_online@tdctl-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][137] ([Intel XE#2905]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@xe_eudebug_online@tdctl-parameters.html

  * igt@xe_evict@evict-beng-large-cm:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#688]) +4 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@xe_evict@evict-beng-large-cm.html

  * igt@xe_evict@evict-large:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#261] / [Intel XE#688])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-6/igt@xe_evict@evict-large.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#688]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@many-execqueues-null:
    - shard-bmg:          [PASS][141] -> [SKIP][142] ([Intel XE#1130]) +34 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-7/igt@xe_exec_basic@many-execqueues-null.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@xe_exec_basic@many-execqueues-null.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#1392]) +8 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#1392]) +4 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-1/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-rebind:
    - shard-dg2-set2:     [PASS][145] -> [SKIP][146] ([Intel XE#1130]) +24 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-466/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-rebind.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][147] ([Intel XE#288]) +3 other tests skip
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#288]) +11 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][149] -> [INCOMPLETE][150] ([Intel XE#1033] / [Intel XE#1169])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo:
    - shard-bmg:          [PASS][151] -> [SKIP][152] ([Intel XE#1192])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-1/igt@xe_live_ktest@xe_bo.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          [PASS][153] -> [FAIL][154] ([Intel XE#3099]) +1 other test fail
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-1/igt@xe_live_ktest@xe_dma_buf.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_mmap@vram:
    - shard-lnl:          NOTRUN -> [SKIP][155] ([Intel XE#1416])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-4/igt@xe_mmap@vram.html

  * igt@xe_noexec_ping_pong:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#379])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-6/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_oa@rc6-disable:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-3/igt@xe_oa@rc6-disable.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#2284] / [Intel XE#366])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-3/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-basic:
    - shard-bmg:          [PASS][160] -> [DMESG-WARN][161] ([Intel XE#1033] / [Intel XE#569]) +1 other test dmesg-warn
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-5/igt@xe_pm@s3-basic.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@xe_pm@s3-basic.html
    - shard-dg2-set2:     [PASS][162] -> [DMESG-WARN][163] ([Intel XE#1033] / [Intel XE#569]) +1 other test dmesg-warn
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@xe_pm@s3-basic.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][164] ([Intel XE#1033] / [Intel XE#569])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html
    - shard-lnl:          NOTRUN -> [SKIP][165] ([Intel XE#584])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][166] ([Intel XE#579])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_prime_self_import@basic-llseek-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#1130]) +1 other test skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_prime_self_import@basic-llseek-size.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#944]) +2 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-4/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#944]) +4 other tests skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#4130])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html
    - shard-lnl:          NOTRUN -> [SKIP][171] ([Intel XE#4130])
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#3342])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs:
    - shard-bmg:          [PASS][173] -> [DMESG-WARN][174] ([Intel XE#1033]) +78 other tests dmesg-warn
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs.html

  
#### Possible fixes ####

  * igt@core_setmaster@master-drop-set-shared-fd:
    - shard-bmg:          [SKIP][175] ([Intel XE#3453]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@core_setmaster@master-drop-set-shared-fd.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@core_setmaster@master-drop-set-shared-fd.html
    - shard-dg2-set2:     [SKIP][177] ([Intel XE#3453]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@core_setmaster@master-drop-set-shared-fd.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@core_setmaster@master-drop-set-shared-fd.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic:
    - shard-adlp:         [FAIL][179] ([Intel XE#827]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html

  * igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][181] ([Intel XE#3746] / [Intel XE#827]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:
    - shard-dg2-set2:     [SKIP][183] ([Intel XE#2423] / [i915#2575]) -> [PASS][184] +15 other tests pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][185] ([Intel XE#2136]) -> [PASS][186] +4 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_big_fb@4-tiled-addfb-size-overflow.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [DMESG-WARN][187] ([Intel XE#1033]) -> [PASS][188] +87 other tests pass
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][189] ([Intel XE#2136] / [Intel XE#2231]) -> [PASS][190] +4 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [DMESG-FAIL][191] ([Intel XE#1033]) -> [PASS][192] +4 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [SKIP][193] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][194] +1 other test pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [INCOMPLETE][195] ([Intel XE#3878]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [DMESG-WARN][197] ([Intel XE#877]) -> [PASS][198]
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-bmg:          [SKIP][199] ([Intel XE#3007]) -> [PASS][200] +16 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-dg2-set2:     [DMESG-FAIL][201] ([Intel XE#1033]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-466/igt@kms_fbcon_fbt@fbc.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][203] ([Intel XE#301] / [Intel XE#3321]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][205] ([Intel XE#3321]) -> [PASS][206] +3 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][207] ([Intel XE#2049]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-interruptible.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][209] ([Intel XE#301]) -> [PASS][210] +1 other test pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][211] ([Intel XE#2955]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-adlp:         [DMESG-FAIL][213] ([Intel XE#1033] / [Intel XE#324]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_lease@lessee-list@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][215] -> [PASS][216] +6 other tests pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-6/igt@kms_lease@lessee-list@pipe-a-hdmi-a-1.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_lease@lessee-list@pipe-a-hdmi-a-1.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [FAIL][217] ([Intel XE#2029]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-bmg:          [SKIP][219] ([Intel XE#2446]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_pm_rpm@drm-resources-equal.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#2446]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_pm_rpm@drm-resources-equal.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_sequence@get-forked@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][223] -> [PASS][224] +4 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_sequence@get-forked@pipe-c-hdmi-a-6.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_sequence@get-forked@pipe-c-hdmi-a-6.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [DMESG-WARN][225] ([Intel XE#1033]) -> [PASS][226] +77 other tests pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_compute_mode@many-execqueues-basic:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#1130]) -> [PASS][228] +22 other tests pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@xe_exec_compute_mode@many-execqueues-basic.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_exec_compute_mode@many-execqueues-basic.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:
    - shard-bmg:          [SKIP][229] ([Intel XE#1130]) -> [PASS][230] +33 other tests pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-bmg:          [SKIP][231] ([Intel XE#1192]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [DMESG-WARN][233] ([Intel XE#569]) -> [PASS][234] +2 other tests pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-1/igt@xe_pm@s3-multiple-execs.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][235] ([Intel XE#1033] / [Intel XE#569]) -> [PASS][236] +1 other test pass
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-mocs:
    - shard-bmg:          [DMESG-WARN][237] ([Intel XE#2280]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@xe_pm@s4-mocs.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@xe_pm@s4-mocs.html
    - shard-dg2-set2:     [DMESG-WARN][239] ([Intel XE#1033] / [Intel XE#2280]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-463/igt@xe_pm@s4-mocs.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [ABORT][241] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_async_flips@invalid-async-flip:
    - shard-bmg:          [SKIP][243] ([Intel XE#3007]) -> [SKIP][244] ([Intel XE#873])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_async_flips@invalid-async-flip.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#2423] / [i915#2575]) -> [SKIP][246] ([Intel XE#873])
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_big_fb@linear-64bpp-rotate-90:
    - shard-bmg:          [SKIP][247] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][248] ([Intel XE#2327])
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-90.html
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#2136]) -> [SKIP][250] ([Intel XE#316])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-90.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#316]) -> [SKIP][252] ([Intel XE#2136] / [Intel XE#2351])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
    - shard-bmg:          [SKIP][253] ([Intel XE#2327]) -> [SKIP][254] ([Intel XE#2136] / [Intel XE#2231])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1124]) -> [SKIP][256] ([Intel XE#2136] / [Intel XE#2351])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][257] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][258] ([Intel XE#1124])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#2136]) -> [SKIP][260] ([Intel XE#1124])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          [SKIP][261] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][262] ([Intel XE#607])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#2136]) -> [SKIP][264] ([Intel XE#607])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:
    - shard-bmg:          [SKIP][265] ([Intel XE#1124]) -> [SKIP][266] ([Intel XE#2136] / [Intel XE#2231]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#1124]) -> [SKIP][268] ([Intel XE#2136])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#367]) -> [SKIP][270] ([Intel XE#2423] / [i915#2575])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][271] ([Intel XE#3007]) -> [SKIP][272] ([Intel XE#367])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#2423] / [i915#2575]) -> [SKIP][274] ([Intel XE#367])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#2136]) -> [SKIP][276] ([Intel XE#455] / [Intel XE#787])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:
    - shard-bmg:          [SKIP][277] ([Intel XE#2887]) -> [SKIP][278] ([Intel XE#2136] / [Intel XE#2231]) +3 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][280] ([Intel XE#2136]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][281] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][282] ([Intel XE#3432])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-bmg:          [SKIP][283] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][284] ([Intel XE#2887]) +2 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][286] ([Intel XE#2136] / [Intel XE#2351])
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_frames@hdmi-cmp-planes-random:
    - shard-bmg:          [SKIP][287] ([Intel XE#3007]) -> [SKIP][288] ([Intel XE#2252]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-bmg:          [SKIP][289] ([Intel XE#2252]) -> [SKIP][290] ([Intel XE#3007])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#373]) -> [SKIP][292] ([Intel XE#2423] / [i915#2575])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#2423] / [i915#2575]) -> [SKIP][294] ([Intel XE#373]) +1 other test skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#2423] / [i915#2575]) -> [FAIL][296] ([Intel XE#1188])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_content_protection@uevent.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_content_protection@uevent.html
    - shard-bmg:          [SKIP][297] ([Intel XE#3007]) -> [FAIL][298] ([Intel XE#1188])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_content_protection@uevent.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-sliding-32x10:
    - shard-bmg:          [SKIP][299] ([Intel XE#3007]) -> [SKIP][300] ([Intel XE#2320]) +1 other test skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-32x10.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-32x10.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom:
    - shard-bmg:          [SKIP][301] ([Intel XE#3007]) -> [DMESG-WARN][302] ([Intel XE#1033])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_cursor_edge_walk@256x256-top-bottom.html
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#2423] / [i915#2575]) -> [DMESG-WARN][304] ([Intel XE#1033])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_cursor_edge_walk@256x256-top-bottom.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-top-bottom.html

  * igt@kms_dsc@dsc-fractional-bpp-with-bpc:
    - shard-bmg:          [SKIP][305] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][306] ([Intel XE#2244])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
    - shard-dg2-set2:     [SKIP][307] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][308] ([Intel XE#455])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html

  * igt@kms_dsc@dsc-with-output-formats:
    - shard-bmg:          [SKIP][309] ([Intel XE#2244]) -> [SKIP][310] ([Intel XE#2136] / [Intel XE#2231])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#455]) -> [SKIP][312] ([Intel XE#2136])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-bmg:          [DMESG-WARN][313] ([Intel XE#2955]) -> [DMESG-WARN][314] ([Intel XE#1033])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [FAIL][315] ([Intel XE#301]) -> [SKIP][316] ([Intel XE#2423] / [i915#2575])
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][317] ([Intel XE#1033]) -> [INCOMPLETE][318] ([Intel XE#2597])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#651]) -> [SKIP][320] ([Intel XE#2136]) +4 other tests skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - shard-dg2-set2:     [SKIP][321] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][322] ([Intel XE#651]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][323] ([Intel XE#2136]) -> [SKIP][324] ([Intel XE#651]) +3 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][325] ([Intel XE#4141]) -> [SKIP][326] ([Intel XE#2136] / [Intel XE#2231]) +4 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:
    - shard-bmg:          [SKIP][327] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][328] ([Intel XE#4141])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          [SKIP][329] ([Intel XE#2311]) -> [SKIP][330] ([Intel XE#2136] / [Intel XE#2231]) +5 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][331] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][332] ([Intel XE#2311]) +5 other tests skip
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#651]) -> [SKIP][334] ([Intel XE#2136] / [Intel XE#2351])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][335] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][336] ([Intel XE#2313]) +6 other tests skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#2136]) -> [SKIP][338] ([Intel XE#653]) +4 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#653]) -> [SKIP][340] ([Intel XE#2136]) +3 other tests skip
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][342] ([Intel XE#653])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-bmg:          [SKIP][343] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][344] ([Intel XE#2352])
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][346] ([Intel XE#658])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][347] ([Intel XE#2313]) -> [SKIP][348] ([Intel XE#2136] / [Intel XE#2231]) +5 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
    - shard-dg2-set2:     [SKIP][349] ([Intel XE#653]) -> [SKIP][350] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-bmg:          [DMESG-WARN][351] ([Intel XE#2566]) -> [DMESG-WARN][352] ([Intel XE#1033] / [Intel XE#2566])
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@plane-panning-top-left:
    - shard-dg2-set2:     [DMESG-WARN][353] ([Intel XE#1033]) -> [SKIP][354] ([Intel XE#2423] / [i915#2575])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_plane@plane-panning-top-left.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_plane@plane-panning-top-left.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:
    - shard-bmg:          [SKIP][355] ([Intel XE#2763]) -> [SKIP][356] ([Intel XE#3007])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress:
    - shard-bmg:          [DMESG-WARN][357] ([Intel XE#1033]) -> [SKIP][358] ([Intel XE#2446])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
    - shard-dg2-set2:     [DMESG-WARN][359] ([Intel XE#1033]) -> [SKIP][360] ([Intel XE#2446])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#1489]) -> [SKIP][362] ([Intel XE#2136]) +2 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:
    - shard-bmg:          [SKIP][363] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][364] ([Intel XE#1489])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#2136]) -> [SKIP][366] ([Intel XE#1489])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          [SKIP][367] ([Intel XE#1489]) -> [SKIP][368] ([Intel XE#2136] / [Intel XE#2231]) +2 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#2136]) -> [SKIP][370] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@pr-no-drrs:
    - shard-bmg:          [SKIP][371] ([Intel XE#2234] / [Intel XE#2850]) -> [SKIP][372] ([Intel XE#2136] / [Intel XE#2231])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-7/igt@kms_psr@pr-no-drrs.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_psr@pr-no-drrs.html
    - shard-dg2-set2:     [SKIP][373] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][374] ([Intel XE#2136])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-466/igt@kms_psr@pr-no-drrs.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr2-primary-page-flip:
    - shard-bmg:          [SKIP][375] ([Intel XE#2136] / [Intel XE#2231]) -> [SKIP][376] ([Intel XE#2234] / [Intel XE#2850]) +2 other tests skip
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_psr@psr2-primary-page-flip.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_psr@psr2-primary-page-flip.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-bmg:          [SKIP][377] ([Intel XE#3007]) -> [SKIP][378] ([Intel XE#3414] / [Intel XE#3904])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html
    - shard-dg2-set2:     [SKIP][379] ([Intel XE#2423] / [i915#2575]) -> [SKIP][380] ([Intel XE#3414])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_rotation_crc@bad-pixel-format.html
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-bmg:          [SKIP][381] ([Intel XE#2330]) -> [SKIP][382] ([Intel XE#3007])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
    - shard-dg2-set2:     [SKIP][383] ([Intel XE#1127]) -> [SKIP][384] ([Intel XE#2423] / [i915#2575])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-bmg:          [SKIP][385] ([Intel XE#3414] / [Intel XE#3904]) -> [SKIP][386] ([Intel XE#3007])
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
    - shard-dg2-set2:     [SKIP][387] ([Intel XE#3414]) -> [SKIP][388] ([Intel XE#2423] / [i915#2575])
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-center:
    - shard-bmg:          [SKIP][389] ([Intel XE#3007]) -> [SKIP][390] ([Intel XE#2413])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html
    - shard-dg2-set2:     [SKIP][391] ([Intel XE#2423] / [i915#2575]) -> [SKIP][392] ([Intel XE#455]) +1 other test skip
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-center.html
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-center.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][393] ([Intel XE#2509]) -> [SKIP][394] ([Intel XE#2426])
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
    - shard-dg2-set2:     [SKIP][395] ([Intel XE#1500]) -> [SKIP][396] ([Intel XE#362])
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     [SKIP][397] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][398] ([Intel XE#1130])
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-bmg:          [SKIP][399] ([Intel XE#1130]) -> [SKIP][400] ([Intel XE#2905]) +1 other test skip
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-discovery.html
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-discovery.html
    - shard-dg2-set2:     [SKIP][401] ([Intel XE#1130]) -> [SKIP][402] ([Intel XE#2905]) +1 other test skip
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-discovery.html
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          [SKIP][403] ([Intel XE#1130]) -> [SKIP][404] ([Intel XE#2322])
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-bmg:          [SKIP][405] ([Intel XE#2322]) -> [SKIP][406] ([Intel XE#1130])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:
    - shard-bmg:          [SKIP][407] ([Intel XE#1130]) -> [DMESG-WARN][408] ([Intel XE#1033])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     [SKIP][409] ([Intel XE#1130]) -> [SKIP][410] ([Intel XE#288]) +2 other tests skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][411] ([Intel XE#288]) -> [SKIP][412] ([Intel XE#1130]) +5 other tests skip
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_oa@short-reads:
    - shard-dg2-set2:     [SKIP][413] ([Intel XE#1130]) -> [SKIP][414] ([Intel XE#2541] / [Intel XE#3573])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@xe_oa@short-reads.html
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@xe_oa@short-reads.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-dg2-set2:     [SKIP][415] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][416] ([Intel XE#1130]) +1 other test skip
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cfg.html
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-bmg:          [DMESG-WARN][417] ([Intel XE#569]) -> [DMESG-WARN][418] ([Intel XE#1033] / [Intel XE#569]) +1 other test dmesg-warn
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-5/igt@xe_pm@s3-vm-bind-prefetch.html
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [SKIP][419] ([Intel XE#1130]) -> [DMESG-WARN][420] ([Intel XE#1033] / [Intel XE#569])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@xe_pm@s3-vm-bind-userptr.html
    - shard-dg2-set2:     [SKIP][421] ([Intel XE#1130]) -> [DMESG-WARN][422] ([Intel XE#1033] / [Intel XE#569])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          [SKIP][423] ([Intel XE#944]) -> [SKIP][424] ([Intel XE#1130])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html
    - shard-dg2-set2:     [SKIP][425] ([Intel XE#944]) -> [SKIP][426] ([Intel XE#1130])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@xe_query@multigpu-query-invalid-extension.html
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_query@multigpu-query-invalid-extension.html

  
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2042]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#3453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#3658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3746]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3746
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#3878]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3878
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4090]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8203 -> IGT_8204
  * Linux: xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e -> xe-pw-142946v6

  IGT_8203: 3dce04be4ed4c0e729d80f70caff8ae8a869b5c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8204: b8f853f36eed19149b36e5d70c63095c6da12ffe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e: 1895bff23f876faf3d3be7da46172eb4bb49453e
  xe-pw-142946v6: 142946v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/index.html

--===============4667727541657745534==
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
<tr><td><b>Series:</b></td><td>drm/i915/cmtg: Disable the CMTG (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/142946/">https://patchwork.freedesktop.org/series/142946/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e_full -&gt; xe-pw-142946v6_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-142946v6_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-142946v6_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-142946v6_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition@1x-outputs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-8/igt@kms_atomic_transition@modeset-transition@1x-outputs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_atomic_transition@modeset-transition@1x-outputs.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-3/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-2/igt@kms_flip@plain-flip-fb-recreate@c-hdmi-a1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_vblank@query-idle@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_vblank@query-idle@pipe-a-hdmi-a-6.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-4/igt@xe_wedged@basic-wedged.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-1/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-142946v6_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-7/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-4/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-7/igt@kms_async_flips@test-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_atomic@plane-invalid-params-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_atomic@plane-invalid-params-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-8/igt@kms_atomic_transition@modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_atomic_transition@modeset-transition.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613">Intel XE#2613</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3658">Intel XE#3658</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_big_fb@linear-16bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +11 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-1/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-2/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-3/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@kms_bw@linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-8/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-9/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-1/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-4/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-fast:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_chamelium_frames@hdmi-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-storm-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-4/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-storm-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@invalid-ctm-matrix-sizes:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-5/igt@kms_color@invalid-ctm-matrix-sizes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_color@invalid-ctm-matrix-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +17 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-7/igt@kms_content_protection@content-type-change.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-3/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_content_protection@uevent@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_content_protection@uevent@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-8/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-3/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-6/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-6/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-7/igt@kms_flip@2x-flip-vs-rmfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-463/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_flip@blocking-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +72 other tests dmesg-warn</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-lnl-5/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-3/igt@kms_flip@plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-2/igt@kms_flip@plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-2/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-9/igt@kms_flip@wf_vblank-ts-check@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-32bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-stridechange:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-2/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1341">Intel XE#1341</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_hdr@static-swap@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4090">Intel XE#4090</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE#736</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-3/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-6/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2042">Intel XE#2042</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-4/igt@kms_psr2_sf@fbc-pr-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_psr2_sf@psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-7/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-9/igt@kms_psr@fbc-psr2-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-7/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-8/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-lnl-5/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-7/igt@kms_vrr@flip-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-4/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-6/igt@kms_writeback@writeback-check-output.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-6/igt@xe_ccs@block-copy-compressed-inc-dimension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-connect:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-8/igt@xe_eudebug@basic-connect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-3/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-9/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@tdctl-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@xe_eudebug_online@tdctl-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@xe_evict@evict-beng-large-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-6/igt@xe_evict@evict-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-2/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-execqueues-null:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-7/igt@xe_exec_basic@many-execqueues-null.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@xe_exec_basic@many-execqueues-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-1/igt@xe_exec_basic@multigpu-once-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-466/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-6/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-463/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-1/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-1/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@xe_live_ktest@xe_dma_buf.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-4/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1416">Intel XE#1416</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-6/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-3/igt@xe_oa@rc6-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-3/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-5/igt@xe_pm@s3-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@xe_pm@s3-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@xe_pm@s3-vm-bind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prime_self_import@basic-llseek-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_prime_self_import@basic-llseek-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-4/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-5/igt@xe_sriov_auto_provisioning@resources-released-on-vfs-disabling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@xe_sysfs_timeslice_duration@timeslice_duration_us-timeout@vcs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +78 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_setmaster@master-drop-set-shared-fd:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@core_setmaster@master-drop-set-shared-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3453">Intel XE#3453</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@core_setmaster@master-drop-set-shared-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3746">Intel XE#3746</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip-atomic@pipe-a-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-7/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +87 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3878">Intel XE#3878</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-7/igt@kms_cursor_crc@cursor-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-466/igt@kms_fbcon_fbt@fbc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_fbcon_fbt@fbc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_flip@2x-flip-vs-panning-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-adlp-6/igt@kms_lease@lessee-list@pipe-a-hdmi-a-1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-adlp-8/igt@kms_lease@lessee-list@pipe-a-hdmi-a-1.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-lnl-7/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_sequence@get-forked@pipe-c-hdmi-a-6.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_sequence@get-forked@pipe-c-hdmi-a-6.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">PASS</a> +77 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@xe_exec_compute_mode@many-execqueues-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_exec_compute_mode@many-execqueues-basic.html">PASS</a> +22 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-imm.html">PASS</a> +33 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-1/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@xe_pm@s3-multiple-execs.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@xe_pm@s4-mocs.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-463/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-lnl-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_big_fb@y-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-463/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-8/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-5/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-cmp-planes-random:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_chamelium_frames@hdmi-cmp-planes-random.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-8/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-463/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x10:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_cursor_crc@cursor-sliding-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_cursor_edge_walk@256x256-top-bottom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_cursor_edge_walk@256x256-top-bottom.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_cursor_edge_walk@256x256-top-bottom.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-with-bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_dsc@dsc-fractional-bpp-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-2/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_dsc@dsc-with-output-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_flip@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_flip@2x-flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +6 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352">Intel XE#2352</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +5 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-top-left:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_plane@plane-panning-top-left.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_plane@plane-panning-top-left.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-2/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_pm_rpm@modeset-non-lpsp-stress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-7/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-466/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-page-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231">Intel XE#2231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@kms_psr@psr2-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-8/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-8/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-7/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-center:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-7/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413">Intel XE#2413</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-466/igt@kms_scaling_modes@scaling-mode-center.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-433/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@xe_exec_fault_mode@many-execqueues-basic-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@short-reads:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@xe_oa@short-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-436/igt@xe_oa@short-reads.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-463/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-5/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-1/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-3/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-5/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-bmg-5/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-bmg-3/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e/shard-dg2-436/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-142946v6/shard-dg2-435/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8203 -&gt; IGT_8204</li>
<li>Linux: xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e -&gt; xe-pw-142946v6</li>
</ul>
<p>IGT_8203: 3dce04be4ed4c0e729d80f70caff8ae8a869b5c0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8204: b8f853f36eed19149b36e5d70c63095c6da12ffe @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2522-1895bff23f876faf3d3be7da46172eb4bb49453e: 1895bff23f876faf3d3be7da46172eb4bb49453e<br />
  xe-pw-142946v6: 142946v6</p>

</body>
</html>

--===============4667727541657745534==--
