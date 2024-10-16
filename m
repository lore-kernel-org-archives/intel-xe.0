Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 229A7D2A555
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 20:02:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3EFD10E191;
	Wed, 16 Oct 2024 20:02:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0DD8E10E76D;
 Wed, 16 Oct 2024 20:02:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6623670618280134245=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EFULL=3A_success_for_locking/ww=5Fmutex=3A_Adjust_to?=
 =?utf-8?q?_lockdep_nest=5Flock_requirements_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Oct 2024 20:02:29 -0000
Message-ID: <172910894904.1275637.13583336294093944660@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241016070554.2888-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20241016070554.2888-1-thomas.hellstrom@linux.intel.com>
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

--===============6623670618280134245==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: locking/ww_mutex: Adjust to lockdep nest_lock requirements (rev5)
URL   : https://patchwork.freedesktop.org/series/123522/
State : success

== Summary ==

CI Bug Log - changes from xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557_full -> xe-pw-123522v5_full
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-123522v5_full:

### IGT changes ###

#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_chamelium_hpd@vga-hpd:
    - {shard-bmg}:        [SKIP][1] ([Intel XE#2252]) -> [SKIP][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - {shard-bmg}:        [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - {shard-bmg}:        [SKIP][5] ([Intel XE#2763]) -> [SKIP][6] +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_sequence@get-idle:
    - {shard-bmg}:        [PASS][7] -> [SKIP][8] +6 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-8/igt@kms_sequence@get-idle.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-5/igt@kms_sequence@get-idle.html

  
Known issues
------------

  Here are the changes found in xe-pw-123522v5_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#623])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#1701]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][12] ([Intel XE#1426]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - shard-dg2-set2:     [PASS][13] -> [DMESG-WARN][14] ([Intel XE#877])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][15] ([Intel XE#877])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1407])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#316]) +3 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [PASS][18] -> [FAIL][19] ([Intel XE#1874]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][20] -> [DMESG-FAIL][21] ([Intel XE#324]) +2 other tests dmesg-fail
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][22] -> [FAIL][23] ([Intel XE#1231]) +1 other test fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][24] ([Intel XE#1124]) +1 other test skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][25] ([Intel XE#1477])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1124]) +8 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1124]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#367]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2191])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][30] ([Intel XE#1512])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#787]) +76 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#787]) +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][35] ([Intel XE#2887]) +3 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][36] -> [INCOMPLETE][37] ([Intel XE#1195])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][38] -> [INCOMPLETE][39] ([Intel XE#1195] / [Intel XE#1727])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][40] -> [INCOMPLETE][41] ([Intel XE#1195] / [Intel XE#3113])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html

  * igt@kms_chamelium_audio@hdmi-audio-edid:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#373]) +1 other test skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-4/igt@kms_chamelium_audio@hdmi-audio-edid.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#306])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-change-during-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#373]) +10 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html

  * igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#373]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html

  * igt@kms_color@ctm-0-25@pipe-b-edp-1:
    - shard-lnl:          [PASS][46] -> [DMESG-WARN][47] ([Intel XE#2929]) +1 other test dmesg-warn
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@kms_color@ctm-0-25@pipe-b-edp-1.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-2/igt@kms_color@ctm-0-25@pipe-b-edp-1.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#307])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#1178]) +3 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-432/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     NOTRUN -> [FAIL][50] ([Intel XE#1188]) +1 other test fail
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-offscreen-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][51] ([Intel XE#1424])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#308]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_edge_walk@64x64-top-edge:
    - shard-lnl:          [PASS][53] -> [FAIL][54] ([Intel XE#3106]) +1 other test fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-1/igt@kms_cursor_edge_walk@64x64-top-edge.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-7/igt@kms_cursor_edge_walk@64x64-top-edge.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#309])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#309])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@flip-vs-cursor-varying-size:
    - shard-lnl:          [PASS][57] -> [FAIL][58] ([Intel XE#1475])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#323])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#3070])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][61] ([Intel XE#701])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_feature_discovery@chamelium.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#310]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][63] -> [FAIL][64] ([Intel XE#301])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1421]) +2 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][66] -> [DMESG-WARN][67] ([Intel XE#2953]) +2 other tests dmesg-warn
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1401] / [Intel XE#1745])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1401])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@force-edid:
    - shard-lnl:          NOTRUN -> [SKIP][70] ([Intel XE#352])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-6/igt@kms_force_connector_basic@force-edid.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#651]) +5 other tests skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#651]) +24 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [PASS][73] -> [FAIL][74] ([Intel XE#1861])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#656]) +13 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#653]) +18 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@pipe-fbc-rte:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#455]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][78] ([Intel XE#656]) +4 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [PASS][79] -> [DMESG-FAIL][80] ([Intel XE#324]) +5 other tests dmesg-fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_plane@plane-position-covered.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-4/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-4:
    - shard-lnl:          [PASS][81] -> [DMESG-WARN][82] ([Intel XE#324]) +4 other tests dmesg-warn
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:
    - shard-lnl:          NOTRUN -> [SKIP][83] ([Intel XE#2763]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][84] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#2763]) +2 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#870])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-dpms:
    - shard-lnl:          [PASS][87] -> [FAIL][88] ([Intel XE#718])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][89] ([Intel XE#908])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-adlp:         [PASS][90] -> [DMESG-WARN][91] ([Intel XE#1033] / [Intel XE#1727])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-8/igt@kms_pm_rpm@drm-resources-equal.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-9/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1489])
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1489]) +5 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#2893])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#1406])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-1/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@psr2-cursor-plane-move@edp-1:
    - shard-lnl:          [PASS][96] -> [FAIL][97] ([Intel XE#1649]) +1 other test fail
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-8/igt@kms_psr@psr2-cursor-plane-move@edp-1.html
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-5/igt@kms_psr@psr2-cursor-plane-move@edp-1.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#2850] / [Intel XE#929]) +10 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-464/igt@kms_psr@psr2-dpms.html
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#2850] / [Intel XE#929])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-9/igt@kms_psr@psr2-dpms.html

  * igt@kms_rotation_crc@sprite-rotation-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#327])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][101] ([Intel XE#1500])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [PASS][102] -> [FAIL][103] ([Intel XE#899])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          [PASS][104] -> [FAIL][105] ([Intel XE#2443]) +1 other test fail
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_vrr@flip-basic-fastset.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-2/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     NOTRUN -> [SKIP][106] ([Intel XE#455]) +19 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-434/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][107] ([Intel XE#756])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][108] ([Intel XE#1123]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1123])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-3/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#2905]) +7 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#2905])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-lnl:          NOTRUN -> [SKIP][112] ([Intel XE#2905]) +2 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-3/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-lnl:          NOTRUN -> [SKIP][113] ([Intel XE#688]) +2 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-2/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-small-multi-vm:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#261] / [Intel XE#688])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@xe_evict@evict-small-multi-vm.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1392]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue:
    - shard-lnl:          NOTRUN -> [SKIP][116] ([Intel XE#1392]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#288]) +15 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#288]) +2 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2360]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     NOTRUN -> [TIMEOUT][120] ([Intel XE#2105])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-lnl:          [PASS][121] -> [SKIP][122] ([Intel XE#1192])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-6/igt@xe_live_ktest@xe_dma_buf.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-6/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#2229])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     NOTRUN -> [FAIL][124] ([Intel XE#1999]) +2 other tests fail
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#2541]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html
    - shard-adlp:         NOTRUN -> [SKIP][126] ([Intel XE#2541])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-3/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#979])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][128] ([Intel XE#1173]) +1 other test fail
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#2284] / [Intel XE#366])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s2idle-vm-bind-userptr:
    - shard-dg2-set2:     [PASS][130] -> [ABORT][131] ([Intel XE#1694] / [Intel XE#1794])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-userptr.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [ABORT][132] ([Intel XE#1358] / [Intel XE#1794])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     [PASS][133] -> [ABORT][134] ([Intel XE#1358] / [Intel XE#1794])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@xe_pm@s4-basic-exec.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-432/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-dg2-set2:     [PASS][135] -> [ABORT][136] ([Intel XE#1794])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-466/igt@xe_pm@s4-vm-bind-prefetch.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-432/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][137] -> [ABORT][138] ([Intel XE#1794])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#579])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-config:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#944])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-3/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#944]) +3 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@query-invalid-size:
    - shard-adlp:         [PASS][142] -> [TIMEOUT][143] ([Intel XE#1033] / [Intel XE#1727]) +1 other test timeout
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@xe_query@query-invalid-size.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@xe_query@query-invalid-size.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@invalid-get-prop-any:
    - {shard-bmg}:        [SKIP][144] -> [PASS][145] +2 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-2/igt@kms_addfb_basic@invalid-get-prop-any.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-5/igt@kms_addfb_basic@invalid-get-prop-any.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][146] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][147]
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][148] ([Intel XE#1231]) -> [PASS][149]
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][150] ([Intel XE#1204]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_cursor_edge_walk@128x128-left-edge:
    - shard-adlp:         [DMESG-WARN][152] -> [PASS][153] +2 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_cursor_edge_walk@128x128-left-edge.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-3/igt@kms_cursor_edge_walk@128x128-left-edge.html

  * igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1:
    - shard-lnl:          [FAIL][154] -> [PASS][155] +2 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-8/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-5/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - {shard-bmg}:        [INCOMPLETE][156] -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - {shard-bmg}:        [DMESG-WARN][158] ([Intel XE#2791] / [Intel XE#877]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - {shard-bmg}:        [SKIP][160] ([Intel XE#3007]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-1/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:
    - {shard-bmg}:        [FAIL][162] ([Intel XE#301]) -> [PASS][163] +2 other tests pass
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:
    - {shard-bmg}:        [FAIL][164] -> [PASS][165] +1 other test pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][166] ([Intel XE#2882]) -> [PASS][167] +2 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-adlp:         [FAIL][168] -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:
    - shard-lnl:          [FAIL][170] ([Intel XE#886]) -> [PASS][171] +6 other tests pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][172] ([Intel XE#301]) -> [PASS][173] +7 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:
    - shard-dg2-set2:     [FAIL][174] ([Intel XE#1204]) -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][176] ([Intel XE#2953]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][178] ([Intel XE#324]) -> [PASS][179] +2 other tests pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:
    - shard-adlp:         [FAIL][180] ([Intel XE#1874]) -> [PASS][181] +2 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         [FAIL][182] ([Intel XE#1861]) -> [PASS][183] +3 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-1:
    - shard-lnl:          [DMESG-FAIL][184] ([Intel XE#324]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:
    - {shard-bmg}:        [INCOMPLETE][186] ([Intel XE#2566]) -> [PASS][187] +1 other test pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html

  * igt@kms_pm_rpm@universal-planes-dpms:
    - {shard-bmg}:        [SKIP][188] ([Intel XE#2446]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-7/igt@kms_pm_rpm@universal-planes-dpms.html
    - shard-lnl:          [INCOMPLETE][190] ([Intel XE#1620] / [Intel XE#2864]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms.html

  * igt@kms_pm_rpm@universal-planes-dpms@plane-68:
    - shard-lnl:          [DMESG-FAIL][192] ([Intel XE#1620]) -> [PASS][193] +1 other test pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html

  * igt@kms_psr@psr2-cursor-blt@edp-1:
    - shard-lnl:          [FAIL][194] ([Intel XE#2948]) -> [PASS][195] +1 other test pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@kms_psr@psr2-cursor-blt@edp-1.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_psr@psr2-cursor-blt@edp-1.html

  * igt@kms_setmode@basic:
    - {shard-bmg}:        [FAIL][196] ([Intel XE#2883]) -> [PASS][197] +6 other tests pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-1/igt@kms_setmode@basic.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-5/igt@kms_setmode@basic.html
    - shard-adlp:         [FAIL][198] ([Intel XE#2883]) -> [PASS][199] +2 other tests pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-4/igt@kms_setmode@basic.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@kms_setmode@basic.html

  * igt@kms_setmode@basic@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][200] ([Intel XE#2883]) -> [PASS][201] +6 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html

  * igt@kms_setmode@basic@pipe-b-edp-1:
    - shard-lnl:          [FAIL][202] ([Intel XE#2883]) -> [PASS][203] +2 other tests pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][204] ([Intel XE#899]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@accuracy-idle:
    - shard-lnl:          [FAIL][206] ([Intel XE#1523]) -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-1/igt@kms_vblank@accuracy-idle.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-4/igt@kms_vblank@accuracy-idle.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [FAIL][208] ([Intel XE#2159]) -> [PASS][209] +1 other test pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - {shard-bmg}:        [SKIP][210] ([Intel XE#1130]) -> [PASS][211] +10 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-2/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-2/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - {shard-bmg}:        [TIMEOUT][212] ([Intel XE#1473]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [FAIL][214] ([Intel XE#1000]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - {shard-bmg}:        [TIMEOUT][216] ([Intel XE#1473] / [Intel XE#2472]) -> [PASS][217] +2 other tests pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - shard-adlp:         [TIMEOUT][218] -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-2/igt@xe_exec_threads@threads-mixed-basic.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-9/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_oa@oa-regs-whitelisted:
    - shard-lnl:          [FAIL][220] ([Intel XE#2514]) -> [PASS][221] +1 other test pass
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-6/igt@xe_oa@oa-regs-whitelisted.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted.html

  * igt@xe_oa@oa-regs-whitelisted@rcs-0:
    - {shard-bmg}:        [FAIL][222] ([Intel XE#2514]) -> [PASS][223] +1 other test pass
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-7/igt@xe_oa@oa-regs-whitelisted@rcs-0.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-1/igt@xe_oa@oa-regs-whitelisted@rcs-0.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-dg2-set2:     [ABORT][224] ([Intel XE#1694] / [Intel XE#1794]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-basic:
    - shard-dg2-set2:     [ABORT][226] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@xe_pm@s3-basic.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-434/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][228] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][230] ([Intel XE#1794]) -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [ABORT][232] ([Intel XE#2625]) -> [PASS][233] +3 other tests pass
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][234] ([Intel XE#958]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_big_fb@y-tiled-8bpp-rotate-90:
    - shard-adlp:         [SKIP][236] ([Intel XE#316]) -> [TIMEOUT][237] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][238] ([Intel XE#1231]) -> [DMESG-FAIL][239] ([Intel XE#324])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][240] ([Intel XE#324]) -> [FAIL][241] ([Intel XE#1231])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-adlp:         [SKIP][242] ([Intel XE#1124]) -> [TIMEOUT][243] ([Intel XE#1033] / [Intel XE#1727] / [Intel XE#402])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-adlp:         [FAIL][244] ([Intel XE#1861]) -> [TIMEOUT][245] ([Intel XE#1033] / [Intel XE#1727]) +1 other test timeout
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [SKIP][246] ([Intel XE#653]) -> [TIMEOUT][247] ([Intel XE#1033] / [Intel XE#1727])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1477]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1523]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1694]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2159]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2231
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2323
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2501
  [Intel XE#2514]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#2864]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2890]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2890
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3007]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#3070]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3106]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_8075 -> IGT_8076
  * Linux: xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557 -> xe-pw-123522v5

  IGT_8075: 8075
  IGT_8076: e511df10a1201d0d83c03ccbcabc3d57191e5f8e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557: 0bebd793802b4eae14c71400e833cda8f91b0557
  xe-pw-123522v5: 123522v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/index.html

--===============6623670618280134245==
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
<tr><td><b>Series:</b></td><td>locking/ww_mutex: Adjust to lockdep nest_lock requirements (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/123522/">https://patchwork.freedesktop.org/series/123522/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557_full -&gt; xe-pw-123522v5_full</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-123522v5_full:</p>
<h3>IGT changes</h3>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-5/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-4/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-5/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-idle:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-8/igt@kms_sequence@get-idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-5/igt@kms_sequence@get-idle.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-123522v5_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-436/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-6/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@kms_big_fb@linear-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@kms_big_fb@x-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-4/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1477">Intel XE#1477</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-8/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-3/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-3/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-433/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@hdmi-audio-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-4/igt@kms_chamelium_audio@hdmi-audio-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_chamelium_edid@dp-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-change-during-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-8/igt@kms_chamelium_edid@hdmi-edid-change-during-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-25@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@kms_color@ctm-0-25@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-2/igt@kms_color@ctm-0-25@pipe-b-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2929">Intel XE#2929</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-433/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-432/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-464/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-2/igt@kms_cursor_crc@cursor-offscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-edge:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-1/igt@kms_cursor_edge_walk@64x64-top-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-7/igt@kms_cursor_edge_walk@64x64-top-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3106">Intel XE#3106</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-5/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-5/igt@kms_cursor_legacy@flip-vs-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-433/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@kms_dp_linktrain_fallback@dp-fallback.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3070">Intel XE#3070</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank@ac-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-1/igt@kms_flip@2x-flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-3/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-edid:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-6/igt@kms_force_connector_basic@force-edid.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@pipe-fbc-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-9/igt@kms_frontbuffer_tracking@pipe-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_plane@plane-position-covered.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-4/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-4:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-4/igt@kms_plane@plane-position-covered@pipe-b-plane-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-6/igt@kms_pm_dc@dc5-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_pm_dc@dc5-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_pm_dc@dc6-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/908">Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-8/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-9/igt@kms_pm_rpm@drm-resources-equal.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@kms_psr2_sf@fbc-pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-433/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-4/igt@kms_psr2_sf@pr-primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-1/igt@kms_psr@pr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-8/igt@kms_psr@psr2-cursor-plane-move@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-5/igt@kms_psr@psr2-cursor-plane-move@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-464/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +10 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-9/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-433/igt@kms_rotation_crc@sprite-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-435/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_vrr@flip-basic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-2/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-434/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-464/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-435/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-3/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-vm-destroy-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-3/igt@xe_eudebug_online@single-step-one.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-2/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-multi-vm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@xe_evict@evict-small-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-7/igt@xe_exec_basic@multigpu-once-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@xe_exec_fault_mode@many-execqueues-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@xe_exec_fault_mode@once-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@xe_exec_mix_modes@exec-spinner-interrupted-dma-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-6/igt@xe_live_ktest@xe_dma_buf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-6/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-464/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-434/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-3/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-435/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-434/igt@xe_pm@s2idle-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-432/igt@xe_pm@s3-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@xe_pm@s4-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-432/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-466/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-432/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-464/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-3/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-invalid-size:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@xe_query@query-invalid-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@xe_query@query-invalid-size.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test timeout</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-get-prop-any:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-2/igt@kms_addfb_basic@invalid-get-prop-any.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-5/igt@kms_addfb_basic@invalid-get-prop-any.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-left-edge:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_cursor_edge_walk@128x128-left-edge.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-3/igt@kms_cursor_edge_walk@128x128-left-edge.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-8/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-5/igt@kms_cursor_edge_walk@256x256-top-bottom@pipe-a-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791">Intel XE#2791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3007">Intel XE#3007</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-1/igt@kms_flip@2x-dpms-vs-vblank-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-4/igt@kms_flip@2x-flip-vs-expired-vblank@ab-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race-interruptible:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-7/igt@kms_flip@2x-modeset-vs-vblank-race-interruptible.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible@ac-hdmi-a6-dp4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-2/igt@kms_flip@flip-vs-blocking-wf-vblank@c-edp1.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-3/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-y-to-x.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-6/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-3/igt@kms_plane@plane-position-hole@pipe-a-plane-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-8/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-7/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-b.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-2/igt@kms_pm_rpm@universal-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-7/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2864">Intel XE#2864</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@universal-planes-dpms@plane-68:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-3/igt@kms_pm_rpm@universal-planes-dpms@plane-68.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-3/igt@kms_psr@psr2-cursor-blt@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_psr@psr2-cursor-blt@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-1/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-5/igt@kms_setmode@basic.html">PASS</a> +6 other tests pass</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-4/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-463/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@kms_setmode@basic@pipe-a-hdmi-a-6.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-4/igt@kms_setmode@basic@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-5/igt@kms_setmode@basic@pipe-b-edp-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-8/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-1/igt@kms_vblank@accuracy-idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1523">Intel XE#1523</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-4/igt@kms_vblank@accuracy-idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-2/igt@kms_vrr@cmrr@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2159">Intel XE#2159</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-4/igt@kms_vrr@cmrr@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-2/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-2/igt@xe_copy_basic@mem-copy-linear-0x369.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-2/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-4/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-466/igt@xe_evict@evict-beng-mixed-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-2/igt@xe_exec_threads@threads-mixed-basic.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-9/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-6/igt@xe_oa@oa-regs-whitelisted.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-3/igt@xe_oa@oa-regs-whitelisted.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-regs-whitelisted@rcs-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-bmg-7/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2514">Intel XE#2514</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-bmg-1/igt@xe_oa@oa-regs-whitelisted@rcs-0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@xe_pm@s2idle-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1694">Intel XE#1694</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-436/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@xe_pm@s3-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-434/igt@xe_pm@s3-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-5/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-dg2-432/igt@xe_pm_residency@gt-c6-freeze.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-dg2-466/igt@xe_pm_residency@gt-c6-freeze.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-6/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-9/igt@kms_big_fb@y-tiled-8bpp-rotate-90.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-8/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-123522v5/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-render.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8075 -&gt; IGT_8076</li>
<li>Linux: xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557 -&gt; xe-pw-123522v5</li>
</ul>
<p>IGT_8075: 8075<br />
  IGT_8076: e511df10a1201d0d83c03ccbcabc3d57191e5f8e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2071-0bebd793802b4eae14c71400e833cda8f91b0557: 0bebd793802b4eae14c71400e833cda8f91b0557<br />
  xe-pw-123522v5: 123522v5</p>

</body>
</html>

--===============6623670618280134245==--
