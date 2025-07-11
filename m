Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09DD6C83F1A
	for <intel-xe@archiver.kernel.org>; Fri, 11 Jul 2025 17:42:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C481810E3AF;
	Fri, 11 Jul 2025 17:42:55 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8214710E3AF;
 Fri, 11 Jul 2025 17:42:54 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4687185885837623644=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Use_trans_push_mechanism_t?=
 =?utf-8?q?o_generate_frame_change_event_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Hogander, Jouni" <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 11 Jul 2025 17:42:54 -0000
Message-ID: <175225577452.155282.14792313011881325311@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250711090858.3297380-1-jouni.hogander@intel.com>
In-Reply-To: <20250711090858.3297380-1-jouni.hogander@intel.com>
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

--===============4687185885837623644==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use trans push mechanism to generate frame change event (rev4)
URL   : https://patchwork.freedesktop.org/series/139831/
State : failure

== Summary ==

CI Bug Log - changes from xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459_FULL -> xe-pw-139831v4_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139831v4_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139831v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139831v4_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_psr@psr2-sprite-render:
    - shard-lnl:          [PASS][1] -> [ABORT][2] +1 other test abort
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-lnl-3/igt@kms_psr@psr2-sprite-render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-lnl-2/igt@kms_psr@psr2-sprite-render.html

  
Known issues
------------

  Here are the changes found in xe-pw-139831v4_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-dg2-set2:     NOTRUN -> [SKIP][3] ([Intel XE#455]) +2 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
    - shard-bmg:          NOTRUN -> [SKIP][4] ([Intel XE#2370])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [PASS][5] -> [FAIL][6] ([Intel XE#3908]) +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] ([Intel XE#316]) +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html
    - shard-bmg:          NOTRUN -> [SKIP][8] ([Intel XE#2327])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#316]) +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html
    - shard-bmg:          NOTRUN -> [SKIP][10] ([Intel XE#1124]) +1 other test skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][11] -> [DMESG-FAIL][12] ([Intel XE#4543]) +1 other test dmesg-fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][13] ([Intel XE#1124]) +3 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         NOTRUN -> [SKIP][14] ([Intel XE#367])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
    - shard-bmg:          NOTRUN -> [SKIP][15] ([Intel XE#367])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#367])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#787]) +139 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][18] -> [INCOMPLETE][19] ([Intel XE#3862])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][20] ([Intel XE#3862])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][21] ([Intel XE#2887]) +1 other test skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html
    - shard-adlp:         NOTRUN -> [SKIP][22] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#787]) +8 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [PASS][25] -> [INCOMPLETE][26] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] ([Intel XE#3124])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [PASS][29] -> [DMESG-WARN][30] ([Intel XE#1727] / [Intel XE#3113])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#373]) +1 other test skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     NOTRUN -> [FAIL][32] ([Intel XE#1178]) +3 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][33] ([Intel XE#1178])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          [PASS][34] -> [SKIP][35] ([Intel XE#2291]) +4 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [PASS][36] -> [SKIP][37] ([Intel XE#2316]) +8 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:
    - shard-bmg:          NOTRUN -> [SKIP][38] ([Intel XE#2316])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#310])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - shard-adlp:         [PASS][40] -> [DMESG-WARN][41] ([Intel XE#4543]) +5 other tests dmesg-warn
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-3/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-bmg:          [PASS][42] -> [FAIL][43] ([Intel XE#3098]) +1 other test fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][44] -> [FAIL][45] ([Intel XE#301]) +2 other tests fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [PASS][46] -> [DMESG-WARN][47] ([Intel XE#2953] / [Intel XE#4173]) +2 other tests dmesg-warn
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend@d-dp4:
    - shard-dg2-set2:     [PASS][48] -> [INCOMPLETE][49] ([Intel XE#2049] / [Intel XE#2597]) +1 other test incomplete
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#455]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#5390])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#651]) +1 other test skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#653])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html
    - shard-bmg:          NOTRUN -> [SKIP][54] ([Intel XE#2313])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#656]) +2 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
    - shard-bmg:          NOTRUN -> [SKIP][56] ([Intel XE#2312]) +2 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#653]) +6 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-bmg:          [PASS][58] -> [SKIP][59] ([Intel XE#1503])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][60] -> [SKIP][61] ([Intel XE#3012])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:
    - shard-lnl:          [PASS][62] -> [DMESG-WARN][63] ([Intel XE#1727]) +9 other tests dmesg-warn
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-lnl-4/igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-lnl-1/igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#4596])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-bmg:          NOTRUN -> [SKIP][65] ([Intel XE#4596])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#5021])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][67] ([Intel XE#1489]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-lnl:          [PASS][68] -> [TIMEOUT][69] ([Intel XE#1727]) +5 other tests timeout
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-lnl-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-lnl-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-sprite-render:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_psr@fbc-pr-sprite-render.html

  * igt@kms_psr@psr-sprite-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_psr@psr-sprite-blt.html
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2234] / [Intel XE#2850])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_psr@psr-sprite-blt.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][73] ([Intel XE#3414])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic:
    - shard-adlp:         [PASS][74] -> [FAIL][75] ([Intel XE#2883]) +2 other tests fail
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-2/igt@kms_setmode@basic.html
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-9/igt@kms_setmode@basic.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     NOTRUN -> [SKIP][76] ([Intel XE#5419]) +1 other test skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eu_stall@invalid-gt-id:
    - shard-adlp:         NOTRUN -> [SKIP][77] ([Intel XE#5419])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@xe_eu_stall@invalid-gt-id.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#4837]) +3 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#1392])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2322])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][81] -> [SKIP][82] ([Intel XE#1392]) +7 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#288]) +3 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-imm:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#288])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html

  * igt@xe_exec_reset@cm-close-fd:
    - shard-adlp:         [PASS][85] -> [DMESG-WARN][86] ([Intel XE#3868])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-2/igt@xe_exec_reset@cm-close-fd.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-bmg:          [PASS][87] -> [DMESG-WARN][88] ([Intel XE#3876])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#4837])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#4837])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html

  * igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-eocheck:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#4915]) +24 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-eocheck.html

  * igt@xe_exec_system_allocator@threads-many-mmap-shared-remap-eocheck:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#4915]) +55 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-mmap-shared-remap-eocheck.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#560])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@xe_media_fill@media-fill.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#512])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@xe_mmap@small-bar.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#2541] / [Intel XE#3573])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@xe_oa@mmio-triggered-reports.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][96] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_query@multigpu-query-invalid-cs-cycles:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#944]) +1 other test skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - shard-adlp:         [FAIL][98] ([Intel XE#4671]) -> [PASS][99]
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@core_getversion@all-cards.html
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@core_getversion@all-cards.html

  * igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:
    - shard-adlp:         [SKIP][100] ([Intel XE#4947]) -> [PASS][101]
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][102] ([Intel XE#1727] / [Intel XE#2705] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][103]
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_cursor_crc@cursor-random-256x85:
    - shard-adlp:         [DMESG-WARN][104] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][105] +2 other tests pass
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-2/igt@kms_cursor_crc@cursor-random-256x85.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-9/igt@kms_cursor_crc@cursor-random-256x85.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:
    - shard-dg2-set2:     [FAIL][106] -> [PASS][107]
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-463/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:
    - shard-bmg:          [SKIP][108] ([Intel XE#2291]) -> [PASS][109] +4 other tests pass
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          [SKIP][110] ([Intel XE#3009]) -> [PASS][111]
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-6/igt@kms_dp_aux_dev.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-4/igt@kms_dp_aux_dev.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][112] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][113] +1 other test pass
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@bd-hdmi-a6-dp4.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@bd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [SKIP][114] ([Intel XE#2316]) -> [PASS][115] +6 other tests pass
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][116] ([Intel XE#4543]) -> [PASS][117] +6 other tests pass
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:
    - shard-lnl:          [FAIL][118] ([Intel XE#301]) -> [PASS][119]
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][120] ([Intel XE#3012]) -> [PASS][121]
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_multiple@2x-tiling-none:
    - shard-bmg:          [SKIP][122] ([Intel XE#4596]) -> [PASS][123]
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html

  * igt@kms_setmode@basic:
    - shard-bmg:          [FAIL][124] ([Intel XE#2883]) -> [PASS][125] +2 other tests pass
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-5/igt@kms_setmode@basic.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-8/igt@kms_setmode@basic.html

  * igt@kms_vblank@query-forked-hang:
    - shard-adlp:         [SKIP][126] ([Intel XE#4950]) -> [PASS][127] +1 other test pass
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@kms_vblank@query-forked-hang.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@kms_vblank@query-forked-hang.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][128] ([Intel XE#1392]) -> [PASS][129] +4 other tests pass
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html

  * igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate:
    - shard-adlp:         [SKIP][130] ([Intel XE#4945]) -> [PASS][131] +4 other tests pass
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_reset@gt-reset-stress:
    - shard-adlp:         [DMESG-WARN][132] ([Intel XE#4812]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@xe_exec_reset@gt-reset-stress.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html

  
#### Warnings ####

  * igt@kms_addfb_basic@invalid-smem-bo-on-discrete:
    - shard-adlp:         [SKIP][134] ([Intel XE#4950]) -> [SKIP][135] ([Intel XE#3157])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         [SKIP][136] ([Intel XE#4947]) -> [SKIP][137] ([Intel XE#1124])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-180:
    - shard-adlp:         [DMESG-FAIL][138] ([Intel XE#4543]) -> [DMESG-FAIL][139] ([Intel XE#2953] / [Intel XE#4173] / [Intel XE#4543])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html

  * igt@kms_bw@linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         [SKIP][140] ([Intel XE#4950]) -> [SKIP][141] ([Intel XE#367])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:
    - shard-adlp:         [SKIP][142] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][143] ([Intel XE#455] / [Intel XE#787])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html

  * igt@kms_content_protection@lic-type-0:
    - shard-bmg:          [SKIP][144] ([Intel XE#2341]) -> [FAIL][145] ([Intel XE#1178])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-6/igt@kms_content_protection@lic-type-0.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-7/igt@kms_content_protection@lic-type-0.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-lnl:          [FAIL][146] ([Intel XE#301] / [Intel XE#3149]) -> [FAIL][147] ([Intel XE#301])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][148] ([Intel XE#2311]) -> [SKIP][149] ([Intel XE#2312]) +19 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][150] ([Intel XE#2312]) -> [SKIP][151] ([Intel XE#2311]) +14 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-bmg:          [SKIP][152] ([Intel XE#2312]) -> [SKIP][153] ([Intel XE#5390]) +11 other tests skip
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][154] ([Intel XE#5390]) -> [SKIP][155] ([Intel XE#2312]) +8 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         [SKIP][156] ([Intel XE#4947]) -> [SKIP][157] ([Intel XE#656])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][158] ([Intel XE#2312]) -> [SKIP][159] ([Intel XE#2313]) +18 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][160] ([Intel XE#2313]) -> [SKIP][161] ([Intel XE#2312]) +18 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_psr@pr-sprite-render:
    - shard-adlp:         [SKIP][162] ([Intel XE#2351] / [Intel XE#4947]) -> [SKIP][163] ([Intel XE#2850] / [Intel XE#929])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@kms_psr@pr-sprite-render.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@kms_psr@pr-sprite-render.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         [FAIL][164] ([Intel XE#1874]) -> [DMESG-FAIL][165] ([Intel XE#2953] / [Intel XE#4173])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [SKIP][166] ([Intel XE#362]) -> [FAIL][167] ([Intel XE#1729])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         [SKIP][168] ([Intel XE#4945]) -> [SKIP][169] ([Intel XE#1447])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@xe_compute@ccs-mode-compute-kernel.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         [SKIP][170] ([Intel XE#4945]) -> [SKIP][171] ([Intel XE#288]) +1 other test skip
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:
    - shard-adlp:         [SKIP][172] ([Intel XE#4945]) -> [SKIP][173] ([Intel XE#4915]) +8 other tests skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][174] ([Intel XE#1173]) -> [SKIP][175] ([Intel XE#1061])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-466/igt@xe_peer2peer@write.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-adlp:         [SKIP][176] ([Intel XE#4945]) -> [SKIP][177] ([Intel XE#2284] / [Intel XE#366])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@xe_pm@d3cold-multiple-execs.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@xe_pm@d3cold-multiple-execs.html

  
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#2705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2883]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#3009]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#3157]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4671]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4671
  [Intel XE#4812]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4812
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#5390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390
  [Intel XE#5419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5419
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459 -> xe-pw-139831v4

  IGT_8451: 8451
  xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459: e1d8a6230d710e3e59a23520a0690115ad57b459
  xe-pw-139831v4: 139831v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/index.html

--===============4687185885837623644==
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
<tr><td><b>Series:</b></td><td>Use trans push mechanism to generate frame change event (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139831/">https://patchwork.freedesktop.org/series/139831/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459_FULL -&gt; xe-pw-139831v4_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139831v4_FULL absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139831v4_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139831v4_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_psr@psr2-sprite-render:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-lnl-3/igt@kms_psr@psr2-sprite-render.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-lnl-2/igt@kms_psr@psr2-sprite-render.html">ABORT</a> +1 other test abort</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139831v4_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-3/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-1/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_big_fb@y-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-434/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +139 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-432/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_content_protection@atomic-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-2/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate-interruptible:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_flip@2x-plain-flip-fb-recreate-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-3/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-6/igt@kms_flip@basic-flip-vs-wf_vblank.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-2/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-2/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-466/igt@kms_flip@flip-vs-suspend@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-436/igt@kms_flip@flip-vs-suspend@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-8/igt@kms_hdr@static-toggle-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_hdr@static-toggle-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-1/igt@kms_joiner@basic-force-big-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-5/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-lnl-4/igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-lnl-1/igt@kms_pipe_crc_basic@read-crc@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_plane_multiple@2x-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-cursor-plane-update-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-lnl-2/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-lnl-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +5 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@kms_psr@fbc-pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_psr@psr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-2/igt@kms_setmode@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-9/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@xe_eu_stall@invalid-event-report-count.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5419">Intel XE#5419</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-gt-id:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@xe_eu_stall@invalid-gt-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5419">Intel XE#5419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-463/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@xe_exec_basic@multigpu-once-basic-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@xe_exec_fault_mode@once-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-2/igt@xe_exec_reset@cm-close-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-3/igt@xe_exec_reset@cm-close-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">Intel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-1/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@xe_exec_sip_eudebug@breakpoint-writesip-nodebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-eocheck:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@xe_exec_system_allocator@process-many-execqueues-mmap-remap-ro-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-many-mmap-shared-remap-eocheck:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@xe_exec_system_allocator@threads-many-mmap-shared-remap-eocheck.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-4/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@xe_oa@mmio-triggered-reports.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-435/igt@xe_query@multigpu-query-invalid-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4671">Intel XE#4671</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@kms_big_fb@x-tiled-addfb-size-offset-overflow.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2705">Intel XE#2705</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212">Intel XE#4212</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x85:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-2/igt@kms_cursor_crc@cursor-random-256x85.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-9/igt@kms_cursor_crc@cursor-random-256x85.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-463/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-6/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-7/igt@kms_cursor_legacy@2x-long-nonblocking-modeset-vs-cursor-atomic.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3009">Intel XE#3009</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-4/igt@kms_dp_aux_dev.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-435/igt@kms_flip@2x-flip-vs-suspend-interruptible@bd-hdmi-a6-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@bd-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-8/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-6/igt@kms_flip@flip-vs-blocking-wf-vblank@c-hdmi-a1.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible@c-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-6/igt@kms_joiner@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-4/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-none:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-none.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-8/igt@kms_plane_multiple@2x-tiling-none.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-5/igt@kms_setmode@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2883">Intel XE#2883</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-8/igt@kms_setmode@basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-forked-hang:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@kms_vblank@query-forked-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@kms_vblank@query-forked-hang.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-434/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate-race.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@xe_exec_basic@no-exec-bindexecqueue-userptr-invalidate.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@gt-reset-stress:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@xe_exec_reset@gt-reset-stress.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4812">Intel XE#4812</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-6/igt@xe_exec_reset@gt-reset-stress.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-smem-bo-on-discrete:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@kms_addfb_basic@invalid-smem-bo-on-discrete.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3157">Intel XE#3157</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-6/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-2/igt@kms_big_fb@y-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@kms_bw@linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-6/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-7/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-5/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5390">Intel XE#5390</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@kms_psr@pr-sprite-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-9/igt@kms_rotation_crc@multiplane-rotation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-new-bo-map-nomemset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-dg2-466/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-dg2-432/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459/shard-adlp-4/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139831v4/shard-adlp-8/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459 -&gt; xe-pw-139831v4</li>
</ul>
<p>IGT_8451: 8451<br />
  xe-3397-e1d8a6230d710e3e59a23520a0690115ad57b459: e1d8a6230d710e3e59a23520a0690115ad57b459<br />
  xe-pw-139831v4: 139831v4</p>

</body>
</html>

--===============4687185885837623644==--
