Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F275C606A31E
	for <intel-xe@archiver.kernel.org>; Tue, 24 Nov 2026 22:09:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9F77C10F0D3;
	Tue, 24 Nov 2026 22:09:54 +0000 (UTC)
Received: from 9ac1b63fe3ea (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C35A110ECF9;
 Tue, 24 Nov 2026 22:09:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6632840186797652072=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFULL=3A_failure_for_drm/ttm=3A_Destroy_the_ttm?=
 =?utf-8?q?=5Ftt_in_ttm=5Fbo=5Fmove=5Fnull=28=29_when_it=27s_no_longer_neede?=
 =?utf-8?q?d?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 24 Nov 2026 22:09:53 -0000
Message-ID: <179555819378.80843.2595773065581805165@9ac1b63fe3ea>
X-Patchwork-Hint: ignore
References: <20261124190954.47690-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20261124190954.47690-1-thomas.hellstrom@linux.intel.com>
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
X-Spam-Status: No, score=-1.0 required=3.0 tests=BAYES_00,HTML_MESSAGE,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

--===============6632840186797652072==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm: Destroy the ttm_tt in ttm_bo_move_null() when it's no longer needed
URL   : https://patchwork.freedesktop.org/series/179550/
State : failure

== Summary ==

CI Bug Log - changes from xe-6225-0136c4319eff88f24494b8d1655e247a935dda57_FULL -> xe-pw-179550v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-179550v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-179550v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-179550v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-ptl:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-ptl-8/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-7/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:
    - shard-lnl:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-edp-1:
    - shard-ptl:          [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-ptl-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-edp-1.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-edp-1.html

  
Known issues
------------

  Here are the changes found in xe-pw-179550v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-ptl:          [PASS][7] -> [FAIL][8] ([Intel XE#6078]) +1 other test fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-ptl-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-7/igt@kms_async_flips@alternate-sync-async-flip.html
    - shard-lnl:          [PASS][9] -> [FAIL][10] ([Intel XE#3718] / [Intel XE#7265]) +1 other test fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:
    - shard-lnl:          [PASS][11] -> [FAIL][12] ([Intel XE#7265])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:
    - shard-bmg:          [PASS][13] -> [FAIL][14] ([Intel XE#3718] / [Intel XE#6078])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3:
    - shard-bmg:          [PASS][15] -> [FAIL][16] ([Intel XE#6078]) +2 other tests fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#2327]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-9/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][18] ([Intel XE#5901]) +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#7085])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1124])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#5850])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][22] ([Intel XE#5808]) +8 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +9 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][24] ([Intel XE#7679])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][25] ([Intel XE#7679]) +2 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#8365])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][27] ([Intel XE#367])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-5/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#367]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:
    - shard-ptl:          NOTRUN -> [SKIP][29] ([Intel XE#5822]) +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][30] -> [INCOMPLETE][31] ([Intel XE#7084] / [Intel XE#8150])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][32] ([Intel XE#7084] / [Intel XE#8150])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#3432]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html

  * igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#2887]) +14 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#2252]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_color@degamma:
    - shard-bmg:          NOTRUN -> [SKIP][36] ([Intel XE#2325] / [Intel XE#7358]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@kms_chamelium_color@degamma.html
    - shard-ptl:          NOTRUN -> [SKIP][37] ([Intel XE#5824])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-1/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:
    - shard-ptl:          NOTRUN -> [SKIP][38] ([Intel XE#8391])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html
    - shard-bmg:          NOTRUN -> [SKIP][39] ([Intel XE#7358])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][40] ([Intel XE#2252]) +6 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#373])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3:
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#6969]) +7 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3.html

  * igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3:
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#6969]) +7 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-bmg:          NOTRUN -> [FAIL][44] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#6974])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@legacy@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][46] ([Intel XE#3304]) +1 other test fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@kms_content_protection@legacy@pipe-a-dp-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#5845])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-ptl:          NOTRUN -> [SKIP][48] ([Intel XE#5846])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-64x21:
    - shard-bmg:          NOTRUN -> [SKIP][49] ([Intel XE#2320]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-64x21.html

  * igt@kms_cursor_crc@cursor-rapid-movement-128x42:
    - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#5900]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#5962]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2286] / [Intel XE#6035]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#9533])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dp_link_training@uhbr-mst-direct-train:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#9527])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@kms_dp_link_training@uhbr-mst-direct-train.html
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#9527])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-7/igt@kms_dp_link_training@uhbr-mst-direct-train.html

  * igt@kms_dsc@dsc-fractional-bpp-bigjoiner:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#8265]) +4 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html

  * igt@kms_dsc@dsc-with-bpc-ultrajoiner:
    - shard-ptl:          NOTRUN -> [SKIP][57] ([Intel XE#5907]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-5/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html

  * igt@kms_fbcon_fbt@fbc:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#4156] / [Intel XE#7425])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt@kms_fbcon_fbt@fbc.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:
    - shard-ptl:          NOTRUN -> [SKIP][59] ([Intel XE#2316]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][60] ([Intel XE#7178] / [Intel XE#7351]) +5 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][61] ([Intel XE#7178]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:
    - shard-ptl:          NOTRUN -> [SKIP][62] ([Intel XE#5800] / [Intel XE#6312]) +4 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][63] ([Intel XE#2311]) +43 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#4141]) +10 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][65] ([Intel XE#7061] / [Intel XE#7356]) +5 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][66] ([Intel XE#7061] / [Intel XE#7356]) +5 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#6312]) +9 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#7905]) +2 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#656] / [Intel XE#7905])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#7865]) +2 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt:
    - shard-ptl:          NOTRUN -> [SKIP][71] ([Intel XE#5812]) +44 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#7061]) +4 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#7865]) +16 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2313]) +46 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][75] ([Intel XE#7061]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-1/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#1503])
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-max-non-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][78] ([Intel XE#4298] / [Intel XE#5873])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-ptl:          NOTRUN -> [SKIP][79] ([Intel XE#7591])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:
    - shard-ptl:          NOTRUN -> [SKIP][80] ([Intel XE#7283])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#7283]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html

  * igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][82] ([Intel XE#5844]) +4 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-1/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html

  * igt@kms_plane_lowres@tiling-y:
    - shard-ptl:          NOTRUN -> [SKIP][83] ([Intel XE#5946])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@kms_plane_lowres@tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][84] ([Intel XE#2393])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled:
    - shard-bmg:          [PASS][85] -> [FAIL][86] ([Intel XE#9780]) +4 other tests fail
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled.html

  * igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled:
    - shard-bmg:          NOTRUN -> [SKIP][87] ([Intel XE#9779]) +1 other test skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-ptl:          NOTRUN -> [SKIP][88] ([Intel XE#1131])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][89] -> [FAIL][90] ([Intel XE#8399]) +2 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][91] ([Intel XE#2499])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#4608])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#4608] / [Intel XE#7304])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][96] ([Intel XE#5858] / [Intel XE#7304]) +5 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][97] ([Intel XE#5858]) +2 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:
    - shard-bmg:          NOTRUN -> [SKIP][98] ([Intel XE#1489]) +8 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-ptl:          NOTRUN -> [SKIP][99] ([Intel XE#1406] / [Intel XE#5835]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@pr-no-drrs:
    - shard-ptl:          NOTRUN -> [SKIP][100] ([Intel XE#1406]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@pr-sprite-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#1406])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@kms_psr@pr-sprite-plane-move.html

  * igt@kms_psr@psr-basic:
    - shard-bmg:          NOTRUN -> [SKIP][102] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@kms_psr@psr-basic.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-ptl:          NOTRUN -> [SKIP][103] ([Intel XE#5821])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@sprite-rotation-90:
    - shard-bmg:          NOTRUN -> [SKIP][104] ([Intel XE#3904] / [Intel XE#7342])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html

  * igt@kms_sharpness_filter@invalid-plane-with-filter:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#6503])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@kms_sharpness_filter@invalid-plane-with-filter.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-ptl:          NOTRUN -> [SKIP][106] ([Intel XE#5857])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@kms_tv_load_detect@load-detect.html
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2450] / [Intel XE#5857])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-lnl:          [PASS][108] -> [ABORT][109] ([Intel XE#1727] / [Intel XE#9422])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
    - shard-lnl:          [PASS][110] -> [INCOMPLETE][111] ([Intel XE#1727])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html

  * igt@kms_vrr@max-min:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#1499] / [Intel XE#9271])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@kms_vrr@max-min.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-bmg:          NOTRUN -> [ABORT][113] ([Intel XE#8868])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_compute@eu-busy-10s:
    - shard-ptl:          NOTRUN -> [SKIP][114] ([Intel XE#6599])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@xe_compute@eu-busy-10s.html

  * igt@xe_compute_preempt@compute-preempt-many-vram:
    - shard-ptl:          NOTRUN -> [SKIP][115] ([Intel XE#5191])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@xe_compute_preempt@compute-preempt-many-vram.html

  * igt@xe_err_injection@inject_core_compute_corr_error_threshold_default:
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#9769])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@xe_err_injection@inject_core_compute_corr_error_threshold_default.html

  * igt@xe_evict@evict-cm-threads-small-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][117] ([Intel XE#5764]) +5 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@xe_evict@evict-cm-threads-small-multi-vm.html

  * igt@xe_evict@evict-small-external-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#8370])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@xe_evict@evict-small-external-multi-queue-cm.html

  * igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][119] ([Intel XE#7482]) +11 other tests skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-1/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-lnl:          NOTRUN -> [SKIP][120] ([Intel XE#1392])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:
    - shard-bmg:          NOTRUN -> [SKIP][121] ([Intel XE#2322] / [Intel XE#7372]) +7 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][122] ([Intel XE#5575] / [Intel XE#7484]) +3 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#8374]) +7 other tests skip
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm.html

  * igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][124] ([Intel XE#8374]) +2 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:
    - shard-bmg:          NOTRUN -> [SKIP][125] ([Intel XE#8364]) +24 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#8364]) +3 other tests skip
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-close-fd.html

  * igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][127] ([Intel XE#8364]) +20 other tests skip
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr.html

  * igt@xe_exec_reset@cm-multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][128] ([Intel XE#8369]) +2 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@xe_exec_reset@cm-multi-queue-cat-error.html

  * igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch:
    - shard-ptl:          NOTRUN -> [SKIP][129] ([Intel XE#8369])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch.html
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#8369])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-2/igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch.html

  * igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#8378]) +6 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-cm-userptr:
    - shard-ptl:          NOTRUN -> [SKIP][132] ([Intel XE#8378]) +4 other tests skip
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@xe_exec_threads@threads-multi-queue-cm-userptr.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#6281] / [Intel XE#7426])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html

  * igt@xe_mmap@pci-membarrier:
    - shard-ptl:          NOTRUN -> [SKIP][134] ([Intel XE#5100] / [Intel XE#7408])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@xe_mmap@pci-membarrier.html

  * igt@xe_multigpu_svm@mgpu-coherency-prefetch:
    - shard-ptl:          NOTRUN -> [SKIP][135] ([Intel XE#6964]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html

  * igt@xe_multigpu_svm@mgpu-migration-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#6964]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-migration-prefetch.html

  * igt@xe_page_reclaim@binds-large-split:
    - shard-ptl:          NOTRUN -> [SKIP][137] ([Intel XE#7793]) +1 other test skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@xe_page_reclaim@binds-large-split.html

  * igt@xe_page_reclaim@pat-index-xd:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#7793]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@xe_page_reclaim@pat-index-xd.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-ptl:          NOTRUN -> [SKIP][139] ([Intel XE#7590])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html
    - shard-bmg:          NOTRUN -> [SKIP][140] ([Intel XE#7590])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-bmg:          NOTRUN -> [SKIP][141] ([Intel XE#2236] / [Intel XE#7590])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_pat@pt-caching-single-object:
    - shard-lnl:          [PASS][142] -> [DMESG-WARN][143] ([Intel XE#9513])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-6/igt@xe_pat@pt-caching-single-object.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@xe_pat@pt-caching-single-object.html

  * igt@xe_pm@d3cold-i2c:
    - shard-bmg:          NOTRUN -> [SKIP][144] ([Intel XE#5694] / [Intel XE#7370])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@xe_pm@d3cold-i2c.html

  * igt@xe_pm@s4-basic-exec:
    - shard-ptl:          [PASS][145] -> [ABORT][146] ([Intel XE#9476])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-ptl-5/igt@xe_pm@s4-basic-exec.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][147] -> [ABORT][148] ([Intel XE#9362])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-1/igt@xe_pm@s4-mocs.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-5/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-bmg:          [PASS][149] -> [ABORT][150] ([Intel XE#9399])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-7/igt@xe_pm@s4-vm-bind-unbind-all.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [PASS][151] -> [FAIL][152] ([Intel XE#9254])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-bmg:          NOTRUN -> [SKIP][153] ([Intel XE#7599])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#4733] / [Intel XE#7417])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-9/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_query@multigpu-query-invalid-extension:
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#944]) +2 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@xe_query@multigpu-query-invalid-extension.html

  * igt@xe_sriov_flr@flr-twice:
    - shard-bmg:          [PASS][156] -> [FAIL][157] ([Intel XE#6569])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-10/igt@xe_sriov_flr@flr-twice.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-bmg:          NOTRUN -> [FAIL][158] ([Intel XE#6569])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_sriov_vram@vf-access-after-resize-down:
    - shard-ptl:          NOTRUN -> [SKIP][159] ([Intel XE#6376] / [Intel XE#7422])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@xe_sriov_vram@vf-access-after-resize-down.html

  * igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:
    - shard-ptl:          NOTRUN -> [SKIP][160] ([Intel XE#9597])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][161] ([Intel XE#8963])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html

  * igt@xe_wedged@wedged-mode-toggle:
    - shard-ptl:          [PASS][162] -> [DMESG-WARN][163] ([Intel XE#9825])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-ptl-1/igt@xe_wedged@wedged-mode-toggle.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-7/igt@xe_wedged@wedged-mode-toggle.html
    - shard-lnl:          [PASS][164] -> [DMESG-WARN][165] ([Intel XE#9825])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html
    - shard-bmg:          [PASS][166] -> [ABORT][167] ([Intel XE#9781])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@xe_wedged@wedged-mode-toggle.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:
    - shard-bmg:          [FAIL][168] ([Intel XE#6078]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html

  * igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:
    - shard-bmg:          [SKIP][170] ([Intel XE#367]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html

  * igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-edp1:
    - shard-ptl:          [INCOMPLETE][172] ([Intel XE#9721]) -> [PASS][173] +1 other test pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-ptl-5/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-edp1.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][174] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][175] +1 other test pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb2101010:
    - shard-bmg:          [INCOMPLETE][176] ([Intel XE#9793]) -> [PASS][177] +1 other test pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb2101010.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb2101010.html

  * igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-p010:
    - shard-bmg:          [FAIL][178] ([Intel XE#9780]) -> [PASS][179] +5 other tests pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-p010.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-p010.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [FAIL][180] ([Intel XE#8399]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html

  * igt@xe_pm@s4-basic:
    - shard-ptl:          [ABORT][182] ([Intel XE#9362]) -> [PASS][183] +1 other test pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-ptl-7/igt@xe_pm@s4-basic.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-exec-after:
    - shard-ptl:          [DMESG-WARN][184] ([Intel XE#7727]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-ptl-7/igt@xe_pm@s4-exec-after.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-bmg:          [ABORT][186] ([Intel XE#9362]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-4/igt@xe_pm@s4-vm-bind-prefetch.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm_residency@gt-c6-freeze@gt1:
    - shard-bmg:          [FAIL][188] ([Intel XE#9254]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [FAIL][190] ([Intel XE#6569]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][192] ([Intel XE#3544]) -> [SKIP][193] ([Intel XE#3374] / [Intel XE#3544])
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][194] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][195] ([Intel XE#1729] / [Intel XE#7424])
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          [SKIP][196] ([Intel XE#2426] / [Intel XE#5848]) -> [SKIP][197] ([Intel XE#2509] / [Intel XE#7437])
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2236]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2450]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#3718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4156]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156
  [Intel XE#4298]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#5844]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5844
  [Intel XE#5845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5845
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5850
  [Intel XE#5857]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5946]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035
  [Intel XE#6078]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078
  [Intel XE#6281]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425
  [Intel XE#7426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426
  [Intel XE#7437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8150]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#8963]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399
  [Intel XE#9422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9422
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9476]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9476
  [Intel XE#9513]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9513
  [Intel XE#9527]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527
  [Intel XE#9533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9533
  [Intel XE#9597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597
  [Intel XE#9721]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9721
  [Intel XE#9769]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9769
  [Intel XE#9779]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779
  [Intel XE#9780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780
  [Intel XE#9781]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9781
  [Intel XE#9793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9793
  [Intel XE#9825]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9825


Build changes
-------------

  * IGT: IGT_9202 -> IGT_9203
  * Linux: xe-6225-0136c4319eff88f24494b8d1655e247a935dda57 -> xe-pw-179550v1

  IGT_9202: 9202
  IGT_9203: 9203
  xe-6225-0136c4319eff88f24494b8d1655e247a935dda57: 0136c4319eff88f24494b8d1655e247a935dda57
  xe-pw-179550v1: 179550v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/index.html

--===============6632840186797652072==
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
<tr><td><b>Series:</b></td><td>drm/ttm: Destroy the ttm_tt in ttm_bo_move_null() when it&#x27;s no longer needed</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/179550/">https://patchwork.freedesktop.org/series/179550/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6225-0136c4319eff88f24494b8d1655e247a935dda57_FULL -&gt; xe-pw-179550v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-179550v1_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-179550v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-179550v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-ptl-8/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-7/igt@kms_vblank@ts-continuation-dpms-suspend.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-edp-1.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-edp-1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-ptl-8/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-d-edp-1.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-179550v1_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-ptl-5/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-7/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +1 other test fail</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-5/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7265">Intel XE#7265</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3718">Intel XE#3718</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-d-hdmi-a-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-9/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@kms_big_fb@linear-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5850">Intel XE#5850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-7/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@kms_bw@connected-linear-tiling-3-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-6/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-5/igt@kms_bw@linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@kms_ccs@bad-rotation-90-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-7/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-c-dp-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Intel XE#7084</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8150">Intel XE#8150</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@kms_ccs@missing-ccs-buffer-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@kms_chamelium_audio@dp-audio-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-1/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824">Intel XE#5824</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt709.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-3/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@kms_color_pipeline@plane-ctm3x4@pipe-a-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@kms_color_pipeline@plane-ctm3x4@pipe-c-plane-3.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@kms_content_protection@atomic-hdcp14.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@kms_content_protection@legacy@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5845">Intel XE#5845</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846">Intel XE#5846</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x21:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@kms_cursor_crc@cursor-onscreen-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-128x42:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@kms_cursor_crc@cursor-rapid-movement-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-1/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2286">Intel XE#2286</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6035">Intel XE#6035</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@kms_dp_link_training@uhbr-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9533">Intel XE#9533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst-direct-train:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527">Intel XE#9527</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-7/igt@kms_dp_link_training@uhbr-mst-direct-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9527">Intel XE#9527</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-fractional-bpp-bigjoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@kms_dsc@dsc-fractional-bpp-bigjoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-5/igt@kms_dsc@dsc-with-bpc-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907">Intel XE#5907</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt@kms_fbcon_fbt@fbc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4156">Intel XE#4156</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7425">Intel XE#7425</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-5/igt@kms_frontbuffer_tracking@fbc-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-offscreen-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@kms_frontbuffer_tracking@fbchdr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-rte:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +44 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbcpsrhdr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt@kms_frontbuffer_tracking@psrhdr-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +46 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-1/igt@kms_frontbuffer_tracking@psrhdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-max-non-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@kms_joiner@basic-max-non-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4298">Intel XE#4298</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5873">Intel XE#5873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@kms_plane@pixel-format-4-tiled-mtl-rc-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@kms_plane@pixel-format-yf-tiled-ccs-modifier-source-clamping.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-1/igt@kms_plane_lowres@tiling-none@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5844">Intel XE#5844</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5946">Intel XE#5946</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@kms_plane_lowres@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2393">Intel XE#2393</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-6/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-180-x-tiled.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780">Intel XE#9780</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@kms_plane_scaling@plane-upscale-max-crc-rotation-90-y-tiled.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9779">Intel XE#9779</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131">Intel XE#1131</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-5/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress-no-wait:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-fully-sf@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@kms_psr2_sf@psr2-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@kms_psr@fbc-psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@kms_psr@pr-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@kms_psr@psr-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@kms_rotation_crc@sprite-rotation-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_sharpness_filter@invalid-plane-with-filter:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@kms_sharpness_filter@invalid-plane-with-filter.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6503">Intel XE#6503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2450">Intel XE#2450</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5857">Intel XE#5857</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9422">Intel XE#9422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-2/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@max-min:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@kms_vrr@max-min.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9271">Intel XE#9271</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@sriov_basic@pf-unbind-with-vf-probed.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@eu-busy-10s:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@xe_compute@eu-busy-10s.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6599">Intel XE#6599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt-many-vram:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@xe_compute_preempt@compute-preempt-many-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5191">Intel XE#5191</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_err_injection@inject_core_compute_corr_error_threshold_default:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@xe_err_injection@inject_core_compute_corr_error_threshold_default.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9769">Intel XE#9769</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@xe_evict@evict-cm-threads-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@xe_evict@evict-small-external-multi-queue-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-1/igt@xe_exec_balancer@no-exec-cm-parallel-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@xe_exec_fault_mode@many-execqueues-multi-queue-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@xe_exec_fault_mode@twice-multi-queue-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@xe_exec_multi_queue@max-queues-preempt-mode-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-7/igt@xe_exec_multi_queue@one-queue-preempt-mode-fault-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@xe_exec_multi_queue@one-queue-preempt-mode-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@xe_exec_reset@cm-multi-queue-cat-error.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-2/igt@xe_exec_reset@multi-queue-long-spin-many-queue-switch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@xe_exec_threads@threads-multi-queue-cm-shared-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-userptr:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@xe_exec_threads@threads-multi-queue-cm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_pxp_exec_queue_add.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6281">Intel XE#6281</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7426">Intel XE#7426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@xe_mmap@pci-membarrier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100">Intel XE#5100</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-coherency-prefetch:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@xe_multigpu_svm@mgpu-coherency-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-migration-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@xe_multigpu_svm@mgpu-migration-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-large-split:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@xe_page_reclaim@binds-large-split.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@pat-index-xd:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@xe_page_reclaim@pat-index-xd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793">Intel XE#7793</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-4/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2236">Intel XE#2236</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pt-caching-single-object:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-6/igt@xe_pat@pt-caching-single-object.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-1/igt@xe_pat@pt-caching-single-object.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9513">Intel XE#9513</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-i2c:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@xe_pm@d3cold-i2c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5694">Intel XE#5694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-ptl-5/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-2/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9476">Intel XE#9476</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-1/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-5/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-7/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9399">Intel XE#9399</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@xe_prefetch_fault@prefetch-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-9/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7417">Intel XE#7417</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-extension:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@xe_query@multigpu-query-invalid-extension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-twice:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-10/igt@xe_sriov_flr@flr-twice.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@xe_sriov_flr@flr-twice.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@xe_sriov_flr@flr-vf1-clear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-down:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@xe_sriov_vram@vf-access-after-resize-down.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376">Intel XE#6376</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597">Intel XE#9597</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-4/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8963">Intel XE#8963</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-mode-toggle:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-ptl-1/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-7/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9825">Intel XE#9825</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-3/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-2/igt@xe_wedged@wedged-mode-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9825">Intel XE#9825</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-5/igt@xe_wedged@wedged-mode-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@xe_wedged@wedged-mode-toggle.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9781">Intel XE#9781</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6078">Intel XE#6078</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-8/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-2560x1440p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-edp1:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-ptl-5/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-edp1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9721">Intel XE#9721</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-8/igt@kms_flip@blocking-absolute-wf_vblank-interruptible@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb2101010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-3/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb2101010.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9793">Intel XE#9793</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-max-crc-rotation-180-x-tiled@pipe-b-dp-2-xrgb2101010.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-p010:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-p010.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9780">Intel XE#9780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-max-crc-x-tiled@pipe-a-dp-2-p010.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-lnl-8/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-ptl-7/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-6/igt@xe_pm@s4-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-ptl-7/igt@xe_pm@s4-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-ptl-3/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-4/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-6/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt1:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-2/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569">Intel XE#6569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-9/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-9/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-10/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6225-0136c4319eff88f24494b8d1655e247a935dda57/shard-bmg-9/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-179550v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7437">Intel XE#7437</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9202 -&gt; IGT_9203</li>
<li>Linux: xe-6225-0136c4319eff88f24494b8d1655e247a935dda57 -&gt; xe-pw-179550v1</li>
</ul>
<p>IGT_9202: 9202<br />
  IGT_9203: 9203<br />
  xe-6225-0136c4319eff88f24494b8d1655e247a935dda57: 0136c4319eff88f24494b8d1655e247a935dda57<br />
  xe-pw-179550v1: 179550v1</p>

</body>
</html>

--===============6632840186797652072==--
