Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B3F5606A31A
	for <intel-xe@archiver.kernel.org>; Fri, 30 Oct 2026 00:54:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2CF781125BC;
	Fri, 30 Oct 2026 00:54:09 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4FC8A10E68C;
 Fri, 30 Oct 2026 00:54:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1930970572891133057=="
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_Add_CPER_logging_support_f?=
 =?utf-8?q?or_CRI_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 30 Oct 2026 00:54:07 -0000
Message-ID: <179332164731.91121.12837581560862293823@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261029113653.1860286-12-badal.nilawar@intel.com>
In-Reply-To: <20261029113653.1860286-12-badal.nilawar@intel.com>
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

--===============1930970572891133057==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add CPER logging support for CRI (rev8)
URL   : https://patchwork.freedesktop.org/series/169692/
State : success

== Summary ==

CI Bug Log - changes from xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a_FULL -> xe-pw-169692v8_FULL
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

  Here are the changes found in xe-pw-169692v8_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][1] ([Intel XE#5901])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-ptl:          NOTRUN -> [SKIP][2] ([Intel XE#7085])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-ptl:          NOTRUN -> [SKIP][3] ([Intel XE#5851])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
    - shard-lnl:          NOTRUN -> [SKIP][4] ([Intel XE#1477] / [Intel XE#7361])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          NOTRUN -> [SKIP][5] ([Intel XE#1124])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-ptl:          NOTRUN -> [SKIP][6] ([Intel XE#5808])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:
    - shard-ptl:          NOTRUN -> [SKIP][7] ([Intel XE#5822])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][8] ([Intel XE#3432])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-1:
    - shard-bmg:          NOTRUN -> [SKIP][9] ([Intel XE#2652]) +3 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#2887])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-ptl:          NOTRUN -> [SKIP][11] ([Intel XE#2252]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][12] ([Intel XE#373])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4:
    - shard-lnl:          NOTRUN -> [SKIP][13] ([Intel XE#6969]) +5 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4.html

  * igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4:
    - shard-ptl:          NOTRUN -> [SKIP][14] ([Intel XE#6969]) +7 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4.html

  * igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][15] ([Intel XE#3304] / [Intel XE#7374])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-6/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html

  * igt@kms_content_protection@dp-mst-type-0-hdcp14:
    - shard-ptl:          NOTRUN -> [SKIP][16] ([Intel XE#6974])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][17] ([Intel XE#1178] / [Intel XE#3304] / [Intel XE#7374]) +2 other tests fail
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@srm@pipe-a-dp-1:
    - shard-bmg:          NOTRUN -> [FAIL][18] ([Intel XE#3304])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-1.html

  * igt@kms_cursor_crc@cursor-offscreen-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][19] ([Intel XE#1424])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-32x10.html

  * igt@kms_cursor_crc@cursor-random-max-size:
    - shard-ptl:          NOTRUN -> [SKIP][20] ([Intel XE#5900]) +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@kms_cursor_crc@cursor-random-max-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-ptl:          NOTRUN -> [SKIP][21] ([Intel XE#5962])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#309] / [Intel XE#7343])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-ptl:          NOTRUN -> [SKIP][23] ([Intel XE#2316])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-plain-flip-ts-check@cd-dp2-hdmi-a3:
    - shard-bmg:          [PASS][24] -> [FAIL][25] ([Intel XE#3149] / [Intel XE#5408] / [Intel XE#6266]) +1 other test fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-10/igt@kms_flip@2x-plain-flip-ts-check@cd-dp2-hdmi-a3.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-9/igt@kms_flip@2x-plain-flip-ts-check@cd-dp2-hdmi-a3.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-ptl:          NOTRUN -> [SKIP][26] ([Intel XE#7178])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][27] ([Intel XE#7178] / [Intel XE#7349])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-ptl:          NOTRUN -> [SKIP][28] ([Intel XE#5800] / [Intel XE#6312])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#6312] / [Intel XE#651])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          NOTRUN -> [SKIP][30] ([Intel XE#2311]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrshdr-slowdraw:
    - shard-ptl:          NOTRUN -> [SKIP][31] ([Intel XE#6312])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@kms_frontbuffer_tracking@drrshdr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][32] ([Intel XE#5812]) +7 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html
    - shard-lnl:          NOTRUN -> [SKIP][33] ([Intel XE#656] / [Intel XE#7905]) +2 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][34] ([Intel XE#4141])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-ptl:          NOTRUN -> [SKIP][35] ([Intel XE#7865])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
    - shard-lnl:          NOTRUN -> [SKIP][36] ([Intel XE#7865])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][37] ([Intel XE#7905]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#7061])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-5/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:
    - shard-ptl:          NOTRUN -> [SKIP][39] ([Intel XE#6886]) +4 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#2763] / [Intel XE#6886]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html

  * igt@kms_psr@pr-no-drrs:
    - shard-ptl:          NOTRUN -> [SKIP][41] ([Intel XE#1406])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@kms_psr@pr-no-drrs.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-ptl:          NOTRUN -> [SKIP][42] ([Intel XE#5821])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html
    - shard-lnl:          NOTRUN -> [SKIP][43] ([Intel XE#3904] / [Intel XE#7342])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@xe_ccs@vm-bind-fault-mode-decompress:
    - shard-ptl:          NOTRUN -> [SKIP][44] ([Intel XE#7644])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@xe_ccs@vm-bind-fault-mode-decompress.html

  * igt@xe_evict@evict-large-external:
    - shard-ptl:          NOTRUN -> [SKIP][45] ([Intel XE#5764]) +1 other test skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@xe_evict@evict-large-external.html
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#6540] / [Intel XE#688]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@xe_evict@evict-large-external.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][47] -> [INCOMPLETE][48] ([Intel XE#6321] / [Intel XE#8355])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@no-exec-parallel-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][49] ([Intel XE#7482])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@xe_exec_balancer@no-exec-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2322] / [Intel XE#7372]) +1 other test skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1392])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-ptl:          NOTRUN -> [SKIP][52] ([Intel XE#5575] / [Intel XE#7484]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem:
    - shard-ptl:          NOTRUN -> [SKIP][53] ([Intel XE#8364]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem.html

  * igt@xe_exec_multi_queue@max-queues-priority-smem:
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#8364])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@xe_exec_multi_queue@max-queues-priority-smem.html

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:
    - shard-ptl:          NOTRUN -> [SKIP][55] ([Intel XE#6196])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#6196])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html

  * igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#8378])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-multi-queue-userptr-rebind:
    - shard-ptl:          NOTRUN -> [SKIP][58] ([Intel XE#8378]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@xe_exec_threads@threads-multi-queue-userptr-rebind.html
    - shard-lnl:          NOTRUN -> [SKIP][59] ([Intel XE#8378])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-userptr-rebind.html

  * igt@xe_multigpu_svm@mgpu-xgpu-access-basic:
    - shard-ptl:          NOTRUN -> [SKIP][60] ([Intel XE#6964])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#6964])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html

  * igt@xe_pm@d3cold-basic:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#2284] / [Intel XE#366] / [Intel XE#7370])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@xe_pm@d3cold-basic.html
    - shard-ptl:          NOTRUN -> [SKIP][63] ([Intel XE#5741])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-ptl:          [PASS][64] -> [ABORT][65] ([Intel XE#9362])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-ptl-8/igt@xe_pm@s4-mocs.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-5/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][66] -> [ABORT][67] ([Intel XE#9362])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_vm@overcommit-nonfault-vram-lr-defer:
    - shard-ptl:          NOTRUN -> [SKIP][68] ([Intel XE#9597])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html

  
#### Possible fixes ####

  * igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:
    - shard-bmg:          [SKIP][69] ([Intel XE#367]) -> [PASS][70]
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [FAIL][71] ([Intel XE#301]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][73] ([Intel XE#8399]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@xe_pm@s4-basic:
    - shard-lnl:          [ABORT][75] ([Intel XE#9362]) -> [PASS][76] +1 other test pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-4/igt@xe_pm@s4-basic.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-basic-exec:
    - shard-ptl:          [ABORT][77] ([Intel XE#9362]) -> [PASS][78] +1 other test pass
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-ptl-8/igt@xe_pm@s4-basic-exec.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@xe_pm@s4-basic-exec.html

  
#### Warnings ####

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][79] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][80] ([Intel XE#3544])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [SKIP][81] ([Intel XE#2426] / [Intel XE#5848]) -> [FAIL][82] ([Intel XE#1729] / [Intel XE#7424])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_pm@s4-basic:
    - shard-ptl:          [ABORT][83] ([Intel XE#9362]) -> [DMESG-WARN][84] ([Intel XE#7727])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-ptl-2/igt@xe_pm@s4-basic.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@xe_pm@s4-basic.html

  
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#5408]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408
  [Intel XE#5575]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575
  [Intel XE#5741]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741
  [Intel XE#5764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764
  [Intel XE#5800]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800
  [Intel XE#5808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808
  [Intel XE#5812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812
  [Intel XE#5821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821
  [Intel XE#5822]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822
  [Intel XE#5848]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848
  [Intel XE#5851]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851
  [Intel XE#5900]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900
  [Intel XE#5901]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901
  [Intel XE#5962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962
  [Intel XE#6196]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196
  [Intel XE#6266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266
  [Intel XE#6312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312
  [Intel XE#6321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#6540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#6886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886
  [Intel XE#6964]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964
  [Intel XE#6969]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969
  [Intel XE#6974]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974
  [Intel XE#7061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061
  [Intel XE#7085]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085
  [Intel XE#7178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178
  [Intel XE#7342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7349]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349
  [Intel XE#7361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361
  [Intel XE#7370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370
  [Intel XE#7372]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372
  [Intel XE#7374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374
  [Intel XE#7424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424
  [Intel XE#7482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482
  [Intel XE#7484]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484
  [Intel XE#7644]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644
  [Intel XE#7727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727
  [Intel XE#7865]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865
  [Intel XE#7905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905
  [Intel XE#8355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355
  [Intel XE#8364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364
  [Intel XE#8378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378
  [Intel XE#8399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399
  [Intel XE#9362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362
  [Intel XE#9597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597


Build changes
-------------

  * Linux: xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a -> xe-pw-169692v8

  IGT_9170: 9170
  xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a: da8074467a69dce9a0dd59602875f5c54874c92a
  xe-pw-169692v8: 169692v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/index.html

--===============1930970572891133057==
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
<tr><td><b>Series:</b></td><td>Add CPER logging support for CRI (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169692/">https://patchwork.freedesktop.org/series/169692/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a_FULL -&gt; xe-pw-169692v8_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-169692v8_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5901">Intel XE#5901</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7085">Intel XE#7085</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5851">Intel XE#5851</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7361">Intel XE#7361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5808">Intel XE#5808</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5822">Intel XE#5822</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-7/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs@pipe-b-dp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-5/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-a-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_color_pipeline@plane-lut1d-post-ctm3x4@pipe-d-plane-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6969">Intel XE#6969</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-6/igt@kms_content_protection@atomic-dpms-hdcp14@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0-hdcp14:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@kms_content_protection@dp-mst-type-0-hdcp14.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6974">Intel XE#6974</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-4/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7374">Intel XE#7374</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-7/igt@kms_content_protection@srm@pipe-a-dp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3304">Intel XE#3304</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-max-size:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@kms_cursor_crc@cursor-random-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5900">Intel XE#5900</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5962">Intel XE#5962</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-10/igt@kms_flip@2x-plain-flip-ts-check@cd-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-9/igt@kms_flip@2x-plain-flip-ts-check@cd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5408">Intel XE#5408</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6266">Intel XE#6266</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7178">Intel XE#7178</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7349">Intel XE#7349</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5800">Intel XE#5800</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrshdr-slowdraw:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@kms_frontbuffer_tracking@drrshdr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6312">Intel XE#6312</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5812">Intel XE#5812</a>) +7 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_frontbuffer_tracking@fbcpsrhdr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7865">Intel XE#7865</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@kms_frontbuffer_tracking@hdr-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7905">Intel XE#7905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-5/igt@kms_frontbuffer_tracking@hdr-argb161616f-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7061">Intel XE#7061</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +4 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-5-upscale-20x20@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6886">Intel XE#6886</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-no-drrs:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@kms_psr@pr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5821">Intel XE#5821</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904">Intel XE#3904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7342">Intel XE#7342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@vm-bind-fault-mode-decompress:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@xe_ccs@vm-bind-fault-mode-decompress.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7644">Intel XE#7644</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@xe_evict@evict-large-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5764">Intel XE#5764</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@xe_evict@evict-large-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6540">Intel XE#6540</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-6/igt@xe_evict@evict-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6321">Intel XE#6321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8355">Intel XE#8355</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@xe_exec_balancer@no-exec-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7482">Intel XE#7482</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7372">Intel XE#7372</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5575">Intel XE#5575</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7484">Intel XE#7484</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@xe_exec_multi_queue@many-execs-preempt-mode-fault-close-fd-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_multi_queue@max-queues-priority-smem:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@xe_exec_multi_queue@max-queues-priority-smem.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8364">Intel XE#8364</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-wt-single-vma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6196">Intel XE#6196</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-5/igt@xe_exec_threads@threads-multi-queue-cm-fd-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-multi-queue-userptr-rebind:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@xe_exec_threads@threads-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@xe_exec_threads@threads-multi-queue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8378">Intel XE#8378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_multigpu_svm@mgpu-xgpu-access-basic:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-7/igt@xe_multigpu_svm@mgpu-xgpu-access-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6964">Intel XE#6964</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7370">Intel XE#7370</a>)</li>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5741">Intel XE#5741</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-ptl-8/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-5/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-7/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@overcommit-nonfault-vram-lr-defer:</p>
<ul>
<li>shard-ptl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@xe_vm@overcommit-nonfault-vram-lr-defer.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9597">Intel XE#9597</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-target-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-1/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-7/igt@kms_bw@linear-tiling-1-displays-target-3840x2160p.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-4/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-4/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8399">Intel XE#8399</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-lnl-4/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-lnl-2/igt@xe_pm@s4-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-ptl-8/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-7/igt@xe_pm@s4-basic-exec.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-6/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-4/igt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-bmg-8/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5848">Intel XE#5848</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7424">Intel XE#7424</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-ptl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a/shard-ptl-2/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/9362">Intel XE#9362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169692v8/shard-ptl-1/igt@xe_pm@s4-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/7727">Intel XE#7727</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a -&gt; xe-pw-169692v8</li>
</ul>
<p>IGT_9170: 9170<br />
  xe-6030-da8074467a69dce9a0dd59602875f5c54874c92a: da8074467a69dce9a0dd59602875f5c54874c92a<br />
  xe-pw-169692v8: 169692v8</p>

</body>
</html>

--===============1930970572891133057==--
