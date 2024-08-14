Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 160A3C52D7F
	for <intel-xe@archiver.kernel.org>; Wed, 14 Aug 2024 17:45:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D6A9010E500;
	Wed, 14 Aug 2024 17:45:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B118410E4FF;
 Wed, 14 Aug 2024 17:45:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4327614705952724871=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_add_wopcm_device_info?=
 =?utf-8?q?_and_set_region_into_Guc_registers_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Farah Kassabri" <fkassabri@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Aug 2024 17:45:56 -0000
Message-ID: <172365755671.633672.16571579691084367006@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240814120432.2040511-1-fkassabri@habana.ai>
In-Reply-To: <20240814120432.2040511-1-fkassabri@habana.ai>
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

--===============4327614705952724871==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: add wopcm device info and set region into Guc registers (rev3)
URL   : https://patchwork.freedesktop.org/series/133879/
State : failure

== Summary ==

CI Bug Log - changes from xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6_full -> xe-pw-133879v3_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-133879v3_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133879v3_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133879v3_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:
    - shard-lnl:          [PASS][1] -> [FAIL][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-7/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-1/igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1.html

  * igt@runner@aborted:
    - shard-adlp:         NOTRUN -> ([FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25], [FAIL][26])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-2/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-1/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-8/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-6/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-4/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-9/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-8/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-2/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-8/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-4/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-6/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-8/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-9/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-1/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-8/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-4/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-6/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-4/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-9/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-2/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-9/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-1/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-2/igt@runner@aborted.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-1/igt@runner@aborted.html
    - shard-dg2-set2:     NOTRUN -> ([FAIL][27], [FAIL][28], [FAIL][29], [FAIL][30], [FAIL][31], [FAIL][32], [FAIL][33], [FAIL][34], [FAIL][35], [FAIL][36], [FAIL][37], [FAIL][38], [FAIL][39], [FAIL][40], [FAIL][41], [FAIL][42], [FAIL][43], [FAIL][44], [FAIL][45], [FAIL][46], [FAIL][47], [FAIL][48])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-432/igt@runner@aborted.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-434/igt@runner@aborted.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-433/igt@runner@aborted.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-466/igt@runner@aborted.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-434/igt@runner@aborted.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-434/igt@runner@aborted.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-466/igt@runner@aborted.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-433/igt@runner@aborted.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-463/igt@runner@aborted.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-432/igt@runner@aborted.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-463/igt@runner@aborted.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-433/igt@runner@aborted.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-434/igt@runner@aborted.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-466/igt@runner@aborted.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-463/igt@runner@aborted.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-435/igt@runner@aborted.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-432/igt@runner@aborted.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-466/igt@runner@aborted.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-463/igt@runner@aborted.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-466/igt@runner@aborted.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-463/igt@runner@aborted.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-432/igt@runner@aborted.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_content_protection@srm:
    - {shard-bmg}:        [FAIL][49] ([Intel XE#1178]) -> [INCOMPLETE][50] +1 other test incomplete
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-6/igt@kms_content_protection@srm.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-bmg-1/igt@kms_content_protection@srm.html

  
Known issues
------------

  Here are the changes found in xe-pw-133879v3_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#911]) +3 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#1659])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_frontbuffer_tracking@fbcpsr-suspend:
    - shard-lnl:          [PASS][55] -> [FAIL][56] ([Intel XE#2028]) +5 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcpsr-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-lnl:          [PASS][57] -> [FAIL][58] ([Intel XE#2028] / [Intel XE#2533]) +2 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@xe_evict@evict-large:
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#688])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-8/igt@xe_evict@evict-large.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][60] -> [ABORT][61] ([Intel XE#1794])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-6/igt@xe_pm@s4-vm-bind-userptr.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3:
    - {shard-bmg}:        [DMESG-WARN][62] ([Intel XE#1033]) -> [PASS][63] +1 other test pass
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-3/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [FAIL][64] ([Intel XE#1701]) -> [PASS][65] +1 other test pass
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [FAIL][66] ([Intel XE#1659]) -> [PASS][67]
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-3/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3:
    - {shard-bmg}:        [FAIL][68] ([Intel XE#2436]) -> [PASS][69]
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html

  * igt@kms_flip@wf_vblank-ts-check@b-edp1:
    - shard-lnl:          [FAIL][70] ([Intel XE#886]) -> [PASS][71] +2 other tests pass
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-2/igt@kms_flip@wf_vblank-ts-check@b-edp1.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        [SKIP][72] ([Intel XE#1503]) -> [PASS][73]
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-bmg-3/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [DMESG-FAIL][74] ([Intel XE#324]) -> [PASS][75] +1 other test pass
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-2/igt@kms_plane@plane-position-hole.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-4/igt@kms_plane@plane-position-hole.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-lnl:          [SKIP][76] ([Intel XE#870]) -> [PASS][77] +1 other test pass
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-4/igt@kms_pm_backlight@fade-with-suspend.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-3/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-2:
    - {shard-bmg}:        [FAIL][78] ([Intel XE#899]) -> [PASS][79]
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-5/igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-2.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-bmg-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-2.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [FAIL][80] ([Intel XE#2443]) -> [PASS][81] +3 other tests pass
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-2/igt@kms_vrr@flip-basic.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-4/igt@kms_vrr@flip-basic.html

  * igt@xe_evict@evict-cm-threads-large:
    - {shard-bmg}:        [TIMEOUT][82] ([Intel XE#1473]) -> [PASS][83] +1 other test pass
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-7/igt@xe_evict@evict-cm-threads-large.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-bmg-7/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_pm@s2idle-basic:
    - shard-lnl:          [FAIL][84] ([Intel XE#2028]) -> [PASS][85] +2 other tests pass
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-1/igt@xe_pm@s2idle-basic.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-5/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][86] ([Intel XE#1794]) -> [PASS][87]
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-5/igt@xe_pm@s4-mocs.html

  * igt@xe_vm@large-userptr-split-binds-268435456:
    - {shard-bmg}:        [DMESG-WARN][88] ([Intel XE#877]) -> [PASS][89] +5 other tests pass
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-3/igt@xe_vm@large-userptr-split-binds-268435456.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-bmg-1/igt@xe_vm@large-userptr-split-binds-268435456.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2248]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2248
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2533
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911


Build changes
-------------

  * IGT: IGT_7968 -> IGT_7969
  * Linux: xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6 -> xe-pw-133879v3

  IGT_7968: 5073187c568304daf01d71f6fed415d759c6e363 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7969: 4aa543467adf6e61ed57e2c0a84a0534923aacc6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6: 95179e2efd2e2f61d5453d323fdb6e136fc15df6
  xe-pw-133879v3: 133879v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/index.html

--===============4327614705952724871==
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
<tr><td><b>Series:</b></td><td>drm/xe: add wopcm device info and set region=
 into Guc registers (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/133879/">https://patchwork.freedesktop.org/series/133879/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-133879v3/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-133879v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1765-95179e2efd2e2f61d5453d323fdb6e136=
fc15df6_full -&gt; xe-pw-133879v3_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-133879v3_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-133879v3_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1338=
79v3_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-7/igt@kms_vbla=
nk@ts-continuation-suspend@pipe-c-edp-1.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-1/igt@kms_v=
blank@ts-continuation-suspend@pipe-c-edp-1.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-133879v3/shard-adlp-2/igt@runner@aborted.html">FAIL</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/sha=
rd-adlp-1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-8/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13387=
9v3/shard-adlp-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-4/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-133879v3/shard-adlp-9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-8/igt@runner=
@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-133879v3/shard-adlp-2/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-8/i=
gt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-133879v3/shard-adlp-4/igt@runner@aborted.html">FAIL</a>, =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-a=
dlp-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-8/igt@runner@aborted.html">FAI=
L</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/=
shard-adlp-9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-1/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
3879v3/shard-adlp-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-4/igt@runner@abo=
rted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-133879v3/shard-adlp-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-4/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-133879v3/shard-adlp-9/igt@runner@aborted.html">FAIL</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-2/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-133879v3/shard-adlp-9/igt@runner@aborted.html">FAIL</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-=
adlp-1/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-133879v3/shard-adlp-2/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3=
/shard-adlp-1/igt@runner@aborted.html">FAIL</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-133879v3/shard-dg2-432/igt@runner@aborted.html">FAIL<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/sh=
ard-dg2-434/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-433/igt@runner@aborted.ht=
ml">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
3879v3/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-434/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-133879v3/shard-dg2-434/igt@runner@aborted.html">FAIL</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-466/igt=
@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-133879v3/shard-dg2-433/igt@runner@aborted.html">FAIL</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg=
2-463/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-432/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3=
/shard-dg2-463/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-433/igt@runner@aborted=
.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-133879v3/shard-dg2-434/igt@runner@aborted.html">FAIL</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-466/igt@runne=
r@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-133879v3/shard-dg2-463/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-435/=
igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-133879v3/shard-dg2-432/igt@runner@aborted.html">FAIL</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard=
-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-463/igt@runner@aborted.html"=
>FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13387=
9v3/shard-dg2-466/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-dg2-463/igt@runner@abor=
ted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-133879v3/shard-dg2-432/igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>igt@kms_content_protection@srm:<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-6/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-bmg-1/igt@kms_content_=
protection@srm.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133879v3_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-4/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/=
shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp=
-1-linear.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-3/igt@kms_big_=
fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-6/i=
gt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel =
XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-4/igt@kms_fron=
tbuffer_tracking@fbcpsr-suspend.html">PASS</a> -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-1/igt@kms_frontbuff=
er_tracking@fbcpsr-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +5 other tests fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-8/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-1/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">FAIL</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2533">Intel XE#2533=
</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-133879v3/shard-lnl-8/igt@xe_evict@evict-large.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/688"=
>Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-6/igt@xe_pm@s4=
-vm-bind-userptr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-133879v3/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.htm=
l">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/1794">Intel XE#1794</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-3/igt@kms_asyn=
c_flips@alternate-sync-async-flip@pipe-c-hdmi-a-3.html">DMESG-WARN</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#=
1033</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
133879v3/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-h=
dmi-a-3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-7/igt@kms_atom=
ic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#170=
1</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133=
879v3/shard-lnl-8/igt@kms_atomic_transition@modeset-transition-nonblocking-=
fencing.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-6/igt@kms_big_=
fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-3/igt@kms=
_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-6/igt@kms_ccs@=
crc-sprite-planes-basic-4-tiled-xe2-ccs@pipe-d-hdmi-a-3.html">FAIL</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#=
2436</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
133879v3/shard-bmg-1/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs@pi=
pe-d-hdmi-a-3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-2/igt@kms_flip=
@wf_vblank-ts-check@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-2/igt@kms_fl=
ip@wf_vblank-ts-check@b-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-6/igt@kms_hdr@=
invalid-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-bmg-3/igt@kms_hdr@invalid-hdr=
.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-2/igt@kms_plan=
e@plane-position-hole.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-4/igt@kms_p=
lane@plane-position-hole.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-4/igt@kms_pm_b=
acklight@fade-with-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-3/igt@kms_pm=
_backlight@fade-with-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-5/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-c-dp-2.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-bmg-=
4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-2/igt@kms_vrr@=
flip-basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-4/igt@kms_vrr@flip-basic.h=
tml">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-7/igt@xe_evict=
@evict-cm-threads-large.html">TIMEOUT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-bmg-7/igt@xe_e=
vict@evict-cm-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-1/igt@xe_pm@s2=
idle-basic.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-5/igt@xe_pm@s2idle-basic.h=
tml">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-lnl-2/igt@xe_pm@s4=
-mocs.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1794">Intel XE#1794</a>) -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-133879v3/shard-lnl-5/igt@xe_pm@s4-mocs.html">PASS=
</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-268435456:</p>
<ul>
<li>{shard-bmg}:        <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6/shard-bmg-3/igt@xe_vm@la=
rge-userptr-split-binds-268435456.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133879v3/shard-bmg=
-1/igt@xe_vm@large-userptr-split-binds-268435456.html">PASS</a> +5 other te=
sts pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7968 -&gt; IGT_7969</li>
<li>Linux: xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6 -&gt; xe-pw-133=
879v3</li>
</ul>
<p>IGT_7968: 5073187c568304daf01d71f6fed415d759c6e363 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_7969: 4aa543467adf6e61ed57e2c0a84a0534923aacc6 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-1765-95179e2efd2e2f61d5453d323fdb6e136fc15df6: 95179e2efd2e2f61d5453d3=
23fdb6e136fc15df6<br />
  xe-pw-133879v3: 133879v3</p>

</body>
</html>

--===============4327614705952724871==--
