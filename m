Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62027CA0EFA
	for <intel-xe@archiver.kernel.org>; Sat, 23 Aug 2025 07:09:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F03C810E1B7;
	Sat, 23 Aug 2025 07:09:56 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FB8110E1AD;
 Sat, 23 Aug 2025 07:09:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7934266877755882116=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/i915/display=3A_handle?=
 =?utf-8?q?_return_value_in_intel=5Fsdvo=5Fenable=5Fhotplug?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sat, 23 Aug 2025 07:09:55 -0000
Message-ID: <175593299538.263030.14993387606895234150@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250822154327.109766-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20250822154327.109766-1-juhapekka.heikkila@gmail.com>
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

--===============7934266877755882116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: handle return value in intel_sdvo_enable_hotplug
URL   : https://patchwork.freedesktop.org/series/153362/
State : success

== Summary ==

CI Bug Log - changes from xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66_FULL -> xe-pw-153362v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-153362v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [PASS][1] -> [FAIL][2] ([Intel XE#911]) +7 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][3] -> [DMESG-FAIL][4] ([Intel XE#4543])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][5] ([Intel XE#787]) +167 other tests skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][6] -> [INCOMPLETE][7] ([Intel XE#3862]) +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-436/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#455] / [Intel XE#787]) +24 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][9] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][10] -> [INCOMPLETE][11] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][12] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][13] ([Intel XE#2705] / [Intel XE#4212])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][14] ([Intel XE#4416]) +3 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#373]) +1 other test skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][16] -> [SKIP][17] ([Intel XE#2291])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#4494] / [i915#3804])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a1:
    - shard-adlp:         [PASS][19] -> [DMESG-WARN][20] ([Intel XE#4543]) +2 other tests dmesg-warn
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-adlp-2/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a1.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-adlp-6/igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#301]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][23] ([Intel XE#651])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#653])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][25] -> [SKIP][26] ([Intel XE#1503])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-7/igt@kms_hdr@invalid-hdr.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][27] -> [DMESG-WARN][28] ([Intel XE#2953] / [Intel XE#4173]) +7 other tests dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-adlp-6/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-adlp-2/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:
    - shard-dg2-set2:     NOTRUN -> [FAIL][29] ([Intel XE#616]) +2 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-466/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#1489] / [Intel XE#5899]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][31] -> [SKIP][32] ([Intel XE#1392]) +8 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-adlp:         [PASS][33] -> [DMESG-WARN][34] ([Intel XE#3876])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-adlp-3/igt@xe_exec_reset@parallel-gt-reset.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-adlp-8/igt@xe_exec_reset@parallel-gt-reset.html
    - shard-dg2-set2:     [PASS][35] -> [DMESG-WARN][36] ([Intel XE#3876])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@many-stride-malloc-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#4915]) +7 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-434/igt@xe_exec_system_allocator@many-stride-malloc-race.html

  * igt@xe_exec_threads@threads-mixed-fd-rebind:
    - shard-adlp:         [PASS][38] -> [DMESG-FAIL][39] ([Intel XE#3876])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-adlp-3/igt@xe_exec_threads@threads-mixed-fd-rebind.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-adlp-8/igt@xe_exec_threads@threads-mixed-fd-rebind.html

  * igt@xe_pat@pat-index-xe2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#977])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-434/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][41] ([Intel XE#1173])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][42] ([Intel XE#4543]) -> [PASS][43] +1 other test pass
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-adlp-6/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-adlp:         [DMESG-WARN][44] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][45]
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-adlp-4/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-adlp-1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][46] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [PASS][47]
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][48] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [PASS][49]
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][50] ([Intel XE#5299]) -> [PASS][51]
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-8/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-bmg-1/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][52] ([Intel XE#2316]) -> [PASS][53] +2 other tests pass
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][54] ([Intel XE#4596]) -> [PASS][55]
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-none.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-bmg-1/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:
    - shard-dg2-set2:     [SKIP][56] ([Intel XE#1392]) -> [PASS][57] +6 other tests pass
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-bmg:          [FAIL][58] ([Intel XE#5536]) -> [PASS][59]
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-8/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-bmg-6/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_system_allocator@process-many-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][60] ([Intel XE#5536]) -> [PASS][61]
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-lnl-8/igt@xe_exec_system_allocator@process-many-new-bo-map-nomemset.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-lnl-4/igt@xe_exec_system_allocator@process-many-new-bo-map-nomemset.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:
    - shard-dg2-set2:     [DMESG-WARN][62] ([Intel XE#3876]) -> [PASS][63]
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-434/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.html

  
#### Warnings ####

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][64] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][65] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][66] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345]) -> [INCOMPLETE][67] ([Intel XE#2705] / [Intel XE#4212] / [Intel XE#4345])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][68] ([Intel XE#2312]) -> [SKIP][69] ([Intel XE#2311]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][70] ([Intel XE#2312]) -> [SKIP][71] ([Intel XE#5390])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][72] ([Intel XE#2311]) -> [SKIP][73] ([Intel XE#2312]) +3 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][74] ([Intel XE#2313]) -> [SKIP][75] ([Intel XE#2312]) +2 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][76] ([Intel XE#2312]) -> [SKIP][77] ([Intel XE#2313]) +3 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          [FAIL][78] ([Intel XE#1729]) -> [SKIP][79] ([Intel XE#2426])
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-5/igt@kms_tiled_display@basic-test-pattern.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-bmg-3/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-lnl:          [ABORT][80] ([Intel XE#4917] / [Intel XE#5466]) -> [INCOMPLETE][81] ([Intel XE#5466])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-lnl-8/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [SKIP][82] ([Intel XE#1061]) -> [FAIL][83] ([Intel XE#1173])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-432/igt@xe_peer2peer@write.html
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-436/igt@xe_peer2peer@write.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4494
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#5299]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5299
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466
  [Intel XE#5536]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5536
  [Intel XE#5899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [i915#3804]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/3804


Build changes
-------------

  * Linux: xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66 -> xe-pw-153362v1

  IGT_8504: 8504
  xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66: a9008af007ab96e23814e3248475e7a4f4aebe66
  xe-pw-153362v1: 153362v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/index.html

--===============7934266877755882116==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: handle return value in int=
el_sdvo_enable_hotplug</td></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/153362/">https://patchwork.freedesktop.org/series/153362/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-153362v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-153362v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3598-a9008af007ab96e23814e3248475e7a4f=
4aebe66_FULL -&gt; xe-pw-153362v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-153362v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-lnl-3/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">P=
ASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
3362v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-lin=
ear-atomic@pipe-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/911">Intel XE#911</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/sha=
rd-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-f=
lip.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153362v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y=
-tiled-gen12-rc-ccs-cc@pipe-b-dp-2.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +167 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-436/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg=
2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153362v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153362v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a>=
 / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Int=
el XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-432/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-466/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a=
> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">In=
tel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153362v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs-cc@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3=
113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
24">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153362v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a>=
)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153362v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153362v1/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-=
after-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-8/igt@kms_curs=
or_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-bmg-6/igt@kms_c=
ursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-6bpc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153362v1/shard-dg2-436/igt@kms_dither@fb-8bpc-vs-panel=
-6bpc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4494">Intel XE#4494</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/i915/kernel/-/issues/3804">i915#3804</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-adlp-2/igt@kms_fli=
p@flip-vs-absolute-wf_vblank@c-hdmi-a1.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-adlp-6/igt@kms_f=
lip@flip-vs-absolute-wf_vblank@c-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)=
 +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-lnl-2/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-lnl-2/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153362v1/shard-dg2-434/igt@kms_frontbuffer_tracking@dr=
rs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153362v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fb=
cpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-7/igt@kms_hdr@=
invalid-hdr.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-153362v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Int=
el XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-adlp-6/igt@kms_pip=
e_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-adlp-2/i=
gt@kms_pipe_crc_basic@suspend-read-crc@pipe-a-hdmi-a-1.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Inte=
l XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4173">Intel XE#4173</a>) +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-6-size-256:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153362v1/shard-dg2-466/igt@kms_plane_cursor@primary@pi=
pe-a-hdmi-a-6-size-256.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153362v1/shard-dg2-434/igt@kms_psr2_sf@pr-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/5899">Intel XE#5899</a>=
) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-432/igt@x=
e_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-adlp-3/igt@xe_exec=
_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-adlp-8/igt@xe_exec_reset@paral=
lel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-433/igt@xe_exe=
c_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-433/igt@xe_exec_reset@par=
allel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@many-stride-malloc-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153362v1/shard-dg2-434/igt@xe_exec_system_allocator@ma=
ny-stride-malloc-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-adlp-3/igt@xe_exec=
_threads@threads-mixed-fd-rebind.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-adlp-8/igt@xe_exec_thr=
eads@threads-mixed-fd-rebind.html">DMESG-FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153362v1/shard-dg2-434/igt@xe_pat@pat-index-xe2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/97=
7">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-153362v1/shard-dg2-436/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-adlp-6/igt@kms_asy=
nc_flips@async-flip-suspend-resume@pipe-c-hdmi-a-1.html">DMESG-WARN</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE=
#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-153362v1/shard-adlp-8/igt@kms_async_flips@async-flip-suspend-resume@pipe-c=
-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-adlp-4/igt@kms_big=
_fb@y-tiled-32bpp-rotate-180.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v=
1/shard-adlp-1/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-463/igt@kms=
_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel =
XE#1727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3113">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-436/igt@kms_ccs@random-cc=
s-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-8/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/5299">Intel XE#5299</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-bmg-1/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-6/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-bmg-1/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-bmg-1/igt@kms_p=
lane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-no-exec-null-defer-bind.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-=
dg2-436/igt@xe_exec_basic@multigpu-no-exec-null-defer-bind.html">PASS</a> +=
6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-8/igt@xe_exec_=
compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html">FAIL</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5536">Intel X=
E#5536</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-153362v1/shard-bmg-6/igt@xe_exec_compute_mode@many-execqueues-bindexecque=
ue-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-new-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-lnl-8/igt@xe_exec_=
system_allocator@process-many-new-bo-map-nomemset.html">FAIL</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5536">Intel XE#5536=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1533=
62v1/shard-lnl-4/igt@xe_exec_system_allocator@process-many-new-bo-map-nomem=
set.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-434/igt@xe_exe=
c_threads@threads-hang-fd-userptr-invalidate.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1533=
62v1/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate.h=
tml">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-466/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-463/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a>) -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-436/igt@kms_ccs@random-ccs-=
data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel X=
E#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#231=
2</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153=
362v1/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2311">Intel XE#2311</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1533=
62v1/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#=
2311</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
153362v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2312">Intel XE#2312</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v=
1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
53362v1/shard-bmg-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-cur-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2313">Intel XE#2313</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-bmg-5/igt@kms_tile=
d_display@basic-test-pattern.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-bmg-3/igt@km=
s_tiled_display@basic-test-pattern.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-lnl-8/igt@xe_fault=
_injection@probe-fail-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5466">Inte=
l XE#5466</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-153362v1/shard-lnl-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_s=
end_recv.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/5466">Intel XE#5466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66/shard-dg2-432/igt@xe_pee=
r2peer@write.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/1061">Intel XE#1061</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-153362v1/shard-dg2-436/igt@xe_peer2peer@wri=
te.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1173">Intel XE#1173</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66 -&gt; xe-pw-153=
362v1</li>
</ul>
<p>IGT_8504: 8504<br />
  xe-3598-a9008af007ab96e23814e3248475e7a4f4aebe66: a9008af007ab96e23814e32=
48475e7a4f4aebe66<br />
  xe-pw-153362v1: 153362v1</p>

</body>
</html>

--===============7934266877755882116==--
