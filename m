Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B0CF606A31A
	for <intel-xe@archiver.kernel.org>; Thu, 29 Oct 2026 23:50:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4A61310E661;
	Thu, 29 Oct 2026 23:50:18 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 72FD510E4EA;
 Thu, 29 Oct 2026 23:50:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7226322102551491431=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/i915/ptl+=3A_Fix_eDP_s?=
 =?utf-8?q?upport_on_TypeC_PHYs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Oct 2026 23:50:17 -0000
Message-ID: <179331781745.91114.9833481667901027265@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029113017.618286-1-imre.deak@intel.com>
In-Reply-To: <20261029113017.618286-1-imre.deak@intel.com>
X-BeenThere: intel-xe@lists.freedesktop.org
X-Mailman-Version: 2.1.29
Precedence: list
List-Id: Intel Xe graphics driver <intel-xe.lists.freedesktop.org>
List-Archive: <https://lists.freedesktop.org/archives/intel-xe>
List-Post: <mailto:intel-xe@lists.freedesktop.org>
List-Help: <mailto:intel-xe-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/intel-xe>,
 <mailto:intel-xe-request@lists.freedesktop.org?subject=subscribe>
Reply-To: intel-xe@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Status: No, score=0.1 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,MPART_ALT_DIFF_COUNT,SPF_HELO_NONE,SPF_PASS
	autolearn=no autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============7226322102551491431==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/ptl+: Fix eDP support on TypeC PHYs
URL   : https://patchwork.freedesktop.org/series/177147/
State : failure

== Summary ==

CI Bug Log - changes from xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a_FULL -> xe-pw-177147v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-177147v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-177147v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-177147v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@runner@aborted:
    - shard-bmg:          NOTRUN -> ([FAIL][1], [FAIL][2], [FAIL][3], [FAIL][4], [FAIL][5], [FAIL][6], [FAIL][7], [FAIL][8], [FAIL][9], [FAIL][10], [FAIL][11], [FAIL][12], [FAIL][13], [FAIL][14], [FAIL][15], [FAIL][16], [FAIL][17], [FAIL][18], [FAIL][19], [FAIL][20], [FAIL][21], [FAIL][22], [FAIL][23], [FAIL][24], [FAIL][25])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-5/igt@runner@aborted.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-4/igt@runner@aborted.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-4/igt@runner@aborted.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-4/igt@runner@aborted.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-8/igt@runner@aborted.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-8/igt@runner@aborted.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-10/igt@runner@aborted.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-10/igt@runner@aborted.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-10/igt@runner@aborted.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-1/igt@runner@aborted.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-1/igt@runner@aborted.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-1/igt@runner@aborted.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-7/igt@runner@aborted.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-7/igt@runner@aborted.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-7/igt@runner@aborted.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-9/igt@runner@aborted.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-9/igt@runner@aborted.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-9/igt@runner@aborted.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-2/igt@runner@aborted.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-2/igt@runner@aborted.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-6/igt@runner@aborted.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-6/igt@runner@aborted.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-3/igt@runner@aborted.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-3/igt@runner@aborted.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-5/igt@runner@aborted.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][26], [PASS][27], [PASS][28], [PASS][29], [PASS][30], [PASS][31], [PASS][32], [PASS][33], [PASS][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50]) -> ([ABORT][51], [ABORT][52], [ABORT][53], [ABORT][54], [ABORT][55], [ABORT][56], [ABORT][57], [ABORT][58], [ABORT][59], [ABORT][60], [DMESG-WARN][61], [DMESG-WARN][62], [DMESG-WARN][63], [ABORT][64], [ABORT][65], [ABORT][66], [ABORT][67], [ABORT][68], [ABORT][69], [ABORT][70], [ABORT][71], [ABORT][72], [ABORT][73], [ABORT][74], [ABORT][75])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-4/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-8/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-1/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-6/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-8/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-7/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-7/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-4/igt@xe_module_load@load.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-1/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-3/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-3/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-3/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-4/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-2/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-2/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-2/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-6/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-5/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-5/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-5/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-1/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-10/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-9/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-9/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-10/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-4/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-3/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-3/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-4/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-4/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-6/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-6/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-5/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-8/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-8/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-7/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-7/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-7/igt@xe_module_load@load.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-1/igt@xe_module_load@load.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-1/igt@xe_module_load@load.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-1/igt@xe_module_load@load.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-10/igt@xe_module_load@load.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-10/igt@xe_module_load@load.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-10/igt@xe_module_load@load.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-9/igt@xe_module_load@load.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-9/igt@xe_module_load@load.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-9/igt@xe_module_load@load.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-5/igt@xe_module_load@load.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-2/igt@xe_module_load@load.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-2/igt@xe_module_load@load.html

  
Known issues
------------

  Here are the changes found in xe-pw-177147v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#3279])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][77] ([Intel XE#5901])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][78] ([Intel XE#7085])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#5851])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1477] / [Intel XE#7361])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1124]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-ptl:          NOTRUN -> [SKIP][82] ([Intel XE#5808])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#2887]) +2 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][84] ([Intel XE#5822])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][85] ([Intel XE#3432])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-ptl:          NOTRUN -> [SKIP][86] ([Intel XE#2252]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#373])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#6969]) +5 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-8/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4:
    - shard-ptl:          NOTRUN -> [SKIP][89] ([Intel XE#6969]) +7 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-3/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-ptl:          NOTRUN -> [SKIP][90] ([Intel XE#6974])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@legacy-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#7642])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_content_protection@legacy-hdcp14.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1424])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-ptl:          NOTRUN -> [SKIP][93] ([Intel XE#5900]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#5962])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-3/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#309] / [Intel XE#7343])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#702] / [Intel XE#7344])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-ptl:          NOTRUN -> [SKIP][97] ([Intel XE#2316])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [PASS][98] -> [FAIL][99] ([Intel XE#301]) +1 other test fail
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-5/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-ptl:          NOTRUN -> [SKIP][100] ([Intel XE#7178])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#7178] / [Intel XE#7349])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#7178] / [Intel XE#7351])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-ptl:          NOTRUN -> [SKIP][105] ([Intel XE#5800] / [Intel XE#6312])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#6312] / [Intel XE#651]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrshdr-slowdraw:
    - shard-ptl:          NOTRUN -> [SKIP][107] ([Intel XE#6312])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@kms_frontbuffer_tracking@drrshdr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][108] ([Intel XE#5812]) +7 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-3/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#656] / [Intel XE#7905]) +7 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-pgflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#6312])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][111] ([Intel XE#7865])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#7865]) +4 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#7905]) +4 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-8/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#7061])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping:
    - shard-lnl:          NOTRUN -> [SKIP][115] ([Intel XE#7283])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
    - shard-ptl:          NOTRUN -> [SKIP][116] ([Intel XE#6886]) +4 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-3/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html
    - shard-lnl:          NOTRUN -> [SKIP][117] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-8/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1131])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#2893] / [Intel XE#7304])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-psr2-sprite-render:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1406] / [Intel XE#7345])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render.html

  * igt@kms_psr@fbc-psr2-sprite-render@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][121] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-render@edp-1.html

  * igt@kms_psr@pr-no-drrs:
    - shard-ptl:          NOTRUN -> [SKIP][122] ([Intel XE#1406])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@kms_psr@pr-no-drrs.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-ptl:          NOTRUN -> [SKIP][123] ([Intel XE#5821])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#3904] / [Intel XE#7342]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_vrr@flip-dpms@pipe-a-edp-1:
    - shard-ptl:          [PASS][125] -> [FAIL][126] ([Intel XE#4227] / [Intel XE#7397]) +3 other tests fail
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-ptl-4/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-4/igt@kms_vrr@flip-dpms@pipe-a-edp-1.html

  * igt@xe_ccs@vm-bind-fault-mode-decompress:
    - shard-ptl:          NOTRUN -> [SKIP][127] ([Intel XE#7644])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@xe_ccs@vm-bind-fault-mode-decompress.html

  * igt@xe_evict@evict-large-external:
    - shard-ptl:          NOTRUN -> [SKIP][128] ([Intel XE#5764]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-3/igt@xe_evict@evict-large-external.html
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#6540] / [Intel XE#688]) +3 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-8/igt@xe_evict@evict-large-external.html

  * igt@xe_exec_balancer@many-virtual-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#7482]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@xe_exec_balancer@many-virtual-userptr-invalidate.html

  * igt@xe_exec_balancer@no-exec-parallel-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][131] ([Intel XE#7482])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@xe_exec_balancer@no-exec-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][132] ([Intel XE#1392]) +2 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-ptl:          NOTRUN -> [SKIP][133] ([Intel XE#5575] / [Intel XE#7484]) +1 other test skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#8374])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem:
    - shard-ptl:          NOTRUN -> [SKIP][135] ([Intel XE#8364]) +3 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-close-fd-smem:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#8364]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-close-fd-smem.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:
    - shard-ptl:          NOTRUN -> [SKIP][137] ([Intel XE#6196])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-3/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#6196])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][139] ([Intel XE#8378]) +2 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][140] ([Intel XE#8378]) +1 other test skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-3/igt@xe_exec_threads@threads-multi-queue-userptr-rebind.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-lnl:          NOTRUN -> [SKIP][141] ([Intel XE#584] / [Intel XE#7369])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - shard-ptl:          NOTRUN -> [SKIP][142] ([Intel XE#6964])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-3/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#6964])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-8/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@xe_pm@d3cold-basic.html
    - shard-ptl:          NOTRUN -> [SKIP][145] ([Intel XE#5741])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][146] -> [ABORT][147] ([Intel XE#9362])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-hwconfig:
    - shard-lnl:          NOTRUN -> [SKIP][148] ([Intel XE#944])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@xe_query@multigpu-query-hwconfig.html

  * igt@xe_sriov_vfio@bind-unbind-vfs:
    - shard-lnl:          NOTRUN -> [SKIP][149] ([Intel XE#7724])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@xe_sriov_vfio@bind-unbind-vfs.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-defer:
    - shard-ptl:          NOTRUN -> [SKIP][150] ([Intel XE#9597])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html

  
#### Possible fixes ####

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][151] ([Intel XE#301]) -> [PASS][152]
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][153] ([Intel XE#8399]) -> [PASS][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-ptl:          [FAIL][155] ([Intel XE#4227] / [Intel XE#7397]) -> [PASS][156] +1 other test pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-ptl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_pm@s4-basic:
    - shard-ptl:          [ABORT][157] ([Intel XE#9362]) -> [PASS][158] +2 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-ptl-2/igt@xe_pm@s4-basic.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@xe_pm@s4-basic.html
    - shard-lnl:          [ABORT][159] ([Intel XE#9362]) -> [PASS][160] +2 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-4/igt@xe_pm@s4-basic.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@xe_pm@s4-basic.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4227]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4227
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5851]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7344]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7344
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7397
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7724
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597


Build changes
-------------

  * Linux: xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a -> xe-pw-177147v1

  IGT_9170: 9170
  xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a: da8074467a69dce9a0dd59602875f5c54874c92a
  xe-pw-177147v1: 177147v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/index.html

--===============7226322102551491431==
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
<tr><td><b>Series:</b></td><td>drm/i915/ptl+: Fix eDP support on TypeC PHYs=
</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/177147/">https://patchwork.freedesktop.org/series/177147/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-177147v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-177147v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6030-da8074467a69dce9a0dd59602875f5c54=
874c92a_FULL -&gt; xe-pw-177147v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-177147v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-177147v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1771=
47v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@runner@aborted:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; (<a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-177147v1/shard-bmg-5/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shar=
d-bmg-4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-4/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1=
/shard-bmg-4/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-8/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177=
147v1/shard-bmg-8/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-10/igt@runner@abort=
ed.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-177147v1/shard-bmg-10/igt@runner@aborted.html">FAIL</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-10/igt@runne=
r@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-177147v1/shard-bmg-1/igt@runner@aborted.html">FAIL</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-1/ig=
t@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-177147v1/shard-bmg-1/igt@runner@aborted.html">FAIL</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg=
-7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-177147v1/shard-bmg-7/igt@runner@aborted.html">FAIL</a=
>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shar=
d-bmg-7/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-9/igt@runner@aborted.html">FA=
IL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1=
/shard-bmg-9/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-9/igt@runner@aborted.htm=
l">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177=
147v1/shard-bmg-2/igt@runner@aborted.html">FAIL</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-2/igt@runner@aborte=
d.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-177147v1/shard-bmg-6/igt@runner@aborted.html">FAIL</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-6/igt@runner@a=
borted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-177147v1/shard-bmg-3/igt@runner@aborted.html">FAIL</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-3/igt@run=
ner@aborted.html">FAIL</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-177147v1/shard-bmg-5/igt@runner@aborted.html">FAIL</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-4/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-8/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-b=
mg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/sha=
rd-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a=
/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874=
c92a/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c5=
4874c92a/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875=
f5c54874c92a/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd5960=
2875f5c54874c92a/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd=
59602875f5c54874c92a/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9=
a0dd59602875f5c54874c92a/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69=
dce9a0dd59602875f5c54874c92a/shard-bmg-2/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da807446=
7a69dce9a0dd59602875f5c54874c92a/shard-bmg-2/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da80=
74467a69dce9a0dd59602875f5c54874c92a/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-=
da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-6/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-6=
030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-5/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-5/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-10/i=
gt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg=
-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard=
-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/s=
hard-bmg-10/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-4/igt@xe_modu=
le_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-177147v1/shard-bmg-3/igt@xe_module_load@load.html">ABORT</a>,=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-=
bmg-3/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-4/igt@xe_module_load@load=
.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-177147v1/shard-bmg-4/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-6/igt@xe=
_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-177147v1/shard-bmg-6/igt@xe_module_load@load.html">ABORT=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/s=
hard-bmg-5/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-8/igt@xe_module_load=
@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-177147v1/shard-bmg-8/igt@xe_module_load@load.html">ABORT</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-7/i=
gt@xe_module_load@load.html">DMESG-WARN</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-7/igt@xe_module_load@load.h=
tml">DMESG-WARN</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-177147v1/shard-bmg-7/igt@xe_module_load@load.html">DMESG-WARN</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-=
1/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-1/igt@xe_module_load@load.htm=
l">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-17=
7147v1/shard-bmg-1/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-10/igt@xe_mo=
dule_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-177147v1/shard-bmg-10/igt@xe_module_load@load.html">ABORT</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/sha=
rd-bmg-10/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-9/igt@xe_module_load@=
load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-pw-177147v1/shard-bmg-9/igt@xe_module_load@load.html">ABORT</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-9/ig=
t@xe_module_load@load.html">ABORT</a>, <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-177147v1/shard-bmg-5/igt@xe_module_load@load.html">A=
BORT</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147=
v1/shard-bmg-2/igt@xe_module_load@load.html">ABORT</a>, <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-bmg-2/igt@xe_module_=
load@load.html">ABORT</a>)</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177147v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@kms_big_fb@4-tiled-max-hw-str=
ide-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@kms_big_fb@linear-max-hw-stri=
de-64bpp-rotate-0-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5851">Intel XE#5851</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb-size=
-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1477">Intel XE#1477</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip=
</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_ccs@bad-aux-stride-y-tile=
d-gen12-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5822">Intel XE#5822</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4=
-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-8/igt@kms_color_pipeline@plane-lut1=
d-post-ctm3x4@pipe-a-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +5 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-3/igt@kms_color_pipeline@plane-lut1=
d-post-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@kms_content_protection@dp-mst=
-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_content_protection@legacy=
-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_cursor_crc@cursor-offscre=
en-32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@kms_cursor_crc@cursor-random-=
max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5900">Intel XE#5900</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-3/igt@kms_cursor_legacy@cursorb-vs-=
flipa-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/5962">Intel XE#5962</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-=
flipa-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_feature_discovery@display=
-2x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/702">Intel XE#702</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7344">Intel XE#7344</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@kms_flip@2x-modeset-vs-vblank=
-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-5/igt@kms_flip=
@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-5/igt@kms_fli=
p@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other =
test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscalin=
g:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7=
349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">In=
tel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-64bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
85">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9144">Intel XE#9144</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>=
)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) =
+2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-slowdraw:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@kms_frontbuffer_tracking@drrs=
hdr-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-3/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +7 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbc-=
2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +7 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-w=
c:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@kms_frontbuffer_tracking@fbcp=
srhdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-blt:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcp=
srhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +4 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-8/igt@kms_frontbuffer_tracking@hdr-=
2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_frontbuffer_tracking@hdr-=
argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-mc-ccs-modifier-source-clamping=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_plane@pixel-format-y-tile=
d-gen12-mc-ccs-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-3/igt@kms_plane_scaling@planes-down=
scale-factor-0-5-upscale-20x20@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other=
 tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-8/igt@kms_plane_scaling@planes-down=
scale-factor-0-5-upscale-20x20@pipe-b.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886=
</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_pm_dc@dc5-dpms-negative.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_psr2_sf@pr-overlay-primar=
y-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@kms_psr@fbc-psr2-sprite-rende=
r@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@kms_psr@pr-no-drrs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@kms_rotation_crc@primary-4-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/5821">Intel XE#5821</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_rotation_crc@primary-4-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>) +1 other test sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-ptl-4/igt@kms_vrr@=
flip-dpms@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-4/igt@kms_vrr@flip-dpms@pipe=
-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4227">Intel XE#4227</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-fault-mode-decompress:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@xe_ccs@vm-bind-fault-mode-dec=
ompress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-3/igt@xe_evict@evict-large-external=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/5764">Intel XE#5764</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-8/igt@xe_evict@evict-large-external=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6540">Intel XE#6540</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-virtual-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@xe_exec_balancer@many-virtual=
-userptr-invalidate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@xe_exec_balancer@no-exec-para=
llel-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@xe_exec_basic@multigpu-no-exe=
c-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5575">Intel XE#5575</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@xe_exec_fault_mode@many-multi=
-queue-rebind-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@xe_exec_multi_queue@many-exec=
s-preempt-mode-fault-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-close-fd-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@xe_exec_multi_queue@one-queue=
-preempt-mode-fault-close-fd-smem.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-3/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-wt-single-vma.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-8/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-wt-single-vma.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@xe_exec_threads@threads-multi=
-queue-cm-fd-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-3/igt@xe_exec_threads@threads-multi=
-queue-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@xe_gt_freq@freq_suspend.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
84">Intel XE#584</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-3/igt@xe_multigpu_svm@mgpu-xgpu-acc=
ess-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6964">Intel XE#6964</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-8/igt@xe_multigpu_svm@mgpu-xgpu-acc=
ess-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@xe_pm@d3cold-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">=
Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/366">Intel XE#366</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7370">Intel XE#7370</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@xe_pm@d3cold-basic.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741">=
Intel XE#5741</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-7/igt@xe_pm@s4=
-vm-bind-unbind-all.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-a=
ll.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-hwconfig:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@xe_query@multigpu-query-hwcon=
fig.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vfio@bind-unbind-vfs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-lnl-4/igt@xe_sriov_vfio@bind-unbind-vfs=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7724">Intel XE#7724</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-defer:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-177147v1/shard-ptl-2/igt@xe_vm@overcommit-nonfault-vra=
m-lr-defer.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/9597">Intel XE#9597</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-4/igt@kms_flip=
@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@km=
s_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-4/igt@kms_pm_d=
c@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.h=
tml">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-ptl-3/igt@kms_vrr@=
flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4227">Intel XE#4227</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/7397">Intel XE#7397</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177147v1/shard-p=
tl-5/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pas=
s</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-ptl-2/igt@xe_pm@s4=
-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-177147v1/shard-ptl-6/igt@xe_pm@s4-basic.html">PA=
SS</a> +2 other tests pass</li>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-4/igt@xe_pm@s4=
-basic.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-177147v1/shard-lnl-2/igt@xe_pm@s4-basic.html">PA=
SS</a> +2 other tests pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a -&gt; xe-pw-177=
147v1</li>
</ul>
<p>IGT_9170: 9170<br />
  xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a: da8074467a69dce9a0dd596=
02875f5c54874c92a<br />
  xe-pw-177147v1: 177147v1</p>

</body>
</html>

--===============7226322102551491431==--
