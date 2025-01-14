Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE1EDE77188
	for <intel-xe@archiver.kernel.org>; Tue, 14 Jan 2025 10:42:55 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 77B128826D;
	Tue, 14 Jan 2025 10:42:55 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 642068826D;
 Tue, 14 Jan 2025 10:42:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1320980373269935596=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe/mmap=3A_Add_mmap_su?=
 =?utf-8?q?pport_for_PCI_memory_barrier_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 14 Jan 2025 10:42:54 -0000
Message-ID: <173685137439.3556027.14693686229724055782@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250113114201.3178806-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250113114201.3178806-1-tejas.upadhyay@intel.com>
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

--===============1320980373269935596==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/mmap: Add mmap support for PCI memory barrier (rev9)
URL   : https://patchwork.freedesktop.org/series/139769/
State : failure

== Summary ==

CI Bug Log - changes from xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab_full -> xe-pw-139769v9_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139769v9_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139769v9_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139769v9_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a3:
    - shard-bmg:          [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-4/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html

  * igt@kms_pipe_crc_basic@suspend-read-crc:
    - shard-dg2-set2:     [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2.html

  * igt@kms_vblank@wait-busy-hang:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][6] +1 other test incomplete
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_vblank@wait-busy-hang.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][7] +2 other tests incomplete
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-5/igt@xe_gt_freq@freq_reset_multiple.html

  
Known issues
------------

  Here are the changes found in xe-pw-139769v9_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         NOTRUN -> [ABORT][8] ([Intel XE#3914])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@core_hotunplug@hotreplug.html
    - shard-lnl:          NOTRUN -> [ABORT][9] ([Intel XE#3914])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@core_hotunplug@hotreplug.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][10] ([Intel XE#623])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][11] ([Intel XE#3767]) +23 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:
    - shard-bmg:          [PASS][12] -> [DMESG-WARN][13] ([Intel XE#877]) +3 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-2/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-1/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][14] -> [FAIL][15] ([Intel XE#3908]) +1 other test fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#316]) +3 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-lnl:          NOTRUN -> [SKIP][17] ([Intel XE#1407]) +1 other test skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-90:
    - shard-bmg:          NOTRUN -> [SKIP][18] ([Intel XE#2327]) +3 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][19] -> [DMESG-WARN][20] ([Intel XE#1033])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][21] ([Intel XE#1033])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html
    - shard-lnl:          NOTRUN -> [SKIP][22] ([Intel XE#1124])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-0:
    - shard-bmg:          NOTRUN -> [SKIP][23] ([Intel XE#1124]) +4 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][24] ([Intel XE#1124])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-bmg:          NOTRUN -> [SKIP][25] ([Intel XE#607])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][26] ([Intel XE#1124]) +3 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#2191])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#2191])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][29] ([Intel XE#367]) +3 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][30] ([Intel XE#2191]) +1 other test skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][31] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-bmg:          NOTRUN -> [SKIP][32] ([Intel XE#367])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][33] ([Intel XE#2887]) +7 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][34] ([Intel XE#787]) +167 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-bmg:          [PASS][35] -> [INCOMPLETE][36] ([Intel XE#3862]) +1 other test incomplete
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][37] ([Intel XE#3862])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][38] ([Intel XE#2907]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][39] -> [INCOMPLETE][40] ([Intel XE#1727] / [Intel XE#3124])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][41] -> [INCOMPLETE][42] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
    - shard-dg2-set2:     [PASS][44] -> [DMESG-WARN][45] ([Intel XE#1727])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#2887]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#787]) +5 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][48] -> [DMESG-WARN][49] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][50] ([Intel XE#2652] / [Intel XE#787]) +12 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#455] / [Intel XE#787]) +28 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_cdclk@mode-transition:
    - shard-bmg:          NOTRUN -> [SKIP][52] ([Intel XE#2724])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#314]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#306])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_chamelium_color@ctm-0-25.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-lnl:          NOTRUN -> [SKIP][55] ([Intel XE#306])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2325])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#373]) +3 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_edid@hdmi-edid-read:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#373]) +2 other tests skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_chamelium_edid@hdmi-edid-read.html

  * igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2252])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#373]) +2 other tests skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     NOTRUN -> [FAIL][61] ([Intel XE#1178]) +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][62] ([Intel XE#2390])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#308]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-32x10:
    - shard-bmg:          NOTRUN -> [SKIP][64] ([Intel XE#2320])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#1424])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-32x32.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#2291]) +4 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-lnl:          [PASS][68] -> [FAIL][69] ([Intel XE#1475])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#1508])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_dsc@dsc-with-bpc:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#2244])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_dsc@dsc-with-bpc.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:
    - shard-bmg:          [PASS][72] -> [FAIL][73] ([Intel XE#2882] / [Intel XE#3288])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][74] -> [FAIL][75] ([Intel XE#301]) +5 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip:
    - shard-bmg:          [PASS][76] -> [SKIP][77] ([Intel XE#2316]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-7/igt@kms_flip@2x-plain-flip.html
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [PASS][78] -> [FAIL][79] ([Intel XE#2882]) +1 other test fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][80] ([Intel XE#301])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][81] ([Intel XE#301] / [Intel XE#3321])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][82] ([Intel XE#2882])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@d-dp2:
    - shard-bmg:          NOTRUN -> [FAIL][83] ([Intel XE#3321])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-bmg:          [PASS][84] -> [DMESG-WARN][85] ([Intel XE#2955])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][86] ([Intel XE#2049] / [Intel XE#2597])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [PASS][87] -> [DMESG-WARN][88] ([Intel XE#2953]) +6 other tests dmesg-warn
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][89] ([Intel XE#2597])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-lnl:          [PASS][90] -> [FAIL][91] ([Intel XE#886]) +1 other test fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2293] / [Intel XE#2380]) +3 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#455]) +3 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html
    - shard-lnl:          NOTRUN -> [SKIP][94] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][95] ([Intel XE#2293]) +3 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1401]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#455]) +8 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#651]) +1 other test skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#2311]) +9 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][100] ([Intel XE#656]) +14 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [FAIL][101] ([Intel XE#2333]) +3 other tests fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#656]) +11 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#651]) +19 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][104] ([Intel XE#653]) +21 other tests skip
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#1158])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-rte:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#653]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2313]) +10 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [ABORT][108] ([Intel XE#4048])
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [PASS][109] -> [SKIP][110] ([Intel XE#1503])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-2/igt@kms_hdr@invalid-hdr.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-1/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@invalid-modeset-big-joiner:
    - shard-bmg:          NOTRUN -> [SKIP][111] ([Intel XE#346])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#346])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_joiner@invalid-modeset-big-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128:
    - shard-adlp:         NOTRUN -> [FAIL][113] ([Intel XE#1874]) +4 other tests fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-4/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2493]) +1 other test skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          [PASS][115] -> [SKIP][116] ([Intel XE#2571])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][117] -> [FAIL][118] ([Intel XE#361])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#2763] / [Intel XE#455]) +1 other test skip
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#2763]) +2 other tests skip
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2763]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html
    - shard-bmg:          NOTRUN -> [SKIP][123] ([Intel XE#2763])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][124] ([Intel XE#2763]) +7 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1129])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_lpsp@kms-lpsp:
    - shard-bmg:          NOTRUN -> [SKIP][126] ([Intel XE#2499])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html

  * igt@kms_properties@crtc-properties-legacy:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][127] ([Intel XE#2594])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_properties@crtc-properties-legacy.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          NOTRUN -> [SKIP][128] ([Intel XE#2893])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#1489]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][130] ([Intel XE#1489]) +1 other test skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][131] ([Intel XE#1489]) +7 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2387])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#1122])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-pr-sprite-plane-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][134] ([Intel XE#1406])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr-sprite-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#2850] / [Intel XE#929]) +9 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-render.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-bmg:          NOTRUN -> [SKIP][136] ([Intel XE#2234] / [Intel XE#2850]) +5 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@pr-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-4/igt@kms_psr@pr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#2414])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][139] ([Intel XE#2939])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#3414])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][141] -> [FAIL][142] ([Intel XE#771] / [Intel XE#899])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html
    - shard-bmg:          [PASS][143] -> [FAIL][144] ([Intel XE#899]) +1 other test fail
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-2/igt@kms_universal_plane@cursor-fb-leak.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-1/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][145] -> [FAIL][146] ([Intel XE#899])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html

  * igt@kms_vrr@flipline:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#1499])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_vrr@flipline.html

  * igt@kms_vrr@lobf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][148] ([Intel XE#2168])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_vrr@lobf.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#756])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#756])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-bmg:          NOTRUN -> [SKIP][151] ([Intel XE#1091] / [Intel XE#2849])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:
    - shard-dg2-set2:     [PASS][152] -> [ABORT][153] ([Intel XE#2625]) +2 other tests abort
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-433/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][154] ([Intel XE#1126])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_eudebug@basic-vm-access-parameters:
    - shard-dg2-set2:     NOTRUN -> [SKIP][155] ([Intel XE#2905]) +8 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-bmg:          NOTRUN -> [SKIP][156] ([Intel XE#3889])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-bmg:          NOTRUN -> [SKIP][157] ([Intel XE#2905]) +6 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_evict@evict-beng-large-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@xe_evict@evict-beng-large-external-cm.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#688]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][160] -> [TIMEOUT][161] ([Intel XE#1473] / [Intel XE#2472])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-bmg:          NOTRUN -> [TIMEOUT][162] ([Intel XE#1473])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-bmg:          NOTRUN -> [SKIP][163] ([Intel XE#2322]) +2 other tests skip
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][164] ([Intel XE#1392])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html
    - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#1392])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-dg2-set2:     [PASS][166] -> [SKIP][167] ([Intel XE#1392]) +3 other tests skip
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][168] ([Intel XE#288]) +13 other tests skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][169] ([Intel XE#288]) +1 other test skip
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@xe_exec_fault_mode@twice-userptr.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip:
    - shard-lnl:          NOTRUN -> [SKIP][170] ([Intel XE#2905])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@xe_exec_sip_eudebug@breakpoint-writesip.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#2541] / [Intel XE#3573]) +5 other tests skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@syncs-userptr-wait-cfg:
    - shard-adlp:         NOTRUN -> [SKIP][172] ([Intel XE#2541] / [Intel XE#3573]) +2 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@xe_oa@syncs-userptr-wait-cfg.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][173] ([Intel XE#2284])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s2idle-basic:
    - shard-dg2-set2:     [PASS][174] -> [ABORT][175] ([Intel XE#1358] / [Intel XE#1794]) +1 other test abort
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-433/igt@xe_pm@s2idle-basic.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-dg2-set2:     [PASS][176] -> [ABORT][177] ([Intel XE#1358])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-435/igt@xe_pm@s2idle-basic-exec.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#2284] / [Intel XE#366]) +1 other test skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s4-exec-after:
    - shard-lnl:          [PASS][179] -> [ABORT][180] ([Intel XE#1358] / [Intel XE#1607])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-7/igt@xe_pm@s4-exec-after.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@xe_pm@s4-exec-after.html

  * igt@xe_query@multigpu-query-config:
    - shard-bmg:          NOTRUN -> [SKIP][181] ([Intel XE#944])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@xe_query@multigpu-query-config.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#3342])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-bmg:          [FAIL][183] ([Intel XE#827]) -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [SKIP][185] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][186] +1 other test pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [INCOMPLETE][187] ([Intel XE#3862]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:
    - shard-lnl:          [INCOMPLETE][189] ([Intel XE#3862]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][191] ([Intel XE#1727]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][193] ([Intel XE#1727] / [Intel XE#3113]) -> [PASS][194]
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_color@ctm-green-to-red:
    - shard-bmg:          [DMESG-WARN][195] ([Intel XE#877]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-2/igt@kms_color@ctm-green-to-red.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-1/igt@kms_color@ctm-green-to-red.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][197] ([Intel XE#3321]) -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][199] ([Intel XE#301]) -> [PASS][200] +4 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [ABORT][201] ([Intel XE#2625]) -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-bmg:          [SKIP][203] ([Intel XE#2316]) -> [PASS][204]
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-bmg:          [FAIL][205] ([Intel XE#2882] / [Intel XE#3288]) -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:
    - shard-bmg:          [FAIL][207] ([Intel XE#3288] / [Intel XE#3321]) -> [PASS][208]
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html

  * igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:
    - shard-bmg:          [FAIL][209] ([Intel XE#3321]) -> [PASS][210] +1 other test pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-bmg:          [INCOMPLETE][211] ([Intel XE#2597]) -> [PASS][212]
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][213] ([Intel XE#2597] / [Intel XE#2635]) -> [PASS][214]
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html

  * igt@kms_flip@wf_vblank-ts-check@a-edp1:
    - shard-lnl:          [FAIL][215] ([Intel XE#886]) -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html

  * igt@kms_plane_cursor@primary:
    - shard-lnl:          [INCOMPLETE][217] -> [PASS][218] +2 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-2/igt@kms_plane_cursor@primary.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-1/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_lowres@tiling-none:
    - shard-bmg:          [INCOMPLETE][219] -> [PASS][220] +1 other test pass
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-4/igt@kms_plane_lowres@tiling-none.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_plane_lowres@tiling-none.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][221] ([Intel XE#361]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][223] ([Intel XE#899]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1392]) -> [PASS][226] +4 other tests pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_compute_mode@many-bindexecqueue-rebind:
    - shard-lnl:          [FAIL][227] -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_reset@close-execqueues-close-fd:
    - shard-lnl:          [DMESG-WARN][229] -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-7/igt@xe_exec_reset@close-execqueues-close-fd.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@xe_exec_reset@close-execqueues-close-fd.html

  * igt@xe_exec_threads@threads-hang-rebind-err:
    - shard-dg2-set2:     [DMESG-WARN][231] ([Intel XE#3876]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-433/igt@xe_exec_threads@threads-hang-rebind-err.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-463/igt@xe_exec_threads@threads-hang-rebind-err.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-adlp:         [DMESG-WARN][233] ([Intel XE#2953]) -> [PASS][234] +3 other tests pass
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_live_ktest@xe_dma_buf:
    - shard-bmg:          [SKIP][235] ([Intel XE#1192]) -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-8/igt@xe_live_ktest@xe_dma_buf.html

  * igt@xe_mmap@pci-membarrier-bad-pagesize:
    - shard-dg2-set2:     [SKIP][237] ([Intel XE#4045]) -> [PASS][238] +2 other tests pass
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-463/igt@xe_mmap@pci-membarrier-bad-pagesize.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@xe_mmap@pci-membarrier-bad-pagesize.html

  * igt@xe_mmap@pci-membarrier-parallel:
    - shard-bmg:          [SKIP][239] ([Intel XE#4045]) -> [PASS][240] +3 other tests pass
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-7/igt@xe_mmap@pci-membarrier-parallel.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-3/igt@xe_mmap@pci-membarrier-parallel.html

  * igt@xe_module_load@many-reload:
    - shard-bmg:          [ABORT][241] -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@xe_module_load@many-reload.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [ABORT][243] ([Intel XE#1358]) -> [PASS][244] +1 other test pass
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [ABORT][245] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][246] +1 other test pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-lnl:          [ABORT][247] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html
    - shard-adlp:         [ABORT][249] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         [FAIL][251] ([Intel XE#958]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-adlp:         [INCOMPLETE][253] -> [PASS][254] +1 other test pass
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [DMESG-FAIL][255] ([Intel XE#1033]) -> [DMESG-WARN][256] ([Intel XE#1033]) +1 other test dmesg-warn
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [DMESG-FAIL][257] ([Intel XE#1033]) -> [FAIL][258] ([Intel XE#1231])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [INCOMPLETE][259] ([Intel XE#2715]) -> [SKIP][260] ([Intel XE#2341])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-bmg:          [SKIP][261] ([Intel XE#2291]) -> [DMESG-WARN][262] ([Intel XE#877])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][263] ([Intel XE#2311]) -> [SKIP][264] ([Intel XE#2312]) +5 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          [FAIL][265] ([Intel XE#2333]) -> [SKIP][266] ([Intel XE#2312]) +1 other test skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][267] ([Intel XE#2312]) -> [FAIL][268] ([Intel XE#2333]) +2 other tests fail
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][269] ([Intel XE#2312]) -> [SKIP][270] ([Intel XE#2311]) +6 other tests skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][271] ([Intel XE#2312]) -> [SKIP][272] ([Intel XE#2313]) +8 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][273] ([Intel XE#2313]) -> [SKIP][274] ([Intel XE#2312]) +5 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-bmg:          [INCOMPLETE][275] ([Intel XE#1473]) -> [TIMEOUT][276] ([Intel XE#1473]) +1 other test timeout
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@xe_evict@evict-beng-threads-large.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-bmg:          [FAIL][277] ([Intel XE#1000]) -> [INCOMPLETE][278] ([Intel XE#1473])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-7/igt@xe_evict@evict-threads-large.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@xe_evict@evict-threads-large.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][279] ([Intel XE#1173]) -> [SKIP][280] ([Intel XE#1061])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-464/igt@xe_peer2peer@write.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@xe_peer2peer@write.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2293]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#2594]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3767]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3914]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914
  [Intel XE#4045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045
  [Intel XE#4048]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4048
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958


Build changes
-------------

  * Linux: xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab -> xe-pw-139769v9

  IGT_8188: ef0abf7f39a7ef0ecf2f08c62b90b852c435c755 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab: 77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab
  xe-pw-139769v9: 139769v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/index.html

--===============1320980373269935596==
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
<tr><td><b>Series:</b></td><td>drm/xe/mmap: Add mmap support for PCI memory barrier (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139769/">https://patchwork.freedesktop.org/series/139769/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab_full -&gt; xe-pw-139769v9_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139769v9_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139769v9_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139769v9_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-4/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_flip@flip-vs-suspend@c-hdmi-a3.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-435/igt@kms_pipe_crc_basic@suspend-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-2.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-busy-hang:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_vblank@wait-busy-hang.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-5/igt@xe_gt_freq@freq_reset_multiple.html">INCOMPLETE</a> +2 other tests incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139769v9_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914">Intel XE#3914</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3914">Intel XE#3914</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events-atomic@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3767">Intel XE#3767</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-2/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-1/igt@kms_async_flips@crc-atomic@pipe-c-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-1/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-5/igt@kms_big_fb@x-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_big_fb@y-tiled-64bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_big_fb@yf-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_bw@connected-linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs-cc@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +167 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-d-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs@pipe-c-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_chamelium_color@ctm-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@kms_chamelium_color@ctm-0-75.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_chamelium_edid@hdmi-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_chamelium_hpd@dp-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390">Intel XE#2390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-32x10:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_cursor_crc@cursor-rapid-movement-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@kms_cursor_crc@cursor-sliding-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipb-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-4/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508">Intel XE#1508</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_dsc@dsc-with-bpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-5/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288">Intel XE#3288</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-7/igt@kms_flip@2x-plain-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-1/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@d-dp2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@d-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-4/igt@kms_flip@flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@c-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-463/igt@kms_flip@flip-vs-suspend-interruptible@c-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-2/igt@kms_flip@plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-1/igt@kms_flip@plain-flip-ts-check-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytileccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-32bpp-yftile-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-upscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-rte:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@kms_hdr@bpc-switch-suspend@pipe-a-dp-2.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4048">Intel XE#4048</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-2/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-big-joiner:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_joiner@invalid-modeset-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-4/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493">Intel XE#2493</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-4/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571">Intel XE#2571</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_plane_scaling@planes-downscale-factor-0-25@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-75@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_lpsp@kms-lpsp:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_pm_lpsp@kms-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2499">Intel XE#2499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_properties@crtc-properties-legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2594">Intel XE#2594</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@kms_psr2_sf@fbc-pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@kms_psr2_sf@fbc-psr2-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_psr2_sf@pr-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387">Intel XE#2387</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_psr2_su@frontbuffer-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-plane-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@kms_psr@fbc-pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_psr@fbc-psr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-4/igt@kms_psr@pr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414">Intel XE#2414</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-2/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-1/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-b-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_vrr@lobf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-5/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-433/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@xe_ccs@suspend-resume@tile64-compressed-compfmt0-vram01-vram01.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) +2 other tests abort</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-access-parameters:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@xe_eudebug@basic-vm-access-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@xe_evict@evict-beng-large-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@xe_evict@evict-beng-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-8/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@xe_exec_basic@multigpu-no-exec-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-464/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@xe_exec_fault_mode@twice-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@xe_exec_sip_eudebug@breakpoint-writesip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-userptr-wait-cfg:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@xe_oa@syncs-userptr-wait-cfg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-4/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-433/igt@xe_pm@s2idle-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@xe_pm@s2idle-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-435/igt@xe_pm@s2idle-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@xe_pm@s2idle-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-7/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-2/igt@kms_async_flips@alternate-sync-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-1/igt@kms_async_flips@alternate-sync-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-7/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-green-to-red:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-2/igt@kms_color@ctm-green-to-red.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-1/igt@kms_color@ctm-green-to-red.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2625">Intel XE#2625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@kms_flip@2x-flip-vs-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_flip@2x-flip-vs-wf_vblank.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288">Intel XE#3288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-4/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3288">Intel XE#3288</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-1/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_flip@flip-vs-expired-vblank@a-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-5/igt@kms_flip@flip-vs-suspend-interruptible@d-hdmi-a3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-8/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-6/igt@kms_flip@wf_vblank-ts-check@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-2/igt@kms_plane_cursor@primary.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-1/igt@kms_plane_cursor@primary.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-4/igt@kms_plane_lowres@tiling-none.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_plane_lowres@tiling-none.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-4/igt@xe_exec_compute_mode@many-bindexecqueue-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-execqueues-close-fd:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-7/igt@xe_exec_reset@close-execqueues-close-fd.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-2/igt@xe_exec_reset@close-execqueues-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-rebind-err:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-433/igt@xe_exec_threads@threads-hang-rebind-err.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-463/igt@xe_exec_threads@threads-hang-rebind-err.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-9/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_dma_buf:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-2/igt@xe_live_ktest@xe_dma_buf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-8/igt@xe_live_ktest@xe_dma_buf.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-bad-pagesize:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-463/igt@xe_mmap@pci-membarrier-bad-pagesize.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045">Intel XE#4045</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-434/igt@xe_mmap@pci-membarrier-bad-pagesize.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@pci-membarrier-parallel:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-7/igt@xe_mmap@pci-membarrier-parallel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4045">Intel XE#4045</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-3/igt@xe_mmap@pci-membarrier-parallel.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@xe_module_load@many-reload.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-432/igt@xe_pm@s2idle-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-432/igt@xe_pm@s3-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-433/igt@xe_pm@s3-multiple-execs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-lnl-2/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-lnl-5/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-1/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-4/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-4/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-3/igt@kms_async_flips@alternate-sync-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-adlp-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-4/igt@kms_content_protection@atomic-dpms.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-7/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-indfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-6/igt@xe_evict@evict-beng-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-7/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-bmg-7/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-bmg-6/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab/shard-dg2-464/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v9/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab -&gt; xe-pw-139769v9</li>
</ul>
<p>IGT_8188: ef0abf7f39a7ef0ecf2f08c62b90b852c435c755 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2477-77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab: 77d5af2a7bb2060dcf8cceebb1b0d39f0b9b9fab<br />
  xe-pw-139769v9: 139769v9</p>

</body>
</html>

--===============1320980373269935596==--
