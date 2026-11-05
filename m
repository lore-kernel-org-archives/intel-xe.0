Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39CBD606D823
	for <intel-xe@archiver.kernel.org>; Thu,  5 Nov 2026 15:18:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EC4F511275D;
	Thu,  5 Nov 2026 15:18:54 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5920311275D;
 Thu,  5 Nov 2026 15:18:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7006341393899786386=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Cleanup_OA_stream_on_PCI_u?=
 =?utf-8?q?nbind/remove_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Umesh Nerlige Ramappa" <umesh.nerlige.ramappa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Nov 2026 15:18:53 -0000
Message-ID: <179389193335.125928.2739902023128104865@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261105001559.3288915-9-umesh.nerlige.ramappa@intel.com>
In-Reply-To: <20261105001559.3288915-9-umesh.nerlige.ramappa@intel.com>
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

--===============7006341393899786386==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Cleanup OA stream on PCI unbind/remove (rev4)
URL   : https://patchwork.freedesktop.org/series/177300/
State : success

== Summary ==

CI Bug Log - changes from xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d_FULL -> xe-pw-177300v4_FULL
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

  Here are the changes found in xe-pw-177300v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan-with-load:
    - shard-bmg:          [PASS][1] -> [ABORT][2] ([Intel XE#9463])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-bmg-4/igt@core_hotunplug@hotunplug-rescan-with-load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan-with-load.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-lnl:          NOTRUN -> [SKIP][3] ([Intel XE#3279])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1407])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][5] ([Intel XE#2327])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][6] ([Intel XE#1124]) +2 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][7] ([Intel XE#1124])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#1467] / [Intel XE#7367])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][9] ([Intel XE#7679]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#367])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html

  * igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][11] ([Intel XE#367])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#8365])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#2887]) +4 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#2887])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][15] ([Intel XE#3432]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][16] ([Intel XE#2652]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#7358]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-lnl:          NOTRUN -> [SKIP][18] ([Intel XE#373]) +4 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][19] ([Intel XE#3304]) +1 other test fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-7/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-lnl:          NOTRUN -> [SKIP][20] ([Intel XE#1468] / [Intel XE#7396])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-lnl:          NOTRUN -> [SKIP][21] ([Intel XE#7642])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@suspend-resume@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][22] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-9/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-lnl:          NOTRUN -> [SKIP][23] ([Intel XE#2321] / [Intel XE#7355])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1424]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-256x85:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#2320]) +1 other test skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x85.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][26] ([Intel XE#309] / [Intel XE#7343])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#9528])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#9535])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dsc@dsc-with-formats-ultrajoiner:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#8265]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_dsc@dsc-with-formats-ultrajoiner.html

  * igt@kms_flip@2x-absolute-wf_vblank-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1421]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [PASS][31] -> [FAIL][32] ([Intel XE#301] / [Intel XE#3149]) +1 other test fail
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [PASS][33] -> [FAIL][34] ([Intel XE#301]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#7179])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7178] / [Intel XE#7351]) +3 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#352])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2311]) +6 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#7061] / [Intel XE#7356]) +2 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#7905]) +25 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][41] ([Intel XE#7061])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#4141])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#656] / [Intel XE#7905]) +14 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#6312] / [Intel XE#651]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#6312]) +7 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#7865]) +11 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][47] ([Intel XE#2313]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][48] ([Intel XE#7061])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html

  * igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#9312])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#6901])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#6900] / [Intel XE#7362])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_multipipe_modeset@basic-max-pipe-crc-check:
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#7591])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html

  * igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#7283])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html

  * igt@kms_plane@pixel-format-y-tiled-modifier:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#7283]) +4 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_plane@pixel-format-y-tiled-modifier.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#4596] / [Intel XE#5854])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#8395] / [Intel XE#8396]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][58] ([Intel XE#8396]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888.html

  * igt@kms_pm_rpm@dpms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#7383] / [Intel XE#836])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html

  * igt@kms_pm_rpm@package-g7:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#6813])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_pm_rpm@package-g7.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#2893] / [Intel XE#7304]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2893] / [Intel XE#4608] / [Intel XE#7304])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][63] ([Intel XE#4608])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][64] ([Intel XE#4608] / [Intel XE#7304])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html

  * igt@kms_psr@fbc-pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1406])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_psr@fbc-pr-primary-page-flip.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#1406] / [Intel XE#7345])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-primary-render@edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1406] / [Intel XE#4609] / [Intel XE#7345])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render@edp-1.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#3904] / [Intel XE#7342])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1127] / [Intel XE#5813])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#1435] / [Intel XE#9142])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@sriov_basic@pf-unbind-with-vf-probed:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#8866])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@sriov_basic@pf-unbind-with-vf-probed.html

  * igt@xe_cw_post_sync@walker-post-sync:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#8608])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@xe_cw_post_sync@walker-post-sync.html

  * igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#6540] / [Intel XE#688]) +3 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html

  * igt@xe_exec_balancer@many-cm-virtual-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#7482]) +9 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_exec_balancer@many-cm-virtual-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][75] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#1392]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@atomic-many:
    - shard-bmg:          [PASS][77] -> [FAIL][78] ([Intel XE#8578])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-bmg-3/igt@xe_exec_fault_mode@atomic-many.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html

  * igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#8374]) +7 other tests skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#8364]) +3 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr.html

  * igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic-smem:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#8364]) +14 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic-smem.html

  * igt@xe_exec_reset@cm-multi-queue-close-fd:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#8369])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_exec_reset@cm-multi-queue-close-fd.html

  * igt@xe_exec_reset@gt-stress-reset-destroy-vm-context:
    - shard-bmg:          [PASS][83] -> [DMESG-WARN][84] ([Intel XE#8652])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-bmg-9/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-5/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][85] ([Intel XE#8378]) +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-multi-queue-cm-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#8378]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-cm-userptr-rebind.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-lnl:          [PASS][87] -> [ABORT][88] ([Intel XE#6652])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-lnl-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#6964])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:
    - shard-lnl:          NOTRUN -> [SKIP][90] ([Intel XE#6964]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html

  * igt@xe_pat@l2-flush-opt-svm-pat-restrict:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#7590] / [Intel XE#7772])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html

  * igt@xe_pm@d3cold-mocs:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#2284] / [Intel XE#7370])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-lnl:          NOTRUN -> [SKIP][93] ([Intel XE#584] / [Intel XE#7369])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-ptl:          [PASS][94] -> [ABORT][95] ([Intel XE#9362])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-ptl-6/igt@xe_pm@s4-vm-bind-unbind-all.html
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-ptl-3/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@aspm_link_residency:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#7271])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_pm_residency@aspm_link_residency.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [PASS][97] -> [FAIL][98] ([Intel XE#9254]) +1 other test fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-bmg-4/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_prefetch_fault@prefetch-fault:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#7599])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@xe_prefetch_fault@prefetch-fault.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-bmg:          NOTRUN -> [SKIP][100] ([Intel XE#944])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  * igt@xe_sriov_flr@flr-vfs-parallel:
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#4273])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_sriov_flr@flr-vfs-parallel.html

  * igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority:
    - shard-lnl:          NOTRUN -> [SKIP][102] ([Intel XE#8339])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority.html

  * igt@xe_vm@bind-array-enobufs:
    - shard-lnl:          NOTRUN -> [FAIL][103] ([Intel XE#9424])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_vm@bind-array-enobufs.html

  * igt@xe_vm@out-of-memory:
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#5745] / [Intel XE#7892])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_vm@out-of-memory.html

  
#### Possible fixes ####

  * igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:
    - shard-bmg:          [DMESG-WARN][105] ([Intel XE#1727] / [Intel XE#6819]) -> [PASS][106]
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html

  * igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue:
    - shard-bmg:          [ABORT][107] ([Intel XE#9463]) -> [PASS][108]
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-bmg-10/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [ABORT][109] ([Intel XE#9362]) -> [PASS][110]
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-lnl-5/igt@xe_pm@s4-exec-after.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [DMESG-WARN][111] ([Intel XE#7727]) -> [PASS][112]
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-lnl-7/igt@xe_pm@s4-mocs.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-4/igt@xe_pm@s4-mocs.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][113] ([Intel XE#3544]) -> [SKIP][114] ([Intel XE#3374] / [Intel XE#3544])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][115] ([Intel XE#1729] / [Intel XE#7424]) -> [SKIP][116] ([Intel XE#2426] / [Intel XE#5848])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3279]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4273]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609
  [Intel XE#5745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745
  [Intel XE#5813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5854]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#6652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652
  [Intel XE#6813]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813
  [Intel XE#6819]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900
  [Intel XE#6901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7179]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179
  [Intel XE#7271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7271
  [Intel XE#7283]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283
  [Intel XE#7304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345
  [Intel XE#7351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351
  [Intel XE#7355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355
  [Intel XE#7356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356
  [Intel XE#7358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358
  [Intel XE#7362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362
  [Intel XE#7367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367
  [Intel XE#7369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7383]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383
  [Intel XE#7396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7590]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590
  [Intel XE#7591]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591
  [Intel XE#7599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599
  [Intel XE#7642]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642
  [Intel XE#7679]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7772]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7892]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8265]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265
  [Intel XE#8339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365
  [Intel XE#8369]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369
  [Intel XE#8374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8395]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395
  [Intel XE#8396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396
  [Intel XE#8578]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578
  [Intel XE#8608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608
  [Intel XE#8652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652
  [Intel XE#8866]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8866
  [Intel XE#9142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142
  [Intel XE#9254]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254
  [Intel XE#9312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9424
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#9463]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463
  [Intel XE#9528]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9528
  [Intel XE#9535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9535


Build changes
-------------

  * Linux: xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d -> xe-pw-177300v4

  IGT_9177: 9177
  xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d: e19b5ed0ad912bb15fa5826fdc746f739e39650d
  xe-pw-177300v4: 177300v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/index.html

--===============7006341393899786386==
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
<tr><td><b>Series:</b></td><td>Cleanup OA stream on PCI unbind/remove (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/177300/">https://patchwork.freedesktop.org/series/177300/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d_FULL -&gt; xe-pw-177300v4_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-177300v4_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan-with-load:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-bmg-4/igt@core_hotunplug@hotunplug-rescan-with-load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-1/igt@core_hotunplug@hotunplug-rescan-with-load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3279">Intel XE#3279</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467">Intel XE#1467</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7367">Intel XE#7367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_bw@connected-linear-tiling-3-displays-target-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7679">Intel XE#7679</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-target-1920x1080p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-3/igt@kms_bw@linear-tiling-2-displays-target-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_bw@linear-tiling-3-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-target-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_bw@linear-tiling-4-displays-target-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8365">Intel XE#8365</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-4/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_chamelium_color_pipeline@plane-ctm3x4-lut1d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7358">Intel XE#7358</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-7/igt@kms_content_protection@lic-type-0-hdcp14@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1468">Intel XE#1468</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7396">Intel XE#7396</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7642">Intel XE#7642</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@suspend-resume@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-9/igt@kms_content_protection@suspend-resume@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7355">Intel XE#7355</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-256x85:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_cursor_crc@cursor-sliding-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_dp_link_training@non-uhbr-mst-tbtalt-train.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9528">Intel XE#9528</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_dp_link_training@uhbr-sst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9535">Intel XE#9535</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats-ultrajoiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_dsc@dsc-with-formats-ultrajoiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8265">Intel XE#8265</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_flip@2x-absolute-wf_vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-32bpp-linear-reflect-x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7179">Intel XE#7179</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7351">Intel XE#7351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7356">Intel XE#7356</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_frontbuffer_tracking@drrshdr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrshdr-abgr161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcdrrs-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrshdr-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_frontbuffer_tracking@fbchdr-1p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_frontbuffer_tracking@psrhdr-argb161616f-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_hdmi_audio_bw@suspend-disk-audio-recovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9312">Intel XE#9312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6901">Intel XE#6901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6900">Intel XE#6900</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7362">Intel XE#7362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_multipipe_modeset@basic-max-pipe-crc-check:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_multipipe_modeset@basic-max-pipe-crc-check.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7591">Intel XE#7591</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_plane@pixel-format-y-tiled-gen12-rc-ccs-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-y-tiled-modifier:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_plane@pixel-format-y-tiled-modifier.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7283">Intel XE#7283</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5854">Intel XE#5854</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-5@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8395">Intel XE#8395</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_pm_dc@dc3co-vpb-simulation@psr2-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8396">Intel XE#8396</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@kms_pm_rpm@dpms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7383">Intel XE#7383</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@package-g7:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_pm_rpm@package-g7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6813">Intel XE#6813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7304">Intel XE#7304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_psr@fbc-pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render@edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@kms_psr@fbc-psr2-primary-render@edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4609">Intel XE#4609</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7345">Intel XE#7345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5813">Intel XE#5813</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@kms_setmode@clone-exclusive-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9142">Intel XE#9142</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@pf-unbind-with-vf-probed:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@sriov_basic@pf-unbind-with-vf-probed.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8866">Intel XE#8866</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_cw_post_sync@walker-post-sync:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@xe_cw_post_sync@walker-post-sync.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8608">Intel XE#8608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_evict@evict-beng-mixed-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-virtual-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_exec_balancer@many-cm-virtual-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@atomic-many:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-bmg-3/igt@xe_exec_fault_mode@atomic-many.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@xe_exec_fault_mode@atomic-many.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8578">Intel XE#8578</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_exec_fault_mode@once-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8374">Intel XE#8374</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-3/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@xe_exec_multi_queue@max-queues-preempt-mode-fault-basic-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-multi-queue-close-fd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_exec_reset@cm-multi-queue-close-fd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8369">Intel XE#8369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-stress-reset-destroy-vm-context:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-bmg-9/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-5/igt@xe_exec_reset@gt-stress-reset-destroy-vm-context.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8652">Intel XE#8652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@xe_exec_threads@threads-multi-queue-cm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-lnl-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-4/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6652">Intel XE#6652</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-atomic-op-prefetch:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-3/igt@xe_multigpu_svm@mgpu-atomic-op-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_multigpu_svm@mgpu-xgpu-access-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@l2-flush-opt-svm-pat-restrict:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@xe_pat@l2-flush-opt-svm-pat-restrict.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7590">Intel XE#7590</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7772">Intel XE#7772</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_pm@s3-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7369">Intel XE#7369</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-ptl-6/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-ptl-3/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@aspm_link_residency:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_pm_residency@aspm_link_residency.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7271">Intel XE#7271</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-bmg-4/igt@xe_pm_residency@gt-c6-freeze@gt0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-1/igt@xe_pm_residency@gt-c6-freeze@gt0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9254">Intel XE#9254</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_prefetch_fault@prefetch-fault:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@xe_prefetch_fault@prefetch-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7599">Intel XE#7599</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vfs-parallel:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_sriov_flr@flr-vfs-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4273">Intel XE#4273</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@xe_sriov_scheduling@nonpreempt-engine-resets-low-priority.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8339">Intel XE#8339</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-array-enobufs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_vm@bind-array-enobufs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9424">Intel XE#9424</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@out-of-memory:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-2/igt@xe_vm@out-of-memory.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5745">Intel XE#5745</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7892">Intel XE#7892</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6819">Intel XE#6819</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-6/igt@xe_fault_injection@exec-queue-create-fail-xe_exec_queue_create.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-bmg-10/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9463">Intel XE#9463</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-3/igt@xe_fault_injection@exec-queue-create-fail-xe_hw_engine_group_add_exec_queue.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-lnl-5/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-8/igt@xe_pm@s4-exec-after.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-lnl-7/igt@xe_pm@s4-mocs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-lnl-4/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-2/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-177300v4/shard-bmg-2/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d -&gt; xe-pw-177300v4</li>
</ul>
<p>IGT_9177: 9177<br />
  xe-6063-e19b5ed0ad912bb15fa5826fdc746f739e39650d: e19b5ed0ad912bb15fa5826fdc746f739e39650d<br />
  xe-pw-177300v4: 177300v4</p>

</body>
</html>

--===============7006341393899786386==--
