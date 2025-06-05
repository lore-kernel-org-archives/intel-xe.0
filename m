Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AED01C5B549
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 02:53:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CD9B10E835;
	Thu,  5 Jun 2025 02:53:01 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 302A410E7CF;
 Thu,  5 Jun 2025 02:53:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4108587333199232693=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/guc=5Fsubmit=3A_add?=
 =?utf-8?q?_back_fix_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 02:53:00 -0000
Message-ID: <174909198016.50511.12948561572735047116@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250603174213.1543579-2-matthew.auld@intel.com>
In-Reply-To: <20250603174213.1543579-2-matthew.auld@intel.com>
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

--===============4108587333199232693==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc_submit: add back fix (rev2)
URL   : https://patchwork.freedesktop.org/series/149790/
State : failure

== Summary ==

CI Bug Log - changes from xe-3186-1a8dc5c25521273300f881e23c7294453b015048_FULL -> xe-pw-149790v2_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-149790v2_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-149790v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-149790v2_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_content_protection@legacy:
    - shard-lnl:          NOTRUN -> [SKIP][1] +1 other test skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@kms_content_protection@legacy.html

  
#### Warnings ####

  * igt@kms_content_protection@uevent:
    - shard-lnl:          [SKIP][2] ([Intel XE#3278]) -> [SKIP][3] +4 other tests skip
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-lnl-1/igt@kms_content_protection@uevent.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_content_protection@uevent.html

  
New tests
---------

  New tests have been introduced between xe-3186-1a8dc5c25521273300f881e23c7294453b015048_FULL and xe-pw-149790v2_FULL:

### New IGT tests (1) ###

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.38] s

  

Known issues
------------

  Here are the changes found in xe-pw-149790v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][4] ([Intel XE#623])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#4208] / [i915#2575]) +2 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [PASS][6] -> [FAIL][7] ([Intel XE#911]) +3 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][8] -> [DMESG-WARN][9] ([Intel XE#4543]) +7 other tests dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-dp-4-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#3767]) +31 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-dp-4-4-rc-ccs-cc.html

  * igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][11] -> [FAIL][12] ([Intel XE#3884]) +1 other test fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#873])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@invalid-async-flip-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#3768])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_async_flips@invalid-async-flip-atomic.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][15] ([Intel XE#1124]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#316]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1407]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-7/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2327])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][19] ([Intel XE#4543])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#607])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#1124]) +5 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [PASS][22] -> [DMESG-FAIL][23] ([Intel XE#4543]) +9 other tests dmesg-fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#1124]) +11 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#619])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#610])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#1124]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [PASS][28] -> [SKIP][29] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#2191]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#2191])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#367]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#367])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2887]) +3 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#787]) +23 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2652] / [Intel XE#787]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#2887]) +9 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#3442])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#3432])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#3432]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#787]) +160 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#2907]) +2 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#455] / [Intel XE#787]) +30 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2325])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#306])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-4/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-limited-range:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#306]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#373]) +7 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_frames@dp-crc-multiple:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#373])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_chamelium_frames@dp-crc-multiple.html

  * igt@kms_chamelium_hpd@common-hpd-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2252]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#373]) +6 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#307])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2341])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][54] ([Intel XE#1178]) +2 other tests fail
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-463/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#308])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#308]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-64x64:
    - shard-adlp:         [PASS][57] -> [DMESG-WARN][58] ([Intel XE#2953] / [Intel XE#4173]) +10 other tests dmesg-warn
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-3/igt@kms_cursor_crc@cursor-random-64x64.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-9/igt@kms_cursor_crc@cursor-random-64x64.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#1424]) +2 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#2291])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#309]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#309])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-bmg:          [PASS][63] -> [SKIP][64] ([Intel XE#2291]) +7 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][65] ([Intel XE#323]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dirtyfb@drrs-dirtyfb-ioctl:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1508])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#4494] / [i915#3804])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_dp_link_training@non-uhbr-mst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#4354])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-435/igt@kms_dp_link_training@non-uhbr-mst.html

  * igt@kms_dp_link_training@non-uhbr-sst:
    - shard-bmg:          [PASS][69] -> [SKIP][70] ([Intel XE#4354])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-sst.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#4356])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_dp_link_training@uhbr-sst.html
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#4354])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#4422])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][74] ([Intel XE#1138])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][75] -> [FAIL][76] ([Intel XE#301])
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#2316]) +9 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@2x-plain-flip-ts-check:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1421])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-4/igt@kms_flip@2x-plain-flip-ts-check.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][80] ([Intel XE#301]) +3 other tests fail
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2293] / [Intel XE#2380])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1401]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][83] ([Intel XE#455]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2293])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][85] -> [DMESG-FAIL][86] ([Intel XE#4543] / [Intel XE#4921]) +3 other tests dmesg-fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][87] ([Intel XE#2351] / [Intel XE#4208])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1401] / [Intel XE#1745]) +2 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:
    - shard-adlp:         [PASS][89] -> [FAIL][90] ([Intel XE#1874])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#352])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#651]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#651]) +4 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#656]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#4141]) +2 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2312]) +3 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#2311]) +4 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#651]) +31 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#653]) +2 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#656]) +23 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#1158])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2313]) +5 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#653]) +33 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#1503])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-8/igt@kms_hdr@invalid-metadata-sizes.html
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#1503])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          [PASS][106] -> [SKIP][107] ([Intel XE#1503]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-8/igt@kms_hdr@static-toggle.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#2925]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#356])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][110] ([Intel XE#4735])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:
    - shard-lnl:          NOTRUN -> [WARN][111] ([Intel XE#4801])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [PASS][112] -> [FAIL][113] ([Intel XE#616]) +1 other test fail
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][114] ([Intel XE#616]) +2 other tests fail
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#599]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [PASS][116] -> [SKIP][117] ([Intel XE#4596])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-none.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-dg2-set2:     NOTRUN -> [SKIP][118] ([Intel XE#5021])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-dg2-set2:     [PASS][119] -> [SKIP][120] ([Intel XE#4208] / [i915#2575]) +17 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#2763]) +3 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html

  * igt@kms_pm_backlight@basic-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#870])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-adlp:         NOTRUN -> [SKIP][123] ([Intel XE#1129])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][124] -> [FAIL][125] ([Intel XE#718]) +1 other test fail
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          NOTRUN -> [FAIL][126] ([Intel XE#2029])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][127] ([Intel XE#2499])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#2893] / [Intel XE#4608])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#4608]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-cursor-plane-update-sf:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#2893]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1489]) +10 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][132] ([Intel XE#1489]) +1 other test skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#1489]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1128])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-8/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2234] / [Intel XE#2850]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-sprite-render@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#4609])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html

  * igt@kms_psr@pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][137] ([Intel XE#1406]) +4 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_psr@pr-cursor-plane-move.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-adlp:         NOTRUN -> [SKIP][138] ([Intel XE#2850] / [Intel XE#929])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-8/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#2850] / [Intel XE#929]) +15 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_psr@psr-dpms.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#2939])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#3414] / [Intel XE#3904])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#3414]) +2 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#3414] / [Intel XE#3904]) +4 other tests skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [PASS][144] -> [FAIL][145] ([Intel XE#2883]) +2 other tests fail
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][146] ([Intel XE#1435])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2426])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][148] ([Intel XE#1499]) +1 other test skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-2/igt@kms_vrr@flip-suspend.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#455]) +16 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_vrr@flipline.html

  * igt@kms_vrr@negative-basic:
    - shard-bmg:          [PASS][150] -> [SKIP][151] ([Intel XE#1499])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-5/igt@kms_vrr@negative-basic.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_vrr@negative-basic.html

  * igt@xe_compute_preempt@compute-preempt-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][152] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#1123])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eu_stall@blocking-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#4497])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-433/igt@xe_eu_stall@blocking-read.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#4837]) +4 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-3/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-adlp:         NOTRUN -> [SKIP][156] ([Intel XE#4837]) +2 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-9/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][157] ([Intel XE#4837]) +14 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug@vm-bind-clear-faultable:
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#4837]) +9 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-7/igt@xe_eudebug@vm-bind-clear-faultable.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#4518])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-lnl:          NOTRUN -> [SKIP][160] ([Intel XE#4518])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@xe_eudebug_sriov@deny-eudebug.html
    - shard-bmg:          NOTRUN -> [SKIP][161] ([Intel XE#4518])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict@evict-large-external:
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#261] / [Intel XE#688])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@xe_evict@evict-large-external.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][163] ([Intel XE#688]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][164] ([Intel XE#1392]) +2 other tests skip
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][165] ([Intel XE#2322]) +1 other test skip
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][166] ([Intel XE#1392]) +1 other test skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][167] ([Intel XE#1392]) +3 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-once-null:
    - shard-dg2-set2:     [PASS][168] -> [SKIP][169] ([Intel XE#1392]) +3 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@xe_exec_basic@multigpu-once-null.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#288]) +28 other tests skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][171] ([Intel XE#288]) +5 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock:
    - shard-adlp:         NOTRUN -> [SKIP][172] ([Intel XE#4915]) +38 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock.html

  * igt@xe_exec_system_allocator@process-many-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][173] ([Intel XE#4943]) +13 other tests skip
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@xe_exec_system_allocator@process-many-mmap-huge.html

  * igt@xe_exec_system_allocator@threads-many-mmap-free-huge:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#4943]) +1 other test skip
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#4915]) +266 other tests skip
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [PASS][176] -> [FAIL][177] ([Intel XE#5018])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#4208]) +32 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     NOTRUN -> [ABORT][179] ([Intel XE#4917])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][180] ([Intel XE#4911])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#2229])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][182] ([Intel XE#560])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@xe_media_fill@media-fill.html

  * igt@xe_oa@invalid-oa-metric-set-id:
    - shard-adlp:         NOTRUN -> [SKIP][183] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@xe_oa@invalid-oa-metric-set-id.html

  * igt@xe_oa@non-privileged-map-oa-buffer:
    - shard-dg2-set2:     NOTRUN -> [SKIP][184] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-435/igt@xe_oa@non-privileged-map-oa-buffer.html

  * igt@xe_oa@syncs-syncobj-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][185] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501]) +1 other test skip
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@xe_oa@syncs-syncobj-cfg.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][186] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-1/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][187] ([Intel XE#977])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-463/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm@d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][188] ([Intel XE#2284] / [Intel XE#366])
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html
    - shard-lnl:          NOTRUN -> [SKIP][189] ([Intel XE#2284] / [Intel XE#366])
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@xe_pm@d3cold-basic-exec.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          NOTRUN -> [ABORT][190] ([Intel XE#1794])
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][191] ([Intel XE#4733]) +2 other tests skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
    - shard-bmg:          NOTRUN -> [SKIP][192] ([Intel XE#4733])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-adlp:         NOTRUN -> [SKIP][193] ([Intel XE#944])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][194] ([Intel XE#944]) +5 other tests skip
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][195] ([Intel XE#4814])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@xe_render_copy@render-stress-1-copies.html

  * igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:
    - shard-lnl:          NOTRUN -> [SKIP][196] ([Intel XE#4130]) +1 other test skip
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html

  * igt@xe_vm@invalid-extensions:
    - shard-dg2-set2:     [PASS][197] -> [SKIP][198] ([Intel XE#4208]) +27 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-432/igt@xe_vm@invalid-extensions.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_vm@invalid-extensions.html

  
#### Possible fixes ####

  * igt@core_auth@basic-auth:
    - shard-adlp:         [SKIP][199] -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@core_auth@basic-auth.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@core_auth@basic-auth.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-adlp:         [SKIP][201] ([Intel XE#4963]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@core_hotunplug@hotunplug-rescan.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@core_hotunplug@hotunplug-rescan.html

  * igt@intel_hwmon@hwmon-write:
    - shard-bmg:          [FAIL][203] ([Intel XE#4665]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-2/igt@intel_hwmon@hwmon-write.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@intel_hwmon@hwmon-write.html

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-adlp:         [DMESG-WARN][205] ([Intel XE#4543]) -> [PASS][206] +2 other tests pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [FAIL][207] ([Intel XE#3908]) -> [PASS][208] +1 other test pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         [SKIP][209] ([Intel XE#4947]) -> [PASS][210] +3 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][211] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][213] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4345]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:
    - shard-dg2-set2:     [INCOMPLETE][215] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][216]
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][217] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][218] +1 other test pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-bmg:          [SKIP][219] ([Intel XE#2291]) -> [PASS][220] +2 other tests pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc:
    - shard-bmg:          [SKIP][221] ([Intel XE#1340]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html

  * igt@kms_flip@2x-absolute-wf_vblank:
    - shard-bmg:          [SKIP][223] ([Intel XE#2316]) -> [PASS][224] +1 other test pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-1/igt@kms_flip@2x-absolute-wf_vblank.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][225] ([Intel XE#3321]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [SKIP][227] ([Intel XE#4950]) -> [PASS][228] +13 other tests pass
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][229] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][230] +1 other test pass
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         [DMESG-FAIL][231] ([Intel XE#4543]) -> [PASS][232] +8 other tests pass
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][233] ([Intel XE#1503]) -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-5/igt@kms_hdr@invalid-hdr.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-2/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pm_rpm@i2c:
    - shard-adlp:         [SKIP][235] ([Intel XE#4962]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_pm_rpm@i2c.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_pm_rpm@i2c.html

  * igt@xe_exec_basic@multigpu-once-rebind:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#1392]) -> [PASS][238] +3 other tests pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-433/igt@xe_exec_basic@multigpu-once-rebind.html

  * igt@xe_exec_threads@threads-rebind:
    - shard-adlp:         [SKIP][239] ([Intel XE#4945]) -> [PASS][240] +27 other tests pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_exec_threads@threads-rebind.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-9/igt@xe_exec_threads@threads-rebind.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-adlp:         [FAIL][241] ([Intel XE#3099]) -> [PASS][242] +2 other tests pass
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_module_load@reload-no-display:
    - shard-bmg:          [ABORT][243] ([Intel XE#5087]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-7/igt@xe_module_load@reload-no-display.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][245] ([Intel XE#1794]) -> [PASS][246]
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@xe_pm@s4-basic-exec.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-8bpp-rotate-180:
    - shard-adlp:         [SKIP][247] ([Intel XE#4947]) -> [SKIP][248] ([Intel XE#1124]) +2 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-adlp:         [SKIP][249] ([Intel XE#4947]) -> [SKIP][250] ([Intel XE#316])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [SKIP][251] ([Intel XE#4947]) -> [DMESG-FAIL][252] ([Intel XE#4543])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#1124]) -> [SKIP][254] ([Intel XE#4208])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#2191]) -> [SKIP][256] ([Intel XE#4208] / [i915#2575])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         [SKIP][257] ([Intel XE#4950]) -> [SKIP][258] ([Intel XE#367])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         [SKIP][259] ([Intel XE#4947]) -> [SKIP][260] ([Intel XE#455] / [Intel XE#787]) +2 other tests skip
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][262] ([Intel XE#4208])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:
    - shard-adlp:         [SKIP][263] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][264] ([Intel XE#455] / [Intel XE#787])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][265] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [SKIP][266] ([Intel XE#4208])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-adlp:         [SKIP][267] ([Intel XE#4950]) -> [SKIP][268] ([Intel XE#306])
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_chamelium_color@ctm-0-25.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-adlp:         [SKIP][269] ([Intel XE#4950]) -> [SKIP][270] ([Intel XE#373]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#373]) -> [SKIP][272] ([Intel XE#4208] / [i915#2575]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@atomic:
    - shard-bmg:          [FAIL][273] ([Intel XE#1178]) -> [SKIP][274] ([Intel XE#2341]) +1 other test skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-2/igt@kms_content_protection@atomic.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x32:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#455]) -> [SKIP][276] ([Intel XE#4208] / [i915#2575])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-adlp:         [SKIP][277] ([Intel XE#4950]) -> [SKIP][278] ([Intel XE#309]) +2 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_dp_aux_dev:
    - shard-adlp:         [SKIP][279] ([Intel XE#4950]) -> [SKIP][280] ([Intel XE#3009])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_dp_aux_dev.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-expired-vblank:
    - shard-bmg:          [FAIL][281] ([Intel XE#3321]) -> [SKIP][282] ([Intel XE#2316])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-adlp:         [SKIP][283] ([Intel XE#4947]) -> [SKIP][284] ([Intel XE#455])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         [SKIP][285] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][286] ([Intel XE#656]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#651]) -> [SKIP][288] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][289] ([Intel XE#2311]) -> [SKIP][290] ([Intel XE#2312]) +25 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][291] ([Intel XE#4947]) -> [SKIP][292] ([Intel XE#656]) +8 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][293] ([Intel XE#2312]) -> [SKIP][294] ([Intel XE#4141]) +6 other tests skip
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][295] ([Intel XE#4141]) -> [SKIP][296] ([Intel XE#2312]) +10 other tests skip
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:
    - shard-adlp:         [SKIP][297] ([Intel XE#4947]) -> [SKIP][298] ([Intel XE#651]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][299] ([Intel XE#2312]) -> [SKIP][300] ([Intel XE#2311]) +10 other tests skip
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][301] ([Intel XE#651]) -> [SKIP][302] ([Intel XE#4208])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#653]) -> [SKIP][304] ([Intel XE#4208])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#653]) -> [SKIP][306] ([Intel XE#2351] / [Intel XE#4208]) +1 other test skip
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:
    - shard-bmg:          [SKIP][307] ([Intel XE#2313]) -> [SKIP][308] ([Intel XE#2312]) +21 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         [SKIP][309] ([Intel XE#4947]) -> [SKIP][310] ([Intel XE#653]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][311] ([Intel XE#2312]) -> [SKIP][312] ([Intel XE#2313]) +12 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#1122]) -> [SKIP][314] ([Intel XE#2351] / [Intel XE#4208])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:
    - shard-adlp:         [SKIP][315] ([Intel XE#4947]) -> [SKIP][316] ([Intel XE#1489]) +1 other test skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr-sprite-blt:
    - shard-adlp:         [SKIP][317] ([Intel XE#4947]) -> [SKIP][318] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_psr@fbc-psr-sprite-blt.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@kms_psr@fbc-psr-sprite-blt.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][320] ([Intel XE#4208]) +1 other test skip
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-blt.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-adlp:         [SKIP][321] ([Intel XE#4950]) -> [FAIL][322] ([Intel XE#1874])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-adlp:         [SKIP][323] ([Intel XE#4950]) -> [SKIP][324] ([Intel XE#3414])
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_rotation_crc@primary-rotation-270.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#1127]) -> [SKIP][326] ([Intel XE#4208] / [i915#2575])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#3414]) -> [SKIP][328] ([Intel XE#4208] / [i915#2575])
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_vrr@flip-suspend:
    - shard-adlp:         [SKIP][329] ([Intel XE#4950]) -> [SKIP][330] ([Intel XE#455]) +3 other tests skip
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_vrr@flip-suspend.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-8/igt@kms_vrr@flip-suspend.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][331] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][332] ([Intel XE#4208] / [i915#2575])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-adlp:         [SKIP][333] ([Intel XE#4945]) -> [SKIP][334] ([Intel XE#1123])
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#1126]) -> [SKIP][336] ([Intel XE#4208])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-access:
    - shard-adlp:         [SKIP][337] ([Intel XE#4945]) -> [SKIP][338] ([Intel XE#4837]) +3 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_eudebug@basic-vm-access.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-9/igt@xe_eudebug@basic-vm-access.html

  * igt@xe_eudebug_sriov@deny-eudebug:
    - shard-adlp:         [SKIP][339] ([Intel XE#4945]) -> [SKIP][340] ([Intel XE#4519])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_eudebug_sriov@deny-eudebug.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@xe_eudebug_sriov@deny-eudebug.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-adlp:         [SKIP][341] ([Intel XE#4945]) -> [SKIP][342] ([Intel XE#688])
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-adlp:         [SKIP][343] ([Intel XE#4945]) -> [SKIP][344] ([Intel XE#1392]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#1392]) -> [SKIP][346] ([Intel XE#4208])
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#288]) -> [SKIP][348] ([Intel XE#4208]) +1 other test skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:
    - shard-adlp:         [SKIP][349] ([Intel XE#4945]) -> [SKIP][350] ([Intel XE#288]) +6 other tests skip
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html

  * igt@xe_exec_system_allocator@process-many-large-free:
    - shard-adlp:         [SKIP][351] ([Intel XE#4945]) -> [SKIP][352] ([Intel XE#4915]) +52 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_exec_system_allocator@process-many-large-free.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-1/igt@xe_exec_system_allocator@process-many-large-free.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#4915]) -> [SKIP][354] ([Intel XE#4208]) +32 other tests skip
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-433/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html

  * igt@xe_oa@disabled-read-error:
    - shard-dg2-set2:     [SKIP][355] ([Intel XE#2541] / [Intel XE#3573]) -> [SKIP][356] ([Intel XE#4208])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@xe_oa@disabled-read-error.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_oa@disabled-read-error.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-adlp:         [SKIP][357] ([Intel XE#4945]) -> [SKIP][358] ([Intel XE#2541] / [Intel XE#3573])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_oa@oa-regs-whitelisted.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         [SKIP][359] ([Intel XE#4945]) -> [SKIP][360] ([Intel XE#977])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_pat@pat-index-xe2.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#979]) -> [SKIP][362] ([Intel XE#4208])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-adlp:         [SKIP][363] ([Intel XE#4945]) -> [SKIP][364] ([Intel XE#2284] / [Intel XE#366])
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_pm@s3-d3cold-basic-exec.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pxp@pxp-termination-key-update-post-rpm:
    - shard-adlp:         [SKIP][365] ([Intel XE#4945]) -> [SKIP][366] ([Intel XE#4733])
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_pxp@pxp-termination-key-update-post-rpm.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@xe_pxp@pxp-termination-key-update-post-rpm.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#944]) -> [SKIP][368] ([Intel XE#4208])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-434/igt@xe_query@multigpu-query-config.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_query@multigpu-query-config.html

  * igt@xe_render_copy@render-stress-1-copies:
    - shard-adlp:         [SKIP][369] ([Intel XE#4945]) -> [SKIP][370] ([Intel XE#4814])
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_render_copy@render-stress-1-copies.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@xe_render_copy@render-stress-1-copies.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3099]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/356
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3768]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768
  [Intel XE#3884]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4497]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#4665]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4735]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4735
  [Intel XE#4801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4801
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#4963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5087]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087
  [Intel XE#5172]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5172
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * IGT: IGT_8392 -> IGT_8393
  * Linux: xe-3186-1a8dc5c25521273300f881e23c7294453b015048 -> xe-pw-149790v2

  IGT_8392: 8392
  IGT_8393: 6a256bfe3025b94fcef3757e4edd6b2198cecf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3186-1a8dc5c25521273300f881e23c7294453b015048: 1a8dc5c25521273300f881e23c7294453b015048
  xe-pw-149790v2: 149790v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/index.html

--===============4108587333199232693==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc_submit: add back fix (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149790/">https://patchwork.freedesktop.org/series/149790/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3186-1a8dc5c25521273300f881e23c7294453b015048_FULL -&gt; xe-pw-149790v2_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-149790v2_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-149790v2_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-149790v2_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_content_protection@legacy:<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@kms_content_protection@legacy.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_content_protection@uevent:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-lnl-1/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278">Intel XE#3278</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_content_protection@uevent.html">SKIP</a> +4 other tests skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3186-1a8dc5c25521273300f881e23c7294453b015048_FULL and xe-pw-149790v2_FULL:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-b-hdmi-a-3:<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.38] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-149790v2_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_async_flips@alternate-sync-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-dp-4-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-463/igt@kms_async_flips@async-flip-with-page-flip-events-tiled@pipe-d-dp-4-4-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-2/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_async_flips@crc-atomic@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3884">Intel XE#3884</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-435/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_async_flips@invalid-async-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3768">Intel XE#3768</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_big_fb@4-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-463/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-7/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-463/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +9 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-8/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-8/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-3/igt@kms_ccs@bad-rotation-90-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-8/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +160 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-4/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-limited-range:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-433/igt@kms_chamelium_color@ctm-limited-range.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-multiple:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_chamelium_frames@dp-crc-multiple.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@kms_chamelium_hpd@common-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-463/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-64x64:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-3/igt@kms_cursor_crc@cursor-random-64x64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-9/igt@kms_cursor_crc@cursor-random-64x64.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_cursor_legacy@2x-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@drrs-dirtyfb-ioctl:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@kms_dirtyfb@drrs-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-435/igt@kms_dp_link_training@non-uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-sst:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-2/igt@kms_dp_link_training@non-uhbr-sst.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_dp_link_training@non-uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356">Intel XE#4356</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354">Intel XE#4354</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-dirtyfb-tests.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-2/igt@kms_flip@2x-nonexisting-fb.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_flip@2x-nonexisting-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-4/igt@kms_flip@2x-plain-flip-ts-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#4921</a>) +3 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-x-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-463/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-8/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_hdr@invalid-metadata-sizes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-8/igt@kms_hdr@static-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_hdr@static-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_joiner@switch-modeset-ultra-joiner-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/356">Intel XE#356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4735">Intel XE#4735</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_plane@pixel-format-source-clamping@pipe-a-plane-0.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4801">Intel XE#4801</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-463/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-2/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@basic-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_pm_backlight@basic-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_pm_dc@dc5-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-4/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_psr2_sf@pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-8/igt@kms_psr2_sf@pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-8/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@kms_psr@fbc-psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@kms_psr@pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-8/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-435/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-7/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-lnl-1/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@kms_setmode@invalid-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-2/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-5/igt@kms_vrr@negative-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-435/igt@xe_compute_preempt@compute-preempt-many.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-463/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@blocking-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-433/igt@xe_eu_stall@blocking-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4497">Intel XE#4497</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-3/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-9/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@vm-bind-clear-faultable:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-7/igt@xe_eudebug@vm-bind-clear-faultable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@xe_evict@evict-large-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-8/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@xe_exec_basic@multigpu-once-null.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-433/igt@xe_exec_fault_mode@twice-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@xe_exec_fault_mode@twice-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@xe_exec_system_allocator@process-many-large-mmap-file-mlock.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@xe_exec_system_allocator@process-many-mmap-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-free-huge:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@xe_exec_system_allocator@threads-many-mmap-free-huge.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-mmap-shared-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +266 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-remap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_fault_injection@probe-fail-guc-xe_guc_mmio_send_recv.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4911">Intel XE#4911</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-5/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-metric-set-id:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@xe_oa@invalid-oa-metric-set-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-map-oa-buffer:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-435/igt@xe_oa@non-privileged-map-oa-buffer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-syncobj-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@xe_oa@syncs-syncobj-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-1/igt@xe_oa@syncs-ufence-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-463/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-1/igt@xe_pm@d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-1/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@xe_query@multigpu-query-oa-units.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-436/igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-lnl-3/igt@xe_sriov_auto_provisioning@selfconfig-reprovision-reduce-numvfs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130">Intel XE#4130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@invalid-extensions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-432/igt@xe_vm@invalid-extensions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_vm@invalid-extensions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +27 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_auth@basic-auth:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@core_auth@basic-auth.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@core_auth@basic-auth.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@core_hotunplug@hotunplug-rescan.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4963">Intel XE#4963</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@core_hotunplug@hotunplug-rescan.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-2/igt@intel_hwmon@hwmon-write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4665">Intel XE#4665</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@intel_hwmon@hwmon-write.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-1/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_async_flips@async-flip-suspend-resume.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-9/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-c-hdmi-a-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-3/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1340">Intel XE#1340</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@kms_dither@fb-8bpc-vs-panel-6bpc.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-1/igt@kms_flip@2x-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-2/igt@kms_flip@2x-absolute-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +13 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel XE#4921</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@i2c:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_pm_rpm@i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_pm_rpm@i2c.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-432/igt@xe_exec_basic@multigpu-once-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-433/igt@xe_exec_basic@multigpu-once-rebind.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_exec_threads@threads-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-9/igt@xe_exec_threads@threads-rebind.html">PASS</a> +27 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3099">Intel XE#3099</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-7/igt@xe_module_load@reload-no-display.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5087">Intel XE#5087</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_big_fb@4-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-433/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-1/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-1/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-2/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x32:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-6/igt@kms_flip@2x-flip-vs-expired-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcdrrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_psr@fbc-psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@kms_psr@fbc-psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-8/igt@kms_vrr@flip-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-9/igt@xe_eudebug@basic-vm-access.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-eudebug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@xe_eudebug_sriov@deny-eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4519">Intel XE#4519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@xe_exec_fault_mode@twice-bindexecqueue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-free:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_exec_system_allocator@process-many-large-free.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-1/igt@xe_exec_system_allocator@process-many-large-free.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-433/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_exec_system_allocator@threads-shared-vm-many-large-malloc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@disabled-read-error:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-435/igt@xe_oa@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_oa@disabled-read-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@xe_oa@oa-regs-whitelisted.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-433/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-4/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-termination-key-update-post-rpm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-2/igt@xe_pxp@pxp-termination-key-update-post-rpm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-dg2-434/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-dg2-434/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-1-copies:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3186-1a8dc5c25521273300f881e23c7294453b015048/shard-adlp-4/igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149790v2/shard-adlp-6/igt@xe_render_copy@render-stress-1-copies.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8392 -&gt; IGT_8393</li>
<li>Linux: xe-3186-1a8dc5c25521273300f881e23c7294453b015048 -&gt; xe-pw-149790v2</li>
</ul>
<p>IGT_8392: 8392<br />
  IGT_8393: 6a256bfe3025b94fcef3757e4edd6b2198cecf63 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3186-1a8dc5c25521273300f881e23c7294453b015048: 1a8dc5c25521273300f881e23c7294453b015048<br />
  xe-pw-149790v2: 149790v2</p>

</body>
</html>

--===============4108587333199232693==--
