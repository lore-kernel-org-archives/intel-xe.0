Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 658B6CDD1BA
	for <intel-xe@archiver.kernel.org>; Fri, 27 Sep 2024 14:57:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 283C210EC93;
	Fri, 27 Sep 2024 14:57:57 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EEF0210EC93;
 Fri, 27 Sep 2024 14:57:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5537938157153521781=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Restore_GT_freq_on_GS?=
 =?utf-8?q?C_load_error?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinay Belgaumkar" <vinay.belgaumkar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Sep 2024 14:57:55 -0000
Message-ID: <172744907596.1111712.12161399525749283685@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240925204918.1989574-1-vinay.belgaumkar@intel.com>
In-Reply-To: <20240925204918.1989574-1-vinay.belgaumkar@intel.com>
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

--===============5537938157153521781==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Restore GT freq on GSC load error
URL   : https://patchwork.freedesktop.org/series/139119/
State : failure

== Summary ==

CI Bug Log - changes from xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334_full -> xe-pw-139119v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139119v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139119v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139119v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][3] +1 other test skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:
    - shard-adlp:         NOTRUN -> [FAIL][4] +2 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - shard-lnl:          [PASS][5] -> [FAIL][6] +1 other test fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-8/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][7] +1 other test skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_psr@psr2-primary-render.html

  * igt@xe_exec_basic@twice-rebind:
    - shard-lnl:          [PASS][8] -> [DMESG-WARN][9] +1 other test dmesg-warn
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@xe_exec_basic@twice-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@xe_exec_basic@twice-rebind.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-adlp:         [PASS][10] -> [DMESG-WARN][11] +1 other test dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-prefetch.html

  
#### Warnings ####

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][12] ([Intel XE#1201]) -> [SKIP][13] +6 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - {shard-bmg}:        [PASS][14] -> [INCOMPLETE][15] +1 other test incomplete
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - {shard-bmg}:        NOTRUN -> [SKIP][16] +7 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - {shard-bmg}:        [SKIP][17] ([Intel XE#2446]) -> [SKIP][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - {shard-bmg}:        [SKIP][19] ([Intel XE#1130]) -> [SKIP][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_pm@s4-d3cold-basic-exec.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-4/igt@xe_pm@s4-d3cold-basic-exec.html

  
Known issues
------------

  Here are the changes found in xe-pw-139119v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_atomic_transition@modeset-transition-nonblocking:
    - shard-lnl:          [PASS][21] -> [FAIL][22] ([Intel XE#1701]) +1 other test fail
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing:
    - shard-adlp:         [PASS][23] -> [FAIL][24] ([Intel XE#1426]) +1 other test fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][25] -> [FAIL][26] ([Intel XE#1426]) +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@linear-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#1201] / [Intel XE#316])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][29] -> [FAIL][30] ([Intel XE#1231]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][31] ([Intel XE#1204])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1124]) +2 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][33] -> [FAIL][34] ([Intel XE#1204]) +1 other test fail
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-adlp:         [PASS][36] -> [FAIL][37] ([Intel XE#1874]) +4 other tests fail
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1201] / [Intel XE#2191])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1512])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][40] ([Intel XE#1201] / [Intel XE#367])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][42] ([Intel XE#787]) +6 other tests skip
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][44] ([Intel XE#1399]) +2 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#1201] / [Intel XE#787]) +6 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][46] ([Intel XE#616]) +6 other tests fail
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][47] -> [INCOMPLETE][48] ([Intel XE#1195] / [Intel XE#1727])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#787]) +5 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_edid@hdmi-mode-timings:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#373])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_chamelium_edid@hdmi-mode-timings.html

  * igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#373]) +3 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#373]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#455]) +6 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-onscreen-32x32:
    - shard-lnl:          NOTRUN -> [SKIP][56] ([Intel XE#1424])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html

  * igt@kms_cursor_crc@cursor-random-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#308])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_legacy@torture-move@pipe-b:
    - shard-dg2-set2:     [PASS][59] -> [DMESG-WARN][60] ([Intel XE#877]) +1 other test dmesg-warn
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_cursor_legacy@torture-move@pipe-b.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-b.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#310]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-dg2-set2:     [PASS][62] -> [INCOMPLETE][63] ([Intel XE#1195] / [Intel XE#2597])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][64] -> [FAIL][65] ([Intel XE#886]) +2 other tests fail
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp4:
    - shard-dg2-set2:     [PASS][66] -> [INCOMPLETE][67] ([Intel XE#1195]) +3 other tests incomplete
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp4.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp4.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][68] ([Intel XE#1397] / [Intel XE#1745])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#1397])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][70] -> [DMESG-FAIL][71] ([Intel XE#324]) +4 other tests dmesg-fail
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [PASS][73] -> [FAIL][74] ([Intel XE#1861])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#656]) +7 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#651]) +2 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][77] ([Intel XE#651]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][78] ([Intel XE#1201] / [Intel XE#651]) +5 other tests skip
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][79] ([Intel XE#653])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][80] ([Intel XE#1201] / [Intel XE#656]) +8 other tests skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][81] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#653]) +7 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_plane@plane-position-hole@pipe-a-plane-3:
    - shard-lnl:          [PASS][83] -> [DMESG-FAIL][84] ([Intel XE#324]) +1 other test dmesg-fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c:
    - shard-dg2-set2:     [PASS][85] -> [INCOMPLETE][86] ([Intel XE#1195] / [Intel XE#2566]) +1 other test incomplete
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [PASS][87] -> [FAIL][88] ([Intel XE#1430])
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_dc@deep-pkgc:
    - shard-lnl:          [PASS][89] -> [FAIL][90] ([Intel XE#2029])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201]) +6 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@pr-dpms:
    - shard-lnl:          NOTRUN -> [SKIP][92] ([Intel XE#1406]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_psr@pr-dpms.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#2850]) +2 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_psr@psr2-dpms.html

  * igt@kms_psr@psr2-primary-render:
    - shard-lnl:          NOTRUN -> [FAIL][94] ([Intel XE#1649]) +1 other test fail
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-8/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#1435])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-8/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#362])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][98] ([Intel XE#330])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][99] -> [FAIL][100] ([Intel XE#2443]) +3 other tests fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_vrr@flip-basic.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-3/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@flip-dpms:
    - shard-lnl:          [PASS][101] -> [FAIL][102] ([Intel XE#1522]) +1 other test fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-2/igt@kms_vrr@flip-dpms.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#756])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html
    - shard-lnl:          NOTRUN -> [SKIP][104] ([Intel XE#756])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_writeback@writeback-fb-id.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [PASS][105] -> [TIMEOUT][106] ([Intel XE#1473]) +1 other test timeout
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][107] -> [TIMEOUT][108] ([Intel XE#1473] / [Intel XE#402])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-2/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-small:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#688])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@xe_evict@evict-beng-threads-small.html

  * igt@xe_exec_basic@multigpu-once-basic:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1392]) +1 other test skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-basic.html

  * igt@xe_exec_basic@multigpu-once-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#1392])
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html

  * igt@xe_exec_compute_mode@lr-mode-workload:
    - shard-adlp:         [PASS][113] -> [FAIL][114] ([Intel XE#2125])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@xe_exec_compute_mode@lr-mode-workload.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@xe_exec_compute_mode@lr-mode-workload.html

  * igt@xe_exec_fault_mode@invalid-va:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@xe_exec_fault_mode@invalid-va.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][117] -> [DMESG-FAIL][118] ([Intel XE#1620])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][119] ([Intel XE#1201] / [Intel XE#2541]) +1 other test skip
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@oa-formats:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1201] / [Intel XE#2541])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@xe_oa@oa-formats.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [PASS][121] -> [ABORT][122] ([Intel XE#1794])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@xe_pm@s4-mocs.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [PASS][123] -> [ABORT][124] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][125] -> [INCOMPLETE][126] ([Intel XE#2280])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@xe_pm@s4-vm-bind-unbind-all.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          [PASS][127] -> [DMESG-WARN][128] ([Intel XE#1760])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@core_getversion@all-cards:
    - {shard-bmg}:        [FAIL][129] ([Intel XE#2452]) -> [PASS][130]
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@core_getversion@all-cards.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@core_getversion@all-cards.html

  * igt@core_hotunplug@hotreplug:
    - shard-lnl:          [ABORT][131] -> [PASS][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-4/igt@core_hotunplug@hotreplug.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-3/igt@core_hotunplug@hotreplug.html

  * igt@fbdev@eof:
    - {shard-bmg}:        [SKIP][133] ([Intel XE#2134]) -> [PASS][134] +2 other tests pass
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@fbdev@eof.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@fbdev@eof.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][135] -> [PASS][136] +5 other tests pass
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - {shard-bmg}:        [SKIP][137] -> [PASS][138] +162 other tests pass
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][139] ([Intel XE#1874]) -> [PASS][140] +4 other tests pass
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [FAIL][141] ([Intel XE#1231]) -> [PASS][142] +2 other tests pass
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][143] ([Intel XE#1195]) -> [PASS][144] +3 other tests pass
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - {shard-bmg}:        [DMESG-WARN][145] ([Intel XE#2791] / [Intel XE#877]) -> [PASS][146]
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@absolute-wf_vblank:
    - shard-lnl:          [FAIL][147] ([Intel XE#2631]) -> [PASS][148] +1 other test pass
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-5/igt@kms_flip@absolute-wf_vblank.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_flip@absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-lnl:          [FAIL][149] ([Intel XE#886]) -> [PASS][150] +6 other tests pass
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][151] -> [PASS][152] +4 other tests pass
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:
    - {shard-bmg}:        [INCOMPLETE][153] -> [PASS][154] +1 other test pass
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][155] ([Intel XE#324]) -> [PASS][156] +3 other tests pass
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][157] ([Intel XE#1861]) -> [PASS][158] +2 other tests pass
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:
    - {shard-bmg}:        [DMESG-WARN][159] ([Intel XE#877]) -> [PASS][160] +6 other tests pass
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-FAIL][161] ([Intel XE#324]) -> [PASS][162] +3 other tests pass
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_plane@plane-position-covered.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:
    - shard-lnl:          [DMESG-WARN][163] ([Intel XE#324]) -> [PASS][164] +5 other tests pass
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane_cursor@overlay:
    - shard-lnl:          [DMESG-WARN][165] -> [PASS][166] +1 other test pass
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_plane_cursor@overlay.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_plane_cursor@overlay.html

  * igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:
    - shard-dg2-set2:     [FAIL][167] ([Intel XE#616]) -> [PASS][168] +3 other tests pass
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][169] -> [PASS][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@cursor:
    - {shard-bmg}:        [SKIP][171] ([Intel XE#2446]) -> [PASS][172] +5 other tests pass
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_pm_rpm@cursor.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-7/igt@kms_pm_rpm@cursor.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][173] ([Intel XE#1473]) -> [PASS][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - {shard-bmg}:        [TIMEOUT][175] ([Intel XE#2105]) -> [PASS][176]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html
    - shard-dg2-set2:     [TIMEOUT][177] ([Intel XE#2105]) -> [PASS][178]
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_module_load@reload-no-display:
    - {shard-bmg}:        [FAIL][179] ([Intel XE#2136]) -> [PASS][180]
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_module_load@reload-no-display.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-7/igt@xe_module_load@reload-no-display.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][181] ([Intel XE#1794]) -> [PASS][182]
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][183] ([Intel XE#958]) -> [PASS][184]
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_spin_batch@spin-all:
    - {shard-bmg}:        [SKIP][185] ([Intel XE#1130]) -> [PASS][186] +291 other tests pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_spin_batch@spin-all.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-8/igt@xe_spin_batch@spin-all.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     [SKIP][187] ([Intel XE#1201] / [Intel XE#623]) -> [SKIP][188] ([Intel XE#623])
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][189] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][190] ([Intel XE#316]) +1 other test skip
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][191] ([Intel XE#316]) -> [SKIP][192] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][193] ([Intel XE#1231]) -> [DMESG-FAIL][194] ([Intel XE#324])
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb:
    - shard-dg2-set2:     [SKIP][195] ([Intel XE#1201] / [Intel XE#619]) -> [SKIP][196] ([Intel XE#619])
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][198] ([Intel XE#1124]) +6 other tests skip
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][199] ([Intel XE#1124]) -> [SKIP][200] ([Intel XE#1124] / [Intel XE#1201]) +3 other tests skip
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][201] ([Intel XE#367]) -> [SKIP][202] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][203] ([Intel XE#2191]) -> [SKIP][204] ([Intel XE#1201] / [Intel XE#2191])
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][205] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][206] ([Intel XE#2191])
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][207] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][208] ([Intel XE#367])
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][209] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][210] ([Intel XE#455] / [Intel XE#787]) +21 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][211] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][212] ([Intel XE#787]) +76 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][213] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][214] ([Intel XE#1252])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][215] ([Intel XE#787]) -> [SKIP][216] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][218] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:
    - shard-dg2-set2:     [SKIP][219] ([Intel XE#1252]) -> [SKIP][220] ([Intel XE#1201] / [Intel XE#1252]) +2 other tests skip
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html

  * igt@kms_chamelium_audio@dp-audio:
    - shard-dg2-set2:     [SKIP][221] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][222] ([Intel XE#373]) +10 other tests skip
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_chamelium_audio@dp-audio.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html

  * igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:
    - shard-dg2-set2:     [SKIP][223] ([Intel XE#373]) -> [SKIP][224] ([Intel XE#1201] / [Intel XE#373]) +6 other tests skip
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][226] ([Intel XE#307])
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-dg2-set2:     [SKIP][227] ([Intel XE#308]) -> [SKIP][228] ([Intel XE#1201] / [Intel XE#308])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][229] ([Intel XE#1201] / [Intel XE#323]) -> [SKIP][230] ([Intel XE#323])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][231] ([Intel XE#323]) -> [SKIP][232] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][233] ([Intel XE#455]) -> [SKIP][234] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     [SKIP][235] ([Intel XE#1201] / [Intel XE#703]) -> [SKIP][236] ([Intel XE#703])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_feature_discovery@display-3x.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_feature_discovery@display-3x.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][237] ([i915#5274]) -> [SKIP][238] ([Intel XE#1201] / [i915#5274])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#651]) -> [SKIP][240] ([Intel XE#1201] / [Intel XE#651]) +14 other tests skip
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:
    - shard-dg2-set2:     [SKIP][241] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][242] ([Intel XE#651]) +25 other tests skip
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-y:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][244] ([Intel XE#658])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][245] ([Intel XE#653]) -> [SKIP][246] ([Intel XE#1201] / [Intel XE#653]) +14 other tests skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][247] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][248] ([Intel XE#653]) +22 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     [SKIP][249] ([Intel XE#605]) -> [SKIP][250] ([Intel XE#1201] / [Intel XE#605])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#2763]) -> [SKIP][252] ([Intel XE#1201] / [Intel XE#2763]) +5 other tests skip
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:
    - shard-dg2-set2:     [SKIP][253] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][254] ([Intel XE#1201] / [Intel XE#2763] / [Intel XE#455]) +3 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#870]) -> [SKIP][256] ([Intel XE#1201] / [Intel XE#870])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_pm_backlight@fade.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_pm_backlight@fade.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][258] ([Intel XE#1489]) +3 other tests skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][259] ([Intel XE#1489]) -> [SKIP][260] ([Intel XE#1201] / [Intel XE#1489])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html

  * igt@kms_psr@psr-dpms:
    - shard-dg2-set2:     [SKIP][261] ([Intel XE#1201] / [Intel XE#2850]) -> [SKIP][262] ([Intel XE#2850]) +10 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@kms_psr@psr-dpms.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_psr@psr-dpms.html

  * igt@kms_psr@psr2-sprite-plane-move:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#2850]) -> [SKIP][264] ([Intel XE#1201] / [Intel XE#2850]) +6 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_psr@psr2-sprite-plane-move.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][265] ([Intel XE#1127]) -> [SKIP][266] ([Intel XE#1127] / [Intel XE#1201])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_vrr@flipline:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][268] ([Intel XE#455]) +15 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_vrr@flipline.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_vrr@flipline.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#756]) -> [SKIP][270] ([Intel XE#1201] / [Intel XE#756])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][272] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_exec_fault_mode@once-rebind-prefetch:
    - shard-dg2-set2:     [SKIP][273] ([Intel XE#288]) -> [SKIP][274] ([Intel XE#1201] / [Intel XE#288]) +11 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-prefetch.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][276] ([Intel XE#288]) +18 other tests skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     [SKIP][277] ([Intel XE#255]) -> [SKIP][278] ([Intel XE#1201] / [Intel XE#255])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_huc_copy@huc_copy.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@xe_huc_copy@huc_copy.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][280] ([Intel XE#512])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@xe_mmap@small-bar.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_mmap@small-bar.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#2541]) -> [SKIP][282] ([Intel XE#1201] / [Intel XE#2541]) +3 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_oa@missing-sample-flags.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@xe_oa@missing-sample-flags.html

  * igt@xe_oa@non-privileged-access-vaddr:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201] / [Intel XE#2541]) -> [SKIP][284] ([Intel XE#2541]) +5 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#1201] / [Intel XE#366]) -> [SKIP][286] ([Intel XE#366]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][287] -> [SKIP][288] ([Intel XE#1201]) +2 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#944]) -> [SKIP][290] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_query@multigpu-query-engines.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-topology-l3-bank-mask:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][292] ([Intel XE#944])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@xe_query@multigpu-query-topology-l3-bank-mask.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_query@multigpu-query-topology-l3-bank-mask.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1508]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1508
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1649]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1695]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1695
  [Intel XE#1701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2029]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2125
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2329
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2352
  [Intel XE#2364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2364
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2374
  [Intel XE#2375]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2375
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2387]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2387
  [Intel XE#2391]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2391
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2414
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2452]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2452
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2631]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2631
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2791]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_8032 -> IGT_8033
  * Linux: xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334 -> xe-pw-139119v1

  IGT_8032: 8032
  IGT_8033: 501986c30c9e3aa667088c648efd36f86ca9c5ca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334: ec87b409d3a9358c9a079186d528fad3f7d64334
  xe-pw-139119v1: 139119v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/index.html

--===============5537938157153521781==
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
<tr><td><b>Series:</b></td><td>drm/xe: Restore GT freq on GSC load error</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139119/">https://patchwork.freedesktop.org/series/139119/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334_full -&gt; xe-pw-139119v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139119v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-139119v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-139119v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-absolute-wf_vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-5/igt@kms_flip@2x-flip-vs-dpms.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_pipe_crc_basic@nonblocking-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-8/igt@kms_pipe_crc_basic@nonblocking-crc.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_psr@psr2-primary-render.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@twice-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@xe_exec_basic@twice-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@xe_exec_basic@twice-rebind.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@xe_pm@s2idle-vm-bind-prefetch.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-4/igt@kms_flip@flip-vs-blocking-wf-vblank.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-8/igt@kms_pm_rpm@modeset-lpsp.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-4/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139119v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-5/igt@kms_atomic_transition@modeset-transition-nonblocking.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1701">Intel XE#1701</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-8/igt@kms_atomic_transition@plane-all-modeset-transition-fencing.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_big_fb@4-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_big_fb@linear-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-5/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_bw@connected-linear-tiling-3-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_bw@connected-linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512">Intel XE#1512</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-dg2-rc-ccs-cc@pipe-c-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-y-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_ccs@random-ccs-data-y-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-mode-timings:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_chamelium_edid@hdmi-mode-timings.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_chamelium_hpd@hdmi-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-32x32:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-32x32.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@torture-move@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_cursor_legacy@torture-move@pipe-b.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_cursor_legacy@torture-move@pipe-b.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_flip@2x-flip-vs-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_flip@flip-vs-blocking-wf-vblank@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +4 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-4/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole@pipe-a-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@kms_plane@plane-position-hole@pipe-a-plane-3.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-c.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_pm_dc@dc6-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@deep-pkgc:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_pm_dc@deep-pkgc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@kms_pm_dc@deep-pkgc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2029">Intel XE#2029</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-dpms:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_psr@pr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-8/igt@kms_psr@psr2-primary-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1649">Intel XE#1649</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-8/igt@kms_setmode@basic-clone-single-crtc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-3/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-2/igt@kms_vrr@flip-dpms.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@kms_vrr@flip-dpms.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel XE#1522</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_writeback@writeback-fb-id.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_evict@evict-beng-mixed-many-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) +1 other test timeout</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-2/igt@xe_evict@evict-beng-mixed-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-small:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@xe_evict@evict-beng-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-4/igt@xe_exec_basic@multigpu-once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@xe_exec_basic@multigpu-once-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@xe_exec_compute_mode@lr-mode-workload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@xe_exec_compute_mode@lr-mode-workload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2125">Intel XE#2125</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@xe_exec_fault_mode@invalid-va.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@xe_exec_fault_mode@many-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-2/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@xe_oa@oa-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@xe_pm@s4-mocs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_pm@s4-vm-bind-unbind-all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@xe_wedged@wedged-at-any-timeout.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getversion@all-cards:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@core_getversion@all-cards.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2452">Intel XE#2452</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@core_getversion@all-cards.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-4/igt@core_hotunplug@hotreplug.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-3/igt@core_hotunplug@hotreplug.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@fbdev@eof.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> +162 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2791">Intel XE#2791</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-5/igt@kms_flip@absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2631">Intel XE#2631</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_flip@absolute-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-linear-to-16bpp-linear-downscaling@pipe-a-valid-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-8/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-3/igt@kms_plane@pixel-format-source-clamping@pipe-b-plane-0.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-7/igt@kms_plane@plane-position-covered.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@kms_plane_cursor@overlay.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-2/igt@kms_plane_cursor@overlay.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_plane_cursor@overlay@pipe-a-hdmi-a-6-size-64.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@kms_pm_rpm@cursor.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-7/igt@kms_pm_rpm@cursor.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-5/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-4/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-7/igt@xe_module_load@reload-no-display.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-6/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-lnl-8/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-lnl-1/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-all:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-bmg-6/igt@xe_spin_batch@spin-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-bmg-8/igt@xe_spin_batch@spin-all.html">PASS</a> +291 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_big_fb@y-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@ccs-on-another-bo-y-tiled-gen12-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +76 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_audio@dp-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_chamelium_audio@dp-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@kms_chamelium_edid@hdmi-edid-stress-resolution-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-1p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbc-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-25@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-435/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-434/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-436/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_psr@psr-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_psr@psr2-sprite-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flipline:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@kms_vrr@flipline.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@xe_exec_fault_mode@once-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-436/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-464/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-463/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-privileged-access-vaddr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-434/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_oa@non-privileged-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-433/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-432/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology-l3-bank-mask:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334/shard-dg2-463/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139119v1/shard-dg2-432/igt@xe_query@multigpu-query-topology-l3-bank-mask.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8032 -&gt; IGT_8033</li>
<li>Linux: xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334 -&gt; xe-pw-139119v1</li>
</ul>
<p>IGT_8032: 8032<br />
  IGT_8033: 501986c30c9e3aa667088c648efd36f86ca9c5ca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1980-ec87b409d3a9358c9a079186d528fad3f7d64334: ec87b409d3a9358c9a079186d528fad3f7d64334<br />
  xe-pw-139119v1: 139119v1</p>

</body>
</html>

--===============5537938157153521781==--
