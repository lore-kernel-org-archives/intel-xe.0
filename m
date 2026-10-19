Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4146606A31B
	for <intel-xe@archiver.kernel.org>; Mon, 19 Oct 2026 18:15:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A6FEB10EA82;
	Mon, 19 Oct 2026 18:15:32 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3E20B10E1A4;
 Mon, 19 Oct 2026 18:15:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8340510479047427232=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/dp=3A_don=27t_tou?=
 =?utf-8?q?ch_the_AUX_engine_while_it=27s_still_busy_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Oct 2026 18:15:31 -0000
Message-ID: <179243373123.42683.5397892606608581957@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261019150226.734375-1-luciano.coelho@intel.com>
In-Reply-To: <20261019150226.734375-1-luciano.coelho@intel.com>
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

--===============8340510479047427232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: don't touch the AUX engine while it's still busy (rev2)
URL   : https://patchwork.freedesktop.org/series/175554/
State : success

== Summary ==

CI Bug Log - changes from xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767_FULL -> xe-pw-175554v2_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-175554v2_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-bmg:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-5/igt@core_hotunplug@hotunplug-rescan.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-9/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#5947])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2327])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-ptl:          NOTRUN -> [SKIP][5] ([Intel XE#5901]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][6] ([Intel XE#7085])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][7] ([Intel XE#1407]) +3 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-2/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-ptl:          NOTRUN -> [SKIP][8] ([Intel XE#5808]) +13 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#1124]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#607] / [Intel XE#7361])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
    - shard-ptl:          NOTRUN -> [SKIP][12] ([Intel XE#5851])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:
    - shard-ptl:          NOTRUN -> [SKIP][13] ([Intel XE#7679]) +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][14] ([Intel XE#7679])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#7679])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-8/igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#367]) +2 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@kms_bw@linear-tiling-3-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][17] ([Intel XE#367])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_bw@linear-tiling-4-displays-target-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#2887]) +5 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-2/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][19] ([Intel XE#5823] / [Intel XE#6918]) +9 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:
    - shard-bmg:          [PASS][20] -> [ABORT][21] ([Intel XE#9406] / [Intel XE#9422])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][22] ([Intel XE#3432])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:
    - shard-ptl:          [PASS][23] -> [ABORT][24] ([Intel XE#7084] / [Intel XE#9378]) +1 other test abort
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#3432])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#5822]) +15 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][27] ([Intel XE#2887]) +2 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_chamelium_audio@dp-audio-after-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][28] ([Intel XE#2252]) +1 other test skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-5/igt@kms_chamelium_audio@dp-audio-after-suspend.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#373]) +4 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-1/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-ptl:          NOTRUN -> [SKIP][30] ([Intel XE#5824]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2325] / [Intel XE#7358])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-4/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:
    - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#8391]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020.html

  * igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#7358]) +1 other test skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-3/igt@kms_chamelium_color_pipeline@plane-lut3d-green-only.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-ptl:          NOTRUN -> [SKIP][34] ([Intel XE#2252]) +10 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_sharpness_filter@filter-basic:
    - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#6507])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@kms_chamelium_sharpness_filter@filter-basic.html

  * igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:
    - shard-ptl:          NOTRUN -> [SKIP][36] ([Intel XE#6969]) +7 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3.html

  * igt@kms_content_protection@atomic-hdcp14:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7642])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@kms_content_protection@atomic-hdcp14.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-ptl:          NOTRUN -> [SKIP][38] ([Intel XE#6974])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@legacy@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][39] ([Intel XE#3304])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-7/igt@kms_content_protection@legacy@pipe-a-dp-1.html

  * igt@kms_content_protection@lic-type-0:
    - shard-ptl:          NOTRUN -> [SKIP][40] ([Intel XE#7642]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][41] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +2 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-6/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#5846]) +2 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-ptl:          NOTRUN -> [SKIP][43] ([Intel XE#5900]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-bmg:          NOTRUN -> [SKIP][44] ([Intel XE#2320]) +1 other test skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [PASS][45] -> [DMESG-WARN][46] ([Intel XE#9365]) +4 other tests dmesg-warn
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-3/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-ptl:          NOTRUN -> [SKIP][47] ([Intel XE#5962]) +2 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#309] / [Intel XE#7343])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:
    - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#5962] / [Intel XE#7343])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size.html

  * igt@kms_dp_link_training@uhbr-mst:
    - shard-ptl:          NOTRUN -> [SKIP][50] ([Intel XE#9533])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@kms_dp_link_training@uhbr-mst.html

  * igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:
    - shard-ptl:          NOTRUN -> [SKIP][51] ([Intel XE#5907]) +5 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner.html

  * igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#8265]) +2 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-4/igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner.html

  * igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#4422] / [Intel XE#7442])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats.html

  * igt@kms_feature_discovery@chamelium:
    - shard-ptl:          NOTRUN -> [SKIP][54] ([Intel XE#7359])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-blocking-absolute-wf_vblank:
    - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#2316]) +8 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@kms_flip@2x-blocking-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1421]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][57] ([Intel XE#1397] / [Intel XE#1745] / [Intel XE#7385] / [Intel XE#9144]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#7178]) +6 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:
    - shard-ptl:          NOTRUN -> [SKIP][59] ([Intel XE#5828]) +5 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-7/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1397] / [Intel XE#7385] / [Intel XE#9144]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#6312] / [Intel XE#651]) +4 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#6312]) +3 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#7061])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-5/igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#4141]) +2 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][65] ([Intel XE#6312]) +22 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#656] / [Intel XE#7905]) +11 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][67] ([Intel XE#7061] / [Intel XE#7356]) +4 other tests skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#5800] / [Intel XE#6312]) +12 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][69] ([Intel XE#2311]) +12 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render:
    - shard-ptl:          NOTRUN -> [SKIP][70] ([Intel XE#5812]) +80 other tests skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#7905]) +13 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#7061]) +1 other test skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][73] ([Intel XE#7061]) +5 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2313]) +21 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:
    - shard-ptl:          NOTRUN -> [SKIP][75] ([Intel XE#7865]) +26 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#7061] / [Intel XE#7356]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render.html

  * igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#7865]) +8 other tests skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-7/igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt.html

  * igt@kms_hdmi_audio_bw@audio-bw-hblank80:
    - shard-ptl:          NOTRUN -> [SKIP][78] ([Intel XE#9312])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-7/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html
    - shard-bmg:          NOTRUN -> [FAIL][79] ([Intel XE#9313])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-5/igt@kms_hdmi_audio_bw@audio-bw-hblank80.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-ptl:          [PASS][80] -> [SKIP][81] ([Intel XE#7308])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-3/igt@kms_hdmi_inject@inject-audio.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-7/igt@kms_hdmi_inject@inject-audio.html
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1470] / [Intel XE#2853])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-7/igt@kms_hdmi_inject@inject-audio.html
    - shard-bmg:          [PASS][83] -> [SKIP][84] ([Intel XE#7308])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-1/igt@kms_hdmi_inject@inject-audio.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-5/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@invalid-metadata-sizes:
    - shard-ptl:          NOTRUN -> [SKIP][85] ([Intel XE#5917] / [Intel XE#6174])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@kms_hdr@invalid-metadata-sizes.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#6901])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-1/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-ptl:          NOTRUN -> [SKIP][87] ([Intel XE#6900])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_pipe_stress@stress-xrgb8888-xtiled:
    - shard-ptl:          NOTRUN -> [SKIP][88] ([Intel XE#6912]) +1 other test skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@kms_pipe_stress@stress-xrgb8888-xtiled.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#4329] / [Intel XE#6912] / [Intel XE#7375])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#8303]) +1 other test skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-3/igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5.html

  * igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#7283])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-2/igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier.html

  * igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:
    - shard-ptl:          NOTRUN -> [SKIP][92] ([Intel XE#7283]) +5 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][93] ([Intel XE#7283]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane_scaling@intel-max-src-size:
    - shard-ptl:          NOTRUN -> [SKIP][94] ([Intel XE#5959])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@kms_plane_scaling@intel-max-src-size.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#2763] / [Intel XE#6886]) +7 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-7/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:
    - shard-ptl:          NOTRUN -> [SKIP][96] ([Intel XE#6886]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b.html

  * igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][97] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html
    - shard-ptl:          NOTRUN -> [SKIP][98] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#8396]) +1 other test skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html
    - shard-ptl:          NOTRUN -> [SKIP][100] ([Intel XE#8396]) +1 other test skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420.html

  * igt@kms_pm_dc@dc3co-vpb-framegap@pr-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-framegap@pr-xrgb8888.html

  * igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#8396]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][103] -> [FAIL][104] ([Intel XE#8399]) +1 other test fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-lpsp-stress:
    - shard-bmg:          NOTRUN -> [SKIP][105] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-9/igt@kms_pm_rpm@modeset-lpsp-stress.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-lnl:          NOTRUN -> [SKIP][106] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][107] ([Intel XE#5858] / [Intel XE#7304]) +3 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:
    - shard-lnl:          NOTRUN -> [SKIP][108] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#4608]) +1 other test skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][110] ([Intel XE#5858]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-7/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#4608] / [Intel XE#7304]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-ptl:          NOTRUN -> [SKIP][112] ([Intel XE#7304]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#1489]) +3 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-ptl:          NOTRUN -> [SKIP][114] ([Intel XE#7413]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-bmg:          NOTRUN -> [SKIP][115] ([Intel XE#2387] / [Intel XE#7429])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1406]) +1 other test skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-psr-suspend:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2234] / [Intel XE#2850])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_psr@fbc-psr-suspend.html

  * igt@kms_psr@fbc-psr2-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][118] ([Intel XE#1406] / [Intel XE#7345])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-5/igt@kms_psr@fbc-psr2-dpms.html

  * igt@kms_psr@fbc-psr2-dpms@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-5/igt@kms_psr@fbc-psr2-dpms@edp-1.html

  * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
    - shard-ptl:          NOTRUN -> [SKIP][120] ([Intel XE#1406] / [Intel XE#5835]) +3 other tests skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html

  * igt@kms_psr@pr-no-drrs:
    - shard-ptl:          NOTRUN -> [SKIP][121] ([Intel XE#1406]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@kms_psr@pr-no-drrs.html

  * igt@kms_psr@psr-suspend@edp-1:
    - shard-ptl:          [PASS][122] -> [ABORT][123] ([Intel XE#9362]) +2 other tests abort
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-3/igt@kms_psr@psr-suspend@edp-1.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@kms_psr@psr-suspend@edp-1.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#1127] / [Intel XE#5813])
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-5/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-ptl:          NOTRUN -> [SKIP][125] ([Intel XE#5848])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1091] / [Intel XE#2849])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-2/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-bmg:          NOTRUN -> [ABORT][127] ([Intel XE#8868])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-1/igt@sriov_basic@pf-unbind-with-vf-probed.html
    - shard-ptl:          NOTRUN -> [ABORT][128] ([Intel XE#8868])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:
    - shard-ptl:          NOTRUN -> [ABORT][129] ([Intel XE#9362]) +1 other test abort
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system.html

  * igt@xe_ccs@vm-bind-fault-mode-decompress:
    - shard-ptl:          NOTRUN -> [SKIP][130] ([Intel XE#7644])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@xe_ccs@vm-bind-fault-mode-decompress.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-ptl:          NOTRUN -> [SKIP][131] ([Intel XE#5764]) +10 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][132] ([Intel XE#6321] / [Intel XE#8355])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-multi-queue-cm:
    - shard-bmg:          NOTRUN -> [SKIP][133] ([Intel XE#8370])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-4/igt@xe_evict@evict-small-multi-queue-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#6540] / [Intel XE#688]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-ptl:          NOTRUN -> [SKIP][135] ([Intel XE#6144]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#7482]) +4 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-3/igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_balancer@once-parallel-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][137] ([Intel XE#7482]) +13 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@xe_exec_balancer@once-parallel-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-null-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2322] / [Intel XE#7372]) +3 other tests skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exec-null-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-ptl:          NOTRUN -> [SKIP][139] ([Intel XE#5575] / [Intel XE#7484]) +11 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][140] ([Intel XE#1392]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:
    - shard-ptl:          NOTRUN -> [SKIP][141] ([Intel XE#8374]) +11 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@xe_exec_fault_mode@once-multi-queue-invalid-fault.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][142] ([Intel XE#8374]) +3 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-8/igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@twice-multi-queue-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][143] ([Intel XE#8374]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-2/igt@xe_exec_fault_mode@twice-multi-queue-prefetch.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][144] ([Intel XE#8364]) +8 other tests skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-6/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority-smem.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-priority:
    - shard-ptl:          NOTRUN -> [SKIP][145] ([Intel XE#8364]) +28 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@xe_exec_multi_queue@max-queues-preempt-mode-priority.html

  * igt@xe_exec_multi_queue@two-queues-basic-smem:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#8364]) +5 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-2/igt@xe_exec_multi_queue@two-queues-basic-smem.html

  * igt@xe_exec_reset@multi-queue-cat-error:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#8369])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-6/igt@xe_exec_reset@multi-queue-cat-error.html

  * igt@xe_exec_reset@multi-queue-gt-reset:
    - shard-ptl:          NOTRUN -> [SKIP][148] ([Intel XE#8369]) +3 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@xe_exec_reset@multi-queue-gt-reset.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:
    - shard-ptl:          NOTRUN -> [SKIP][149] ([Intel XE#6196]) +1 other test skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-basic:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#8378]) +2 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-6/igt@xe_exec_threads@threads-multi-queue-mixed-basic.html

  * igt@xe_exec_threads@threads-multi-queue-mixed-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#8378]) +1 other test skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@xe_exec_threads@threads-multi-queue-mixed-userptr.html

  * igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:
    - shard-ptl:          NOTRUN -> [SKIP][152] ([Intel XE#8378]) +9 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@xe_exec_threads@threads-multi-queue-shared-vm-basic.html

  * igt@xe_media_fill@media-fill:
    - shard-ptl:          NOTRUN -> [SKIP][153] ([Intel XE#5830] / [Intel XE#7453])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@xe_media_fill@media-fill.html

  * igt@xe_mempage_offline@inject-single-page:
    - shard-ptl:          NOTRUN -> [SKIP][154] ([Intel XE#9203]) +1 other test skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@xe_mempage_offline@inject-single-page.html
    - shard-bmg:          NOTRUN -> [SKIP][155] ([Intel XE#9203])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-4/igt@xe_mempage_offline@inject-single-page.html

  * igt@xe_mmap@pci-membarrier:
    - shard-lnl:          NOTRUN -> [SKIP][156] ([Intel XE#5100] / [Intel XE#7322] / [Intel XE#7408])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-6/igt@xe_mmap@pci-membarrier.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-ptl:          NOTRUN -> [SKIP][157] ([Intel XE#5100] / [Intel XE#7408])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_module_load@load:
    - shard-ptl:          ([PASS][158], [PASS][159], [PASS][160], [PASS][161], [PASS][162], [PASS][163], [PASS][164], [PASS][165], [PASS][166], [PASS][167], [PASS][168], [PASS][169], [PASS][170], [PASS][171], [PASS][172], [PASS][173], [PASS][174], [PASS][175], [PASS][176], [PASS][177], [PASS][178], [PASS][179], [PASS][180], [PASS][181], [PASS][182]) -> ([PASS][183], [PASS][184], [PASS][185], [PASS][186], [PASS][187], [PASS][188], [PASS][189], [PASS][190], [PASS][191], [PASS][192], [PASS][193], [PASS][194], [PASS][195], [PASS][196], [PASS][197], [PASS][198], [PASS][199], [PASS][200], [PASS][201], [PASS][202], [PASS][203], [PASS][204], [PASS][205], [PASS][206], [PASS][207], [SKIP][208]) ([Intel XE#9286])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-2/igt@xe_module_load@load.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-2/igt@xe_module_load@load.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-8/igt@xe_module_load@load.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-5/igt@xe_module_load@load.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-5/igt@xe_module_load@load.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-7/igt@xe_module_load@load.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-6/igt@xe_module_load@load.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-4/igt@xe_module_load@load.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-4/igt@xe_module_load@load.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-8/igt@xe_module_load@load.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-4/igt@xe_module_load@load.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-6/igt@xe_module_load@load.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-3/igt@xe_module_load@load.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-8/igt@xe_module_load@load.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-3/igt@xe_module_load@load.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-3/igt@xe_module_load@load.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-5/igt@xe_module_load@load.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-5/igt@xe_module_load@load.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-7/igt@xe_module_load@load.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-7/igt@xe_module_load@load.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-1/igt@xe_module_load@load.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-1/igt@xe_module_load@load.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-8/igt@xe_module_load@load.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-1/igt@xe_module_load@load.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-2/igt@xe_module_load@load.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@xe_module_load@load.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@xe_module_load@load.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@xe_module_load@load.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@xe_module_load@load.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@xe_module_load@load.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@xe_module_load@load.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@xe_module_load@load.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@xe_module_load@load.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@xe_module_load@load.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@xe_module_load@load.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@xe_module_load@load.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@xe_module_load@load.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@xe_module_load@load.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@xe_module_load@load.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@xe_module_load@load.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@xe_module_load@load.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@xe_module_load@load.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-7/igt@xe_module_load@load.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@xe_module_load@load.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-7/igt@xe_module_load@load.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@xe_module_load@load.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@xe_module_load@load.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@xe_module_load@load.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@xe_module_load@load.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-7/igt@xe_module_load@load.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@xe_module_load@load.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-basic:
    - shard-bmg:          NOTRUN -> [SKIP][209] ([Intel XE#6964])
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html
    - shard-ptl:          NOTRUN -> [SKIP][210] ([Intel XE#6964]) +1 other test skip
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@xe_multigpu_svm@mgpu-atomic-op-basic.html

  * igt@xe_multigpu_svm@mgpu-pagefault-basic:
    - shard-lnl:          NOTRUN -> [SKIP][211] ([Intel XE#6964])
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@xe_multigpu_svm@mgpu-pagefault-basic.html

  * igt@xe_page_reclaim@binds-1g-partial:
    - shard-bmg:          NOTRUN -> [SKIP][212] ([Intel XE#7793])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-8/igt@xe_page_reclaim@binds-1g-partial.html

  * igt@xe_page_reclaim@binds-full-pd:
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#7793])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@xe_page_reclaim@binds-full-pd.html

  * igt@xe_pm@d3cold-mocs:
    - shard-ptl:          NOTRUN -> [SKIP][214] ([Intel XE#5741]) +2 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-i2c:
    - shard-lnl:          NOTRUN -> [SKIP][215] ([Intel XE#5742] / [Intel XE#7328] / [Intel XE#7400])
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@xe_pm@d3hot-i2c.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-bmg:          NOTRUN -> [SKIP][216] ([Intel XE#2284] / [Intel XE#7370])
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-ptl:          NOTRUN -> [SKIP][217] ([Intel XE#6867])
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-7/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-ptl:          NOTRUN -> [SKIP][218] ([Intel XE#6019]) +1 other test skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-bmg:          [PASS][219] -> [FAIL][220] ([Intel XE#6569])
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-10/igt@xe_sriov_flr@flr-each-isolation.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-5/igt@xe_sriov_flr@flr-each-isolation.html

  * igt@xe_sriov_scheduling@equal-throughput-low-priority:
    - shard-lnl:          NOTRUN -> [SKIP][221] ([Intel XE#8339])
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-8/igt@xe_sriov_scheduling@equal-throughput-low-priority.html

  * igt@xe_sriov_vram@vf-access-after-resize-up:
    - shard-lnl:          NOTRUN -> [SKIP][222] ([Intel XE#6376] / [Intel XE#7330] / [Intel XE#7422])
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-1/igt@xe_sriov_vram@vf-access-after-resize-up.html

  * igt@xe_survivability@runtime-survivability:
    - shard-ptl:          NOTRUN -> [SKIP][223] ([Intel XE#8415] / [Intel XE#8432])
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@xe_survivability@runtime-survivability.html

  * igt@xe_vm@out-of-memory:
    - shard-ptl:          NOTRUN -> [SKIP][224] ([Intel XE#5745] / [Intel XE#7892])
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@xe_vm@out-of-memory.html

  * igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:
    - shard-ptl:          NOTRUN -> [SKIP][225] ([Intel XE#9597])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@xe_vm@overcommit-fault-vram-lr-no-overcommit.html

  
#### Possible fixes ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          [FAIL][226] ([Intel XE#1231]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-lnl-5/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][228] ([Intel XE#301]) -> [PASS][229] +1 other test pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-ptl:          [FAIL][230] ([Intel XE#3321]) -> [PASS][231] +1 other test pass
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-7/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [ABORT][232] ([Intel XE#9362]) -> [PASS][233] +1 other test pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-ptl:          [ABORT][234] ([Intel XE#9363]) -> [PASS][235] +1 other test pass
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-ptl:          [ABORT][236] ([Intel XE#9362]) -> [PASS][237] +9 other tests pass
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-2/igt@kms_pm_backlight@fade-with-suspend.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-psr-suspend-resume:
    - shard-lnl:          [FAIL][238] ([Intel XE#8399]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-lnl-6/igt@kms_pm_dc@dc5-psr-suspend-resume.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-3/igt@kms_pm_dc@dc5-psr-suspend-resume.html

  * igt@xe_ccs@suspend-resume:
    - shard-bmg:          [ABORT][240] ([Intel XE#9362] / [Intel XE#9425] / [Intel XE#9581]) -> [PASS][241]
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-4/igt@xe_ccs@suspend-resume.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-3/igt@xe_ccs@suspend-resume.html

  * igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-vram01:
    - shard-bmg:          [ABORT][242] ([Intel XE#9362] / [Intel XE#9425]) -> [PASS][243]
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-4/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-vram01.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-3/igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-vram01.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][244] ([Intel XE#9362]) -> [PASS][245] +1 other test pass
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html

  
#### Warnings ####

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [ABORT][246] ([Intel XE#9393] / [Intel XE#9406]) -> [ABORT][247] ([Intel XE#9406] / [Intel XE#9422])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-10/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-bmg:          [FAIL][248] ([Intel XE#9319] / [Intel XE#9346]) -> [FAIL][249] ([Intel XE#9346])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-1/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][250] ([Intel XE#3544]) -> [SKIP][251] ([Intel XE#3374] / [Intel XE#3544])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][252] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][253] ([Intel XE#2426] / [Intel XE#5848])
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_pat@pat-sw-hw-suspend:
    - shard-ptl:          [FAIL][254] ([Intel XE#7695]) -> [ABORT][255] ([Intel XE#9362])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-7/igt@xe_pat@pat-sw-hw-suspend.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-7/igt@xe_pat@pat-sw-hw-suspend.html

  
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1470]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1470
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2853]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2853
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4422
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#5100]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5100
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5742]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5823]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5823
  [Intel XE#5824]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5824
  [Intel XE#5828]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5828
  [Intel XE#5830]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5830
  [Intel XE#5835]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5835
  [Intel XE#5846]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5846
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5851]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851
  [Intel XE#5858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5858
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5907
  [Intel XE#5917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5917
  [Intel XE#5947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5947
  [Intel XE#5959]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5959
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6019
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#6144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6144
  [Intel XE#6174]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6174
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#6376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6376
  [Intel XE#6507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6507
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6569
  [Intel XE#6867]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6867
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6912]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6912
  [Intel XE#6918]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6918
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7084]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7308
  [Intel XE#7322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7322
  [Intel XE#7328]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7328
  [Intel XE#7330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7330
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7359
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7375
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385
  [Intel XE#7400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7400
  [Intel XE#7408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7408
  [Intel XE#7413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7413
  [Intel XE#7422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7422
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7429]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7429
  [Intel XE#7442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7442
  [Intel XE#7453]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7453
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7695
  [Intel XE#7793]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7793
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8303]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8303
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8370
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8391
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#8415]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8415
  [Intel XE#8432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8432
  [Intel XE#8868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8868
  [Intel XE#9144]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9144
  [Intel XE#9203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9203
  [Intel XE#9286]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9286
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9313
  [Intel XE#9319]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9319
  [Intel XE#9346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9363]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9363
  [Intel XE#9365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9365
  [Intel XE#9378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9378
  [Intel XE#9393]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9393
  [Intel XE#9406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9406
  [Intel XE#9422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9422
  [Intel XE#9425]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9425
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9533]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9533
  [Intel XE#9581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9581
  [Intel XE#9597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597


Build changes
-------------

  * IGT: IGT_9150 -> IGT_9151
  * Linux: xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767 -> xe-pw-175554v2

  IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9151: 9151
  xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767: b0311e0de50840c3f35aafa2e95c14bf38f4a767
  xe-pw-175554v2: 175554v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/index.html

--===============8340510479047427232==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: don&#x27;t touch the AUX engine=
 while it&#x27;s still busy (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/175554/">https://patchwork.freedesktop.org/series/175554/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-175554v2/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-175554v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5975-b0311e0de50840c3f35aafa2e95c14bf3=
8f4a767_FULL -&gt; xe-pw-175554v2_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-175554v2_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-5/igt@core_hot=
unplug@hotunplug-rescan.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-9/igt@core_hotunplug@hotunp=
lug-rescan.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@kms_atomic_transition@plane-a=
ll-modeset-transition-fencing.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/5947">Intel XE#5947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-3/igt@kms_big_fb@4-tiled-64bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_big_fb@4-tiled-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/5901">Intel XE#5901</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@kms_big_fb@linear-max-hw-stri=
de-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-2/igt@kms_big_fb@x-tiled-16bpp-rota=
te-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@kms_big_fb@x-tiled-max-hw-str=
ide-32bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>) +13 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-6/igt@kms_big_fb@y-tiled-8bpp-rotat=
e-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-6/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180-hflip.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_big_fb@yf-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/607">Intel XE#607</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_big_fb@yf-tiled-addfb-siz=
e-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/5851">Intel XE#5851</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-target-2560x1440p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@kms_bw@connected-linear-tilin=
g-2-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +4 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-2/igt@kms_bw@connected-linear-tilin=
g-3-displays-target-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-target-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-8/igt@kms_bw@connected-linear-tilin=
g-4-displays-target-2160x1440p.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-1920x1080p:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@kms_bw@linear-tiling-3-displa=
ys-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_bw@linear-tiling-4-displ=
ays-target-1920x1080p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-2/igt@kms_ccs@bad-pixel-format-y-ti=
led-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@kms_ccs@crc-primary-basic-4-t=
iled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5823">Intel XE#5823</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6918">Intel XE#6918</a>) +9 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-10/igt@kms_ccs=
@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-3/=
igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-b-dp-2.html">ABORT</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9406">Inte=
l XE#9406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/9422">Intel XE#9422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-2/igt@kms_ccs@=
crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/=
igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-b-edp-1.html">ABORT</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7084">Int=
el XE#7084</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9378">Intel XE#9378</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-y=
-tiled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@kms_ccs@crc-sprite-planes-bas=
ic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-bas=
ic-yf-tiled-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio-after-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-5/igt@kms_chamelium_audio@dp-audio-=
after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-1/igt@kms_chamelium_audio@hdmi-audi=
o-edid.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5824">Intel XE#5824</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-4/igt@kms_chamelium_color@ctm-negat=
ive.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2325">Intel XE#2325</a> / <a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/7358">Intel XE#7358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-fixed-matrix-yuv-rgb-bt2020:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_chamelium_color_pipeline@=
plane-fixed-matrix-yuv-rgb-bt2020.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8391">Intel XE#8391</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-lut3d-green-only:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-3/igt@kms_chamelium_color_pipeline@=
plane-lut3d-green-only.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_sharpness_filter@filter-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@kms_chamelium_sharpness_filte=
r@filter-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6507">Intel XE#6507</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-ctm3x4-lut1d@pipe-d-plane-3:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@kms_color_pipeline@plane-lut1=
d-ctm3x4-lut1d@pipe-d-plane-3.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-hdcp14:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@kms_content_protection@atomic=
-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@kms_content_protection@dp-mst=
-type-0-hdcp14.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-7/igt@kms_content_protection@legacy=
@pipe-a-dp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@kms_content_protection@lic-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7642">Intel XE#7642</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-6/igt@kms_content_protection@lic-ty=
pe-0-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374=
</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@kms_cursor_crc@cursor-onscree=
n-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/5846">Intel XE#5846</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@kms_cursor_crc@cursor-random-=
max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/5900">Intel XE#5900</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_cursor_crc@cursor-rapid-=
movement-max-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-3/igt@kms_curs=
or_crc@cursor-suspend.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-3/igt@kms_cursor_crc@cursor-s=
uspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/9365">Intel XE#9365</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/5962">Intel XE#5962</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-1/igt@kms_cursor_legacy@cursorb-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-varying-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@kms_cursor_legacy@cursorb-vs-=
flipb-varying-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/5962">Intel XE#5962</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-mst:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@kms_dp_link_training@uhbr-mst=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/9533">Intel XE#9533</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats-ultrajoiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@kms_dsc@dsc-with-bpc-formats-=
ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5907">Intel XE#5907</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-output-formats-with-bpc-ultrajoiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-4/igt@kms_dsc@dsc-with-output-forma=
ts-with-bpc-ultrajoiner.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +2 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_fbc_dirty_rect@fbc-dirty-rectangle-different-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-1/igt@kms_fbc_dirty_rect@fbc-dirty-=
rectangle-different-formats.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4422">Intel XE#4422</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7442">Intel XE#7442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@kms_feature_discovery@chameli=
um.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/7359">Intel XE#7359</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-blocking-absolute-wf_vblank:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@kms_flip@2x-blocking-absolute=
-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2316">Intel XE#2316</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-6/igt@kms_flip@2x-flip-vs-dpms-on-n=
op-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-4tile-to-64bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7385">In=
tel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/9144">Intel XE#9144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_flip_scaled_crc@flip-32bp=
p-xtile-to-64bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>) +6 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-16bpp-4tile-downscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-7/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-16bpp-4tile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/5828">Intel XE#5828</a>) +5 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@kms_flip_scaled_crc@flip-64bp=
p-4tile-to-32bpp-4tile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/73=
85">Intel XE#7385</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/9144">Intel XE#9144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@kms_frontbuffer_tracking@drrs=
hdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +3 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-5/igt@kms_frontbuffer_tracking@drrs=
hdr-argb161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>) +2 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscreen-pri-indfb-draw-mmap-wc=
:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-offscreen-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +22 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905=
</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-abgr161616f-draw-render:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +4 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@kms_frontbuffer_tracking@fbcd=
rrs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +12 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-cur-indfb-draw-mmap-=
wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-1p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +12 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-2p-primscrn-cur-indfb-draw-rende=
r:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_frontbuffer_tracking@fbcd=
rrshdr-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +80 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-2p-primscrn-pri-indfb-draw-render:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbch=
dr-2p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +13 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-4/igt@kms_frontbuffer_tracking@fbch=
dr-abgr161616f-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-abgr161616f-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@kms_frontbuffer_tracking@fbch=
dr-abgr161616f-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>) +5 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcp=
sr-rgb101010-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-rgb565-draw-blt:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@kms_frontbuffer_tracking@hdr-=
rgb565-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7865">Intel XE#7865</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-abgr161616f-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@kms_frontbuffer_tracking@psr-=
abgr161616f-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-1p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-7/igt@kms_frontbuffer_tracking@psrh=
dr-1p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +8 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@audio-bw-hblank80:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-7/igt@kms_hdmi_audio_bw@audio-bw-hb=
lank80.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/9312">Intel XE#9312</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-5/igt@kms_hdmi_audio_bw@audio-bw-hb=
lank80.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/9313">Intel XE#9313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-3/igt@kms_hdmi=
_inject@inject-audio.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-7/igt@kms_hdmi_inject@inject-a=
udio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7308">Intel XE#7308</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-7/igt@kms_hdmi_inject@inject-audio.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1470">Intel XE#1470</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2853">Intel XE#2853</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-1/igt@kms_hdmi=
_inject@inject-audio.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-5/igt@kms_hdmi_inject@inject-a=
udio.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7308">Intel XE#7308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-metadata-sizes:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@kms_hdr@invalid-metadata-size=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/5917">Intel XE#5917</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/6174">Intel XE#6174</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-1/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/6900">Intel XE#6900</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-xtiled:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@kms_pipe_stress@stress-xrgb88=
88-xtiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/6912">Intel XE#6912</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-5/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6912">Intel XE#6912</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/7375">Intel XE#7375</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-lnl-ccs-modifier@pipe-a-plane-5:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-3/igt@kms_plane@pixel-format-4-tile=
d-lnl-ccs-modifier@pipe-a-plane-5.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/8303">Intel XE#8303</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-4-tiled-mtl-mc-ccs-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-2/igt@kms_plane@pixel-format-4-tile=
d-mtl-mc-ccs-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-x-tiled-modifier-source-clamping:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@kms_plane@pixel-format-x-tile=
d-modifier-source-clamping.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +5 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_plane@pixel-format-y-til=
ed-modifier.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/7283">Intel XE#7283</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@kms_plane_scaling@intel-max-s=
rc-size.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/5959">Intel XE#5959</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format@pipe-=
c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-7/igt@kms_plane_scaling@plane-downs=
cale-factor-0-5-with-pixel-format@pipe-c.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6=
886</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75@pipe-b:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@kms_plane_scaling@planes-down=
scale-factor-0-75@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@pr-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_pm_dc@dc3co-after-dc6@pr=
-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@kms_pm_dc@dc3co-after-dc6@pr-=
xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-after-dc6@psr2-yuv420:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_pm_dc@dc3co-after-dc6@ps=
r2-yuv420.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@kms_pm_dc@dc3co-after-dc6@psr=
2-yuv420.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap@pr-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-framegap@=
pr-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/8395">Intel XE#8395</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-framegap@psr2-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-3/igt@kms_pm_dc@dc3co-vpb-framegap@=
psr2-xrgb8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-lnl-8/igt@kms_pm_d=
c@dc6-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel=
 XE#8399</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp-stress:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-9/igt@kms_pm_rpm@modeset-lpsp-stres=
s.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-8/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-exceed-sf@pipe-b-e=
dp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-exceed-sf@pipe-b-edp-1.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel X=
E#7304</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-move-continuous-sf@pipe-a-edp-1:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-5/igt@kms_psr2_sf@fbc-psr2-cursor-p=
lane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-7/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-sf@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/5858">Intel XE#5858</a>) +1 other=
 test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-primary-update-sf-dmg-area@pipe-b-edp-1=
:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-=
primary-update-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#73=
04</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@kms_psr2_sf@pr-overlay-primar=
y-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_psr2_sf@psr2-overlay-pla=
ne-move-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@kms_psr2_su@page_flip-nv12.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/7413">Intel XE#7413</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_psr2_su@page_flip-p010.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2387">Intel XE#2387</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/7429">Intel XE#7429</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-3/igt@kms_psr@fbc-pr-cursor-plane-m=
ove.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-suspend:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_psr@fbc-psr-suspend.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-5/igt@kms_psr@fbc-psr2-dpms.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-dpms@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-5/igt@kms_psr@fbc-psr2-dpms@edp-1.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4609">Intel XE#4609</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@kms_psr@fbc-psr2-primary-page=
-flip@edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1406">Intel XE#1406</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/5835">Intel XE#5835</a>) +3 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@kms_psr@pr-no-drrs.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">=
Intel XE#1406</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-suspend@edp-1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-3/igt@kms_psr@=
psr-suspend@edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@kms_psr@psr-suspend@edp-1.h=
tml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/9362">Intel XE#9362</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-5/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@kms_tiled_display@basic-test-=
pattern-with-chamelium.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-2/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-1/igt@sriov_basic@pf-unbind-with-vf=
-probed.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8868">Intel XE#8868</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@sriov_basic@pf-unbind-with-vf=
-probed.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/8868">Intel XE#8868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-system-system:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@xe_ccs@suspend-resume@tile64-=
compressed-compfmt0-system-system.html">ABORT</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) +1 other te=
st abort</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-fault-mode-decompress:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@xe_ccs@vm-bind-fault-mode-dec=
ompress.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@xe_evict@evict-beng-cm-thread=
s-large-multi-vm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/5764">Intel XE#5764</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@xe_evict@evict-mixed-many-th=
reads-small.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-queue-cm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-4/igt@xe_evict@evict-small-multi-qu=
eue-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8370">Intel XE#8370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-instantfree-reopen:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-7/igt@xe_evict_ccs@evict-overcommit=
-parallel-instantfree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@xe_evict_ccs@evict-overcommit=
-parallel-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/6144">Intel XE#6144</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-3/igt@xe_exec_balancer@once-cm-virt=
ual-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@xe_exec_balancer@once-paralle=
l-userptr-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7482">Intel XE#7482</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-1/igt@xe_exec_basic@multigpu-no-exe=
c-null-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2322">Intel XE#2322</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@xe_exec_basic@multigpu-once-b=
indexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484=
</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@xe_exec_basic@multigpu-once-u=
serptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-invalid-fault:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@xe_exec_fault_mode@once-multi=
-queue-invalid-fault.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-invalidate-race-prefetch=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-8/igt@xe_exec_fault_mode@once-multi=
-queue-userptr-invalidate-race-prefetch.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +3 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-multi-queue-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-2/igt@xe_exec_fault_mode@twice-mult=
i-queue-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/8374">Intel XE#8374</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-6/igt@xe_exec_multi_queue@many-exec=
s-preempt-mode-fault-priority-smem.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-priority:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@xe_exec_multi_queue@max-queue=
s-preempt-mode-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +28 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@two-queues-basic-smem:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-2/igt@xe_exec_multi_queue@two-queue=
s-basic-smem.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/8364">Intel XE#8364</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-cat-error:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-6/igt@xe_exec_reset@multi-queue-cat=
-error.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@multi-queue-gt-reset:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@xe_exec_reset@multi-queue-gt-=
reset.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/8369">Intel XE#8369</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-multi-vma:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@xe_exec_system_allocator@pat-=
index-madvise-pat-idx-wt-multi-vma.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-6/igt@xe_exec_threads@threads-multi=
-queue-mixed-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-mixed-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@xe_exec_threads@threads-mult=
i-queue-mixed-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-shared-vm-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@xe_exec_threads@threads-multi=
-queue-shared-vm-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@xe_media_fill@media-fill.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
5830">Intel XE#5830</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/7453">Intel XE#7453</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mempage_offline@inject-single-page:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@xe_mempage_offline@inject-sin=
gle-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/9203">Intel XE#9203</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-4/igt@xe_mempage_offline@inject-sin=
gle-page.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/9203">Intel XE#9203</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-6/igt@xe_mmap@pci-membarrier.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/51=
00">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/7322">Intel XE#7322</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@xe_mmap@pci-membarrier-bad-pa=
gesize.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/5100">Intel XE#5100</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/7408">Intel XE#7408</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-ptl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-2/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-2/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-8/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-5=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-p=
tl-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/sha=
rd-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767=
/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4=
a767/shard-ptl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf=
38f4a767/shard-ptl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c=
14bf38f4a767/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2=
e95c14bf38f4a767/shard-ptl-4/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35a=
afa2e95c14bf38f4a767/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3=
f35aafa2e95c14bf38f4a767/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0de508=
40c3f35aafa2e95c14bf38f4a767/shard-ptl-8/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b0311e0d=
e50840c3f35aafa2e95c14bf38f4a767/shard-ptl-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-b031=
1e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5975-=
b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-5/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-7/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-7/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-1/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-1/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-=
ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/sh=
ard-ptl-2/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-175554v2/shard-ptl-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1755=
54v2/shard-ptl-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-175554v2/shard-ptl-2/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1755=
54v2/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-175554v2/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1755=
54v2/shard-ptl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-175554v2/shard-ptl-8/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1755=
54v2/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-175554v2/shard-ptl-6/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-=
4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1755=
54v2/shard-ptl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@xe_module=
_load@load.html">SKIP</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/9286">Intel XE#9286</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@xe_multigpu_svm@mgpu-atomic-=
op-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/6964">Intel XE#6964</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-6/igt@xe_multigpu_svm@mgpu-atomic-o=
p-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-pagefault-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@xe_multigpu_svm@mgpu-pagefaul=
t-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-1g-partial:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-8/igt@xe_page_reclaim@binds-1g-part=
ial.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_page_reclaim@binds-full-pd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@xe_page_reclaim@binds-full-pd=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7793">Intel XE#7793</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-5/igt@xe_pm@d3cold-mocs.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741">I=
ntel XE#5741</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-i2c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@xe_pm@d3hot-i2c.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5742">Int=
el XE#5742</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/7328">Intel XE#7328</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/7400">Intel XE#7400</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-bmg-7/igt@xe_pm@s2idle-d3cold-basic-exe=
c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-7/igt@xe_pm@s3-vm-bind-unbind-all.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/6867">Intel XE#6867</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-4/igt@xe_query@multigpu-query-inval=
id-cs-cycles.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/6019">Intel XE#6019</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-10/igt@xe_srio=
v_flr@flr-each-isolation.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-5/igt@xe_sriov_flr@flr-eac=
h-isolation.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/6569">Intel XE#6569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@equal-throughput-low-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-8/igt@xe_sriov_scheduling@equal-thr=
oughput-low-priority.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_vram@vf-access-after-resize-up:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-lnl-1/igt@xe_sriov_vram@vf-access-after=
-resize-up.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/6376">Intel XE#6376</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/7330">Intel XE#7330</a> / <a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/7422">Intel XE#7422</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_survivability@runtime-survivability:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@xe_survivability@runtime-surv=
ivability.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/8415">Intel XE#8415</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/8432">Intel XE#8432</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@out-of-memory:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-8/igt@xe_vm@out-of-memory.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745"=
>Intel XE#5745</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-fault-vram-lr-no-overcommit:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-175554v2/shard-ptl-1/igt@xe_vm@overcommit-fault-vram-l=
r-no-overcommit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/9597">Intel XE#9597</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-lnl-5/igt@kms_big_=
fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE=
#1231</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-175554v2/shard-lnl-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-h=
flip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-lnl-6/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-6/igt@km=
s_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-7/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/ig=
t@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other test pass<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-6/igt@kms_flip=
@flip-vs-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-10/igt@kms_flip@fli=
p-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-8/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9363">Intel XE#9363</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl=
-6/igt@kms_plane@plane-panning-bottom-right-suspend.html">PASS</a> +1 other=
 test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-2/igt@kms_pm_b=
acklight@fade-with-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-3/igt@kms=
_pm_backlight@fade-with-suspend.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr-suspend-resume:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-lnl-6/igt@kms_pm_d=
c@dc5-psr-suspend-resume.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-3/igt@kms_pm=
_dc@dc5-psr-suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-4/igt@xe_ccs@s=
uspend-resume.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/9362">Intel XE#9362</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/9425">Intel XE#9425</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/9581">Intel XE#9581</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shar=
d-bmg-3/igt@xe_ccs@suspend-resume.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile4-compressed-compfmt0-system-vram01:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-4/igt@xe_ccs@s=
uspend-resume@tile4-compressed-compfmt0-system-vram01.html">ABORT</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9=
362</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/94=
25">Intel XE#9425</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-pw-175554v2/shard-bmg-3/igt@xe_ccs@suspend-resume@tile4-compresse=
d-compfmt0-system-vram01.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-lnl-1/igt@xe_pm@s4=
-vm-bind-userptr.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-lnl-4/igt@xe_pm@s4-vm-b=
ind-userptr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-10/igt@kms_ccs=
@crc-primary-suspend-4-tiled-bmg-ccs.html">ABORT</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9393">Intel XE#9393</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9406">Intel XE#9406=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1755=
54v2/shard-bmg-3/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">ABOR=
T</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9406"=
>Intel XE#9406</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/9422">Intel XE#9422</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-1/igt@kms_hdmi=
_audio_bw@suspend-disk-audio-recovery.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/9319">Intel XE#9319</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346">Intel XE#9346=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1755=
54v2/shard-bmg-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">FA=
IL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/9346=
">Intel XE#9346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-3/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-bmg-2/igt@kms_hdr@bri=
ghtness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-bmg-3/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shar=
d-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">In=
tel XE#5848</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-sw-hw-suspend:</p>
<ul>
<li>shard-ptl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767/shard-ptl-7/igt@xe_pat@p=
at-sw-hw-suspend.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/7695">Intel XE#7695</a>) -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-175554v2/shard-ptl-7/igt@xe_pat@pat-sw-=
hw-suspend.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9150 -&gt; IGT_9151</li>
<li>Linux: xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767 -&gt; xe-pw-175=
554v2</li>
</ul>
<p>IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_9151: 9151<br />
  xe-5975-b0311e0de50840c3f35aafa2e95c14bf38f4a767: b0311e0de50840c3f35aafa=
2e95c14bf38f4a767<br />
  xe-pw-175554v2: 175554v2</p>

</body>
</html>

--===============8340510479047427232==--
