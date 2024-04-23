Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFAB4C04FFE
	for <intel-xe@archiver.kernel.org>; Tue, 23 Apr 2024 23:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4D75210F209;
	Tue, 23 Apr 2024 23:35:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C004C10F209;
 Tue, 23 Apr 2024 23:35:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0192887540540839521=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/vm=3A_Use_xe=5Fvm=5Flock?=
 =?utf-8?q?=28=29_helper_for_locking_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Himal Prasad Ghimiray" <himal.prasad.ghimiray@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Apr 2024 23:35:13 -0000
Message-ID: <171391531376.1610190.973910677929823787@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240423070332.2036539-1-himal.prasad.ghimiray@intel.com>
In-Reply-To: <20240423070332.2036539-1-himal.prasad.ghimiray@intel.com>
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

--===============0192887540540839521==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vm: Use xe_vm_lock() helper for locking (rev2)
URL   : https://patchwork.freedesktop.org/series/132751/
State : failure

== Summary ==

CI Bug Log - changes from xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf_full -> xe-pw-132751v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132751v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132751v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132751v2_full:

### IGT changes ###

#### Possible regressions ####

  * {igt@kms_dirtyfb@psr-dirtyfb-ioctl@a-edp-2} (NEW):
    - {shard-lnl}:        NOTRUN -> [INCOMPLETE][1]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl@a-edp-2.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:
    - shard-dg2-set2:     [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_atomic@plane-invalid-params-fence:
    - {shard-lnl}:        [PASS][4] -> [SKIP][5] +5 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-5/igt@kms_atomic@plane-invalid-params-fence.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@kms_atomic@plane-invalid-params-fence.html

  * {igt@kms_atomic@test-only@pipe-a-edp-2}:
    - {shard-lnl}:        NOTRUN -> [DMESG-WARN][6]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@kms_atomic@test-only@pipe-a-edp-2.html

  * igt@kms_big_fb@linear-64bpp-rotate-0:
    - {shard-lnl}:        [DMESG-WARN][7] ([Intel XE#1494]) -> [DMESG-WARN][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-6/igt@kms_big_fb@linear-64bpp-rotate-0.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-7/igt@kms_big_fb@linear-64bpp-rotate-0.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - {shard-lnl}:        [SKIP][9] ([Intel XE#373]) -> [SKIP][10] +1 other test skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - {shard-lnl}:        [SKIP][11] ([Intel XE#1401]) -> [SKIP][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-x:
    - {shard-lnl}:        NOTRUN -> [FAIL][13]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-x.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:
    - {shard-lnl}:        [SKIP][14] ([Intel XE#651]) -> [INCOMPLETE][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - {shard-lnl}:        [SKIP][16] ([Intel XE#651]) -> [SKIP][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - {shard-lnl}:        NOTRUN -> [SKIP][18] +2 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - {shard-lnl}:        [SKIP][19] ([Intel XE#656]) -> [SKIP][20] +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - {shard-lnl}:        [SKIP][21] ([Intel XE#1406]) -> [SKIP][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@xe_exec_fault_mode@many-invalid-fault:
    - {shard-lnl}:        [PASS][23] -> [INCOMPLETE][24] +5 other tests incomplete
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-6/igt@xe_exec_fault_mode@many-invalid-fault.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@xe_exec_fault_mode@many-invalid-fault.html

  * igt@xe_gt_freq@freq_low_max:
    - {shard-lnl}:        [PASS][25] -> [FAIL][26] +1 other test fail
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-8/igt@xe_gt_freq@freq_low_max.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@xe_gt_freq@freq_low_max.html

  * igt@xe_pat@pat-index-all:
    - {shard-lnl}:        [PASS][27] -> [DMESG-WARN][28] +1 other test dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-7/igt@xe_pat@pat-index-all.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@xe_pat@pat-index-all.html

  * igt@xe_pm@s3-basic:
    - {shard-lnl}:        [SKIP][29] ([Intel XE#584]) -> [FAIL][30]
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-8/igt@xe_pm@s3-basic.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@xe_pm@s3-basic.html

  
New tests
---------

  New tests have been introduced between xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf_full and xe-pw-132751v2_full:

### New IGT tests (1) ###

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl@a-edp-2:
    - Statuses : 1 incomplete(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in xe-pw-132751v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][31] ([Intel XE#1195] / [Intel XE#1365])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-9/igt@core_hotunplug@hotunplug-rescan.html

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1125] / [Intel XE#1201])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@intel_hwmon@hwmon-write.html

  * igt@kms_atomic@plane-invalid-params-fence:
    - shard-dg2-set2:     [PASS][33] -> [SKIP][34] ([Intel XE#1201] / [Intel XE#1226]) +3 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@kms_atomic@plane-invalid-params-fence.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_atomic@plane-invalid-params-fence.html

  * igt@kms_big_fb@linear-64bpp-rotate-180:
    - shard-dg2-set2:     [PASS][35] -> [SKIP][36] ([Intel XE#1201] / [Intel XE#829]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html
    - shard-adlp:         [PASS][37] -> [SKIP][38] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-2/igt@kms_big_fb@linear-64bpp-rotate-180.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_big_fb@linear-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][39] -> [FAIL][40] ([Intel XE#1204])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-8bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [FAIL][42] ([Intel XE#616]) +3 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][43] -> [FAIL][44] ([Intel XE#1231])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][45] ([Intel XE#1204])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1124] / [Intel XE#1201]) +7 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#1201] / [Intel XE#829])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_bw@linear-tiling-4-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-9/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1201] / [Intel XE#787]) +27 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][51] ([Intel XE#650]) +3 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +24 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#787]) +38 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_chamelium_hpd@common-hpd-after-hibernate:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#1201] / [Intel XE#373])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-storm:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-storm.html

  * igt@kms_content_protection@atomic@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][56] ([Intel XE#1178])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#308])
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][58] ([Intel XE#1214] / [Intel XE#282]) +2 other tests dmesg-warn
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_crc@cursor-sliding-max-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-max-size.html

  * igt@kms_cursor_edge_walk@128x128-left-edge:
    - shard-dg2-set2:     [PASS][60] -> [FAIL][61] ([Intel XE#581]) +1 other test fail
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-434/igt@kms_cursor_edge_walk@128x128-left-edge.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-left-edge.html
    - shard-adlp:         NOTRUN -> [FAIL][62] ([Intel XE#581])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_cursor_edge_walk@128x128-left-edge.html

  * igt@kms_cursor_edge_walk@64x64-top-bottom:
    - shard-adlp:         [PASS][63] -> [FAIL][64] ([Intel XE#581])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_cursor_edge_walk@64x64-top-bottom.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_cursor_edge_walk@64x64-top-bottom.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#309]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [PASS][66] -> [DMESG-WARN][67] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][69] -> [DMESG-WARN][70] ([Intel XE#1214] / [Intel XE#282]) +9 other tests dmesg-warn
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@single-move@pipe-a:
    - shard-dg2-set2:     [PASS][71] -> [DMESG-WARN][72] ([Intel XE#1214] / [Intel XE#877])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_cursor_legacy@single-move@pipe-a.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html

  * igt@kms_feature_discovery@display-2x:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#702])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#1201] / [Intel XE#310]) +4 other tests skip
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html

  * igt@kms_flip@dpms-off-confusion-interruptible:
    - shard-adlp:         [PASS][75] -> [SKIP][76] ([Intel XE#1201]) +5 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-4/igt@kms_flip@dpms-off-confusion-interruptible.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_flip@dpms-off-confusion-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [PASS][77] -> [FAIL][78] ([Intel XE#301])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][79] ([Intel XE#1214] / [Intel XE#1608]) +3 other tests dmesg-warn
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html

  * igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-dg2-set2:     [PASS][80] -> [SKIP][81] ([Intel XE#1201] / [Intel XE#1226] / [Intel XE#1235])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-434/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#1201] / [Intel XE#455]) +7 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [FAIL][83] ([Intel XE#422] / [Intel XE#616]) +1 other test fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-adlp:         NOTRUN -> [SKIP][84] ([Intel XE#1201] / [Intel XE#656]) +27 other tests skip
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][85] ([Intel XE#1201] / [Intel XE#651]) +8 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#653]) +9 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-stridechange:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#653])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [PASS][89] -> [SKIP][90] ([Intel XE#1201] / [Intel XE#1226] / [Intel XE#1234])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#305] / [Intel XE#455]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#305]) +2 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#870]) +1 other test skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#836])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@drm-resources-equal:
    - shard-adlp:         [PASS][95] -> [SKIP][96] ([Intel XE#1201] / [Intel XE#1211])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_pm_rpm@drm-resources-equal.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_pm_rpm@drm-resources-equal.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     [PASS][97] -> [SKIP][98] ([Intel XE#1201] / [Intel XE#1211]) +3 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-435/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][99] ([Intel XE#1201]) +4 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-cursor-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#929]) +2 other tests skip
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-blt.html

  * igt@kms_psr@fbc-pr-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1201] / [Intel XE#929]) +14 other tests skip
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_psr@fbc-pr-sprite-blt.html

  * igt@kms_psr_stress_test@invalidate-primary-flip-overlay:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#1149] / [Intel XE#1201])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html

  * igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][103] ([Intel XE#294]) +1 other test fail
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-dg2-set2:     [PASS][104] -> [FAIL][105] ([Intel XE#771] / [Intel XE#899])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][106] -> [FAIL][107] ([Intel XE#899])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][108] -> [SKIP][109] ([Intel XE#1201]) +2 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-463/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-434/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][110] -> [SKIP][111] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-463/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-434/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4.html

  * igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1:
    - shard-adlp:         [PASS][112] -> [SKIP][113] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-9/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [PASS][114] -> [DMESG-WARN][115] ([Intel XE#1162] / [Intel XE#1214])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][116] ([Intel XE#1214])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#1201] / [Intel XE#756])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_writeback@writeback-pixel-formats.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1062] / [Intel XE#1201])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][119] -> [INCOMPLETE][120] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-small:
    - shard-adlp:         NOTRUN -> [SKIP][121] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@xe_evict@evict-beng-small.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [PASS][122] -> [DMESG-FAIL][123] ([Intel XE#821])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1201] / [Intel XE#261]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][125] ([Intel XE#1201] / [Intel XE#688])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html

  * igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][126] -> [ABORT][127] ([Intel XE#1304])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-435/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:
    - shard-adlp:         NOTRUN -> [SKIP][128] ([Intel XE#1201] / [Intel XE#1392]) +4 other tests skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][129] ([Intel XE#1201] / [Intel XE#288]) +10 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][130] ([Intel XE#1201] / [Intel XE#288]) +3 other tests skip
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_gt_freq@freq_low_max:
    - shard-dg2-set2:     [PASS][131] -> [FAIL][132] ([Intel XE#1045] / [Intel XE#1204])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-464/igt@xe_gt_freq@freq_low_max.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@xe_gt_freq@freq_low_max.html

  * igt@xe_gt_freq@freq_suspend:
    - shard-adlp:         [PASS][133] -> [INCOMPLETE][134] ([Intel XE#1195])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [PASS][135] -> [SKIP][136] ([Intel XE#1192] / [Intel XE#1201])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-463/igt@xe_live_ktest@xe_bo.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-435/igt@xe_live_ktest@xe_bo.html

  * igt@xe_mmap@vram:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#1008] / [Intel XE#1201])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@xe_mmap@vram.html

  * igt@xe_module_load@many-reload:
    - shard-dg2-set2:     [PASS][138] -> [INCOMPLETE][139] ([Intel XE#1044] / [Intel XE#1195])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@xe_module_load@many-reload.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][140] ([Intel XE#1044] / [Intel XE#1195] / [Intel XE#1358])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][141] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-exec-after:
    - shard-adlp:         [PASS][142] -> [DMESG-WARN][143] ([Intel XE#1191] / [Intel XE#1214])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@xe_pm@s3-exec-after.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@xe_pm@s3-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         NOTRUN -> [FAIL][144] ([Intel XE#1043] / [Intel XE#845])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - shard-adlp:         NOTRUN -> [SKIP][145] ([Intel XE#1201] / [Intel XE#944]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
#### Possible fixes ####

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - shard-dg2-set2:     [SKIP][146] ([Intel XE#1201] / [i915#6077]) -> [PASS][147] +1 other test pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_addfb_basic@invalid-set-prop-any.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4:
    - shard-dg2-set2:     [FAIL][148] ([Intel XE#827]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][150] ([Intel XE#1214] / [Intel XE#324] / [Intel XE#358]) -> [PASS][151]
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
    - {shard-lnl}:        [DMESG-WARN][152] -> [PASS][153] +3 other tests pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html

  * igt@kms_big_fb@linear-16bpp-rotate-0:
    - {shard-lnl}:        [DMESG-FAIL][154] ([Intel XE#1619]) -> [PASS][155] +2 other tests pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-7/igt@kms_big_fb@linear-16bpp-rotate-0.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-7/igt@kms_big_fb@linear-16bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-180:
    - {shard-lnl}:        [FAIL][156] ([Intel XE#1659]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-2/igt@kms_big_fb@linear-16bpp-rotate-180.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-5/igt@kms_big_fb@linear-16bpp-rotate-180.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][158] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][159] +1 other test pass
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
    - {shard-lnl}:        [SKIP][160] ([Intel XE#829]) -> [PASS][161] +1 other test pass
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
    - shard-adlp:         [SKIP][162] ([Intel XE#1201] / [Intel XE#829]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][164] ([Intel XE#1231]) -> [PASS][165]
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_color@ctm-0-50:
    - shard-adlp:         [SKIP][166] ([Intel XE#1201]) -> [PASS][167] +10 other tests pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_color@ctm-0-50.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_color@ctm-0-50.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [DMESG-WARN][168] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][169] +2 other tests pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-dg2-set2:     [SKIP][170] ([Intel XE#1201]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_fbcon_fbt@fbc-suspend.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_fbcon_fbt@fbc-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [DMESG-WARN][172] ([Intel XE#1214]) -> [PASS][173] +4 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][174] ([Intel XE#324]) -> [PASS][175] +2 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][176] ([Intel XE#1201] / [Intel XE#1226]) -> [PASS][177] +9 other tests pass
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:
    - {shard-lnl}:        [SKIP][178] ([Intel XE#1641]) -> [PASS][179]
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_getfb@getfb2-handle-not-fb:
    - {shard-lnl}:        [SKIP][180] -> [PASS][181] +11 other tests pass
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-6/igt@kms_getfb@getfb2-handle-not-fb.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-1/igt@kms_getfb@getfb2-handle-not-fb.html
    - shard-adlp:         [SKIP][182] ([Intel XE#1201] / [Intel XE#687]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_getfb@getfb2-handle-not-fb.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_getfb@getfb2-handle-not-fb.html
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#1201] / [Intel XE#687]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_getfb@getfb2-handle-not-fb.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_getfb@getfb2-handle-not-fb.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#1201] / [Intel XE#417]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html
    - shard-adlp:         [SKIP][188] ([Intel XE#1201] / [Intel XE#417]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-6/igt@kms_hdmi_inject@inject-audio.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_plane_cursor@viewport:
    - shard-adlp:         [FAIL][190] ([Intel XE#581]) -> [PASS][191]
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_plane_cursor@viewport.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_plane_cursor@viewport.html
    - shard-dg2-set2:     [FAIL][192] ([Intel XE#581]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_plane_cursor@viewport.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_plane_cursor@viewport.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     [FAIL][194] ([Intel XE#1203]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_pm_rpm@basic-rte.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_pm_rpm@cursor-dpms:
    - {shard-lnl}:        [SKIP][196] ([Intel XE#1211]) -> [PASS][197] +1 other test pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-7/igt@kms_pm_rpm@cursor-dpms.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-2/igt@kms_pm_rpm@cursor-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][199] +1 other test pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-b-edp-1:
    - {shard-lnl}:        [DMESG-WARN][200] ([Intel XE#1330]) -> [PASS][201] +6 other tests pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-1/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-b-edp-1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-5/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-b-edp-1.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - {shard-lnl}:        [DMESG-WARN][202] ([Intel XE#1689]) -> [PASS][203]
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-7/igt@kms_psr@fbc-psr2-no-drrs.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-2/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_rotation_crc@primary-rotation-180:
    - {shard-lnl}:        [FAIL][204] ([Intel XE#1491]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-180.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@kms_rotation_crc@primary-rotation-180.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [FAIL][206] ([Intel XE#771] / [Intel XE#899]) -> [PASS][207]
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [FAIL][208] ([Intel XE#899]) -> [PASS][209] +1 other test pass
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@xe_exec_compute_mode@lr-mode-workload:
    - shard-adlp:         [FAIL][210] ([Intel XE#1396]) -> [PASS][211]
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-2/igt@xe_exec_compute_mode@lr-mode-workload.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@xe_exec_compute_mode@lr-mode-workload.html

  * igt@xe_exec_fault_mode@many-execqueues-basic:
    - {shard-lnl}:        [INCOMPLETE][212] -> [PASS][213] +1 other test pass
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-basic.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-basic.html

  * igt@xe_exec_reset@cm-close-fd:
    - {shard-lnl}:        [INCOMPLETE][214] ([Intel XE#1330]) -> [PASS][215]
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-3/igt@xe_exec_reset@cm-close-fd.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-6/igt@xe_exec_reset@cm-close-fd.html

  * igt@xe_exec_threads@threads-cm-fd-basic:
    - {shard-lnl}:        [DMESG-FAIL][216] ([Intel XE#1069] / [Intel XE#1537] / [Intel XE#1619]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-7/igt@xe_exec_threads@threads-cm-fd-basic.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-7/igt@xe_exec_threads@threads-cm-fd-basic.html

  * igt@xe_exec_threads@threads-hang-basic:
    - {shard-lnl}:        [FAIL][218] ([Intel XE#1256]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-3/igt@xe_exec_threads@threads-hang-basic.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@xe_exec_threads@threads-hang-basic.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - {shard-lnl}:        [FAIL][220] ([Intel XE#1081]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-5/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-7/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_gt_freq@freq_fixed_idle:
    - {shard-lnl}:        [SKIP][222] ([Intel XE#1462]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-1/igt@xe_gt_freq@freq_fixed_idle.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-2/igt@xe_gt_freq@freq_fixed_idle.html

  * igt@xe_pm@d3hot-basic:
    - shard-dg2-set2:     [FAIL][224] ([Intel XE#355]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@xe_pm@d3hot-basic.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@xe_pm@d3hot-basic.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][226] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][227] +2 other tests pass
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-adlp:         [DMESG-WARN][228] ([Intel XE#1191] / [Intel XE#1214]) -> [PASS][229] +1 other test pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - {shard-lnl}:        [FAIL][230] -> [PASS][231]
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-7/igt@xe_pm_residency@gt-c6-on-idle.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-6/igt@xe_pm_residency@gt-c6-on-idle.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [INCOMPLETE][232] ([Intel XE#1195]) -> [ABORT][233] ([Intel XE#1538] / [Intel XE#1689])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-9/igt@core_hotunplug@hotreplug.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@core_hotunplug@hotreplug.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][234] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#324] / [Intel XE#358]) -> [DMESG-WARN][235] ([Intel XE#1033] / [Intel XE#1214] / [Intel XE#358])
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-90:
    - shard-adlp:         [SKIP][236] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][237] ([Intel XE#1201] / [Intel XE#316])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-dg2-set2:     [SKIP][238] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][239] ([Intel XE#1124] / [Intel XE#1201]) +2 other tests skip
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
    - shard-adlp:         [SKIP][240] ([Intel XE#1201] / [Intel XE#829]) -> [FAIL][241] ([Intel XE#1231])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][243] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
    - shard-adlp:         [FAIL][244] ([Intel XE#616]) -> [SKIP][245] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][246] ([Intel XE#1231]) -> [DMESG-FAIL][247] ([Intel XE#324])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-270:
    - shard-adlp:         [SKIP][248] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][249] ([Intel XE#1124] / [Intel XE#1201])
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-adlp:         [INCOMPLETE][250] ([Intel XE#1195] / [Intel XE#1330]) -> [SKIP][251] ([Intel XE#1201] / [Intel XE#367])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][253] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][255] ([Intel XE#1201] / [Intel XE#1252])
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
    - shard-adlp:         [SKIP][256] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][257] ([Intel XE#1201] / [Intel XE#1252])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-adlp:         [SKIP][258] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][259] ([Intel XE#1201] / [Intel XE#829]) +1 other test skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][261] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
    - shard-adlp:         [SKIP][262] ([Intel XE#1201] / [Intel XE#829]) -> [SKIP][263] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787])
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][265] ([Intel XE#1201] / [Intel XE#1226]) +2 other tests skip
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
    - shard-adlp:         [SKIP][266] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][267] ([Intel XE#1201]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html

  * igt@kms_content_protection@atomic:
    - shard-adlp:         [SKIP][268] ([Intel XE#1201] / [Intel XE#1210]) -> [SKIP][269] ([Intel XE#1201] / [Intel XE#455])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_content_protection@atomic.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_content_protection@atomic.html
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#1201] / [Intel XE#1226]) -> [FAIL][271] ([Intel XE#1178])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_content_protection@atomic.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_content_protection@atomic.html

  * igt@kms_cursor_crc@cursor-random-256x256:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#1201] / [Intel XE#1226]) -> [DMESG-WARN][273] ([Intel XE#1214] / [Intel XE#282]) +1 other test dmesg-warn
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_cursor_crc@cursor-random-256x256.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_cursor_crc@cursor-random-256x256.html

  * igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][274] ([Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][275] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:
    - shard-dg2-set2:     [DMESG-WARN][276] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][277] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html

  * igt@kms_cursor_legacy@single-move:
    - shard-dg2-set2:     [DMESG-WARN][278] ([Intel XE#1214] / [Intel XE#282]) -> [DMESG-WARN][279] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#877])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_cursor_legacy@single-move.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-435/igt@kms_cursor_legacy@single-move.html

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-adlp:         [SKIP][280] ([Intel XE#1201]) -> [SKIP][281] ([Intel XE#1201] / [Intel XE#310])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-adlp:         [DMESG-WARN][282] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][283] ([Intel XE#1195] / [Intel XE#927])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [INCOMPLETE][284] ([Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][285] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [INCOMPLETE][286] ([Intel XE#1195]) -> [DMESG-WARN][287] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][288] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][289] ([Intel XE#1195])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][291] ([Intel XE#1201] / [Intel XE#1226])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
    - shard-adlp:         [SKIP][292] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][293] ([Intel XE#1201])
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][295] ([Intel XE#1201] / [Intel XE#1226]) +2 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
    - shard-adlp:         [SKIP][296] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][297] ([Intel XE#1201])
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:
    - shard-adlp:         [SKIP][298] ([Intel XE#1201]) -> [SKIP][299] ([Intel XE#1201] / [Intel XE#656]) +4 other tests skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         [SKIP][300] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][301] ([Intel XE#1201]) +3 other tests skip
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][303] ([Intel XE#1201] / [Intel XE#651]) +3 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][305] ([Intel XE#1201] / [Intel XE#653]) +4 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-adlp:         [SKIP][306] ([Intel XE#1201] / [Intel XE#1210]) -> [SKIP][307] ([Intel XE#1201] / [Intel XE#653])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:
    - shard-adlp:         [SKIP][308] ([Intel XE#1201]) -> [SKIP][309] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][310] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][311] ([Intel XE#1201] / [Intel XE#1226]) +2 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
    - shard-adlp:         [SKIP][312] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][313] ([Intel XE#1201])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-adlp:         [DMESG-WARN][314] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][315] ([Intel XE#1035] / [Intel XE#1195] / [Intel XE#927])
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:
    - shard-adlp:         [DMESG-WARN][316] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][317] ([Intel XE#1195] / [Intel XE#927])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [DMESG-FAIL][318] ([Intel XE#1162]) -> [FAIL][319] ([Intel XE#616]) +1 other test fail
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:
    - shard-dg2-set2:     [TIMEOUT][320] ([Intel XE#380] / [Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][321] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [TIMEOUT][322] ([Intel XE#904] / [Intel XE#909]) -> [INCOMPLETE][323] ([Intel XE#1195] / [Intel XE#904] / [Intel XE#909])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-adlp:         [SKIP][324] ([Intel XE#1201]) -> [SKIP][325] ([Intel XE#1122] / [Intel XE#1201])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][327] ([Intel XE#1122] / [Intel XE#1201])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         [SKIP][328] ([Intel XE#1201] / [Intel XE#836]) -> [SKIP][329] ([Intel XE#1201] / [Intel XE#1211])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][331] ([Intel XE#1201] / [Intel XE#1226])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-plane-move.html
    - shard-adlp:         [SKIP][332] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][333] ([Intel XE#1201])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-4/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@psr2-dpms:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#1201] / [Intel XE#1226]) -> [SKIP][335] ([Intel XE#1201] / [Intel XE#929]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_psr@psr2-dpms.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_psr@psr2-dpms.html
    - shard-adlp:         [SKIP][336] ([Intel XE#1201]) -> [SKIP][337] ([Intel XE#1201] / [Intel XE#929])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_psr@psr2-dpms.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_psr@psr2-dpms.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#1201]) -> [SKIP][339] ([Intel XE#1201] / [Intel XE#362])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][340] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][341] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [DMESG-FAIL][342] ([Intel XE#482]) -> [TIMEOUT][343] ([Intel XE#1473] / [Intel XE#392])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][344] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][345] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@xe_evict@evict-threads-large.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_reset@cm-cat-error:
    - shard-adlp:         [DMESG-FAIL][346] ([Intel XE#1068]) -> [DMESG-FAIL][347] ([Intel XE#1068] / [Intel XE#358])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][348] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [DMESG-WARN][349] ([Intel XE#1214] / [Intel XE#1608])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][350] ([Intel XE#1191] / [Intel XE#1214]) -> [WARN][351] ([Intel XE#1639])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@xe_pm@s3-d3hot-basic-exec.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-basic-exec:
    - shard-dg2-set2:     [FAIL][352] ([Intel XE#1043] / [Intel XE#845]) -> [DMESG-FAIL][353] ([Intel XE#1162])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@xe_pm@s4-basic-exec.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@xe_pm@s4-basic-exec.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1043]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1045]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1068]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1081]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1203]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1210]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1210
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234
  [Intel XE#1235]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1256]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256
  [Intel XE#1304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1396
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1413
  [Intel XE#1420]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1420
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1446
  [Intel XE#1462]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462
  [Intel XE#1467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1467
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
  [Intel XE#1494]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1494
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1512
  [Intel XE#1537]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1558]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1558
  [Intel XE#1577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1577
  [Intel XE#1595]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1595
  [Intel XE#1602]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1602
  [Intel XE#1603]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1603
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619
  [Intel XE#1639]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1639
  [Intel XE#1641]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1641
  [Intel XE#1647]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1647
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/294
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#305]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/305
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/355
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#362]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/362
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/380
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#422]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/422
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#581]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/581
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/687
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
  [Intel XE#827]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/827
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#845]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/845
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/904
  [Intel XE#909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/909
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * IGT: IGT_7816 -> IGT_7818
  * Linux: xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf -> xe-pw-132751v2

  IGT_7816: 2e8f3e06fbd7335cf65a93115c72f0e167a570a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7818: 8e68eb5f6393f1be25ff775c094b427243a6a403 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf: 861eed75446fe9dbac9d28d11f44caa47cebeebf
  xe-pw-132751v2: 132751v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/index.html

--===============0192887540540839521==
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
<tr><td><b>Series:</b></td><td>drm/xe/vm: Use xe_vm_lock() helper for locking (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132751/">https://patchwork.freedesktop.org/series/132751/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf_full -&gt; xe-pw-132751v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132751v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132751v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132751v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>{igt@kms_dirtyfb@psr-dirtyfb-ioctl@a-edp-2} (NEW):</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@kms_dirtyfb@psr-dirtyfb-ioctl@a-edp-2.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@b-hdmi-a6.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-5/igt@kms_atomic@plane-invalid-params-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@kms_atomic@plane-invalid-params-fence.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>{igt@kms_atomic@test-only@pipe-a-edp-2}:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@kms_atomic@test-only@pipe-a-edp-2.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-0:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-6/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1494">Intel XE#1494</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-7/igt@kms_big_fb@linear-64bpp-rotate-0.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-x:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-linear-to-x.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-onoff.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>{shard-lnl}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-invalid-fault:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-6/igt@xe_exec_fault_mode@many-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@xe_exec_fault_mode@many-invalid-fault.html">INCOMPLETE</a> +5 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_low_max:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-8/igt@xe_gt_freq@freq_low_max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@xe_gt_freq@freq_low_max.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-all:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-7/igt@xe_pat@pat-index-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@xe_pat@pat-index-all.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-8/igt@xe_pm@s3-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">Intel XE#584</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@xe_pm@s3-basic.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf_full and xe-pw-132751v2_full:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@kms_dirtyfb@psr-dirtyfb-ioctl@a-edp-2:<ul>
<li>Statuses : 1 incomplete(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132751v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-9/igt@core_hotunplug@hotunplug-rescan.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365">Intel XE#1365</a>)</li>
</ul>
</li>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@intel_hwmon@hwmon-write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125">Intel XE#1125</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-invalid-params-fence:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@kms_atomic@plane-invalid-params-fence.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_atomic@plane-invalid-params-fence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_big_fb@linear-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-2/igt@kms_big_fb@linear-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_big_fb@linear-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_big_fb@y-tiled-8bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-9/igt@kms_bw@linear-tiling-4-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-434/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-rc-ccs-cc@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-c-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-yf-tiled-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +38 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@common-hpd-after-hibernate:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_chamelium_hpd@common-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-storm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_chamelium_hpd@dp-hpd-storm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_content_protection@atomic@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-434/igt@kms_cursor_crc@cursor-rapid-movement-256x256@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-max-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_cursor_crc@cursor-sliding-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-left-edge:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-434/igt@kms_cursor_edge_walk@128x128-left-edge.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_cursor_edge_walk@128x128-left-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>) +1 other test fail</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_cursor_edge_walk@128x128-left-edge.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-top-bottom:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_cursor_edge_walk@64x64-top-bottom.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_cursor_edge_walk@64x64-top-bottom.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +9 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move@pipe-a:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_cursor_legacy@single-move@pipe-a.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-435/igt@kms_cursor_legacy@single-move@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-off-confusion-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-4/igt@kms_flip@dpms-off-confusion-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_flip@dpms-off-confusion-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-434/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_flip@single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1235">Intel XE#1235</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-xtile-to-64bpp-xtile-upscaling@pipe-a-valid-mode.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/422">Intel XE#422</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-stridechange:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-stridechange.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1234">Intel XE#1234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/305">Intel XE#305</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@drm-resources-equal:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_pm_rpm@drm-resources-equal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_pm_rpm@drm-resources-equal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-434/igt@kms_pm_rpm@system-suspend-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-435/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_psr@fbc-pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_psr@fbc-pr-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@invalidate-primary-flip-overlay:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_psr_stress_test@invalidate-primary-flip-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1149">Intel XE#1149</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_rmfb@close-fd@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/294">Intel XE#294</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-434/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-463/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-434/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-463/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-434/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-9/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_vblank@ts-continuation-modeset-rpm@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_vblank@ts-continuation-suspend@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@xe_evict@evict-beng-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@xe_evict@evict-mixed-many-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-435/igt@xe_exec_balancer@no-exec-cm-virtual-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304">Intel XE#1304</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_low_max:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-464/igt@xe_gt_freq@freq_low_max.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@xe_gt_freq@freq_low_max.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1045">Intel XE#1045</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@xe_gt_freq@freq_suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-463/igt@xe_live_ktest@xe_bo.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-435/igt@xe_live_ktest@xe_bo.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@xe_module_load@many-reload.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@xe_pm@s2idle-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@xe_pm@s3-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@xe_pm@s3-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +3 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_addfb_basic@invalid-set-prop-any.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/827">Intel XE#827</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_async_flips@alternate-sync-async-flip@pipe-a-dp-4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-7/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-0:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-7/igt@kms_big_fb@linear-16bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-7/igt@kms_big_fb@linear-16bpp-rotate-0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-180:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-2/igt@kms_big_fb@linear-16bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-5/igt@kms_big_fb@linear-16bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">PASS</a> +1 other test pass</li>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-5/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">PASS</a> +1 other test pass</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_color@ctm-0-50.html">PASS</a> +10 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-464/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@fbc-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_fbcon_fbt@fbc-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_fbcon_fbt@fbc-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-435/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a6.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-indfb-draw-blt.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1641">Intel XE#1641</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-render.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-handle-not-fb:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-6/igt@kms_getfb@getfb2-handle-not-fb.html">SKIP</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-1/igt@kms_getfb@getfb2-handle-not-fb.html">PASS</a> +11 other tests pass</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_getfb@getfb2-handle-not-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_getfb@getfb2-handle-not-fb.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_getfb@getfb2-handle-not-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/687">Intel XE#687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_getfb@getfb2-handle-not-fb.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-434/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-435/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-6/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_hdmi_inject@inject-audio.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_plane_cursor@viewport.html">PASS</a></li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_plane_cursor@viewport.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/581">Intel XE#581</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_plane_cursor@viewport.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_pm_rpm@basic-rte.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1203">Intel XE#1203</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_pm_rpm@basic-rte.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@cursor-dpms:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-7/igt@kms_pm_rpm@cursor-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-2/igt@kms_pm_rpm@cursor-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_pm_rpm@modeset-non-lpsp.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-b-edp-1:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-1/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-b-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-5/igt@kms_psr2_sf@fbc-plane-move-sf-dmg-area@psr2-pipe-b-edp-1.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-7/igt@kms_psr@fbc-psr2-no-drrs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689">Intel XE#1689</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-2/igt@kms_psr@fbc-psr2-no-drrs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-180:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-2/igt@kms_rotation_crc@primary-rotation-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491">Intel XE#1491</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@kms_rotation_crc@primary-rotation-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@lr-mode-workload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-2/igt@xe_exec_compute_mode@lr-mode-workload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1396">Intel XE#1396</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@xe_exec_compute_mode@lr-mode-workload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-basic:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-2/igt@xe_exec_fault_mode@many-execqueues-basic.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@xe_exec_fault_mode@many-execqueues-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-3/igt@xe_exec_reset@cm-close-fd.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-6/igt@xe_exec_reset@cm-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-basic:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-7/igt@xe_exec_threads@threads-cm-fd-basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1537">Intel XE#1537</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1619">Intel XE#1619</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-7/igt@xe_exec_threads@threads-cm-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-basic:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-3/igt@xe_exec_threads@threads-hang-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1256">Intel XE#1256</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-8/igt@xe_exec_threads@threads-hang-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-5/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1081">Intel XE#1081</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-7/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_idle:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-1/igt@xe_gt_freq@freq_fixed_idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1462">Intel XE#1462</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-2/igt@xe_gt_freq@freq_fixed_idle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@xe_pm@d3hot-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@xe_pm@d3hot-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@xe_pm@s3-basic-exec.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@xe_pm@s3-multiple-execs.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>{shard-lnl}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-lnl-7/igt@xe_pm_residency@gt-c6-on-idle.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-lnl-6/igt@xe_pm_residency@gt-c6-on-idle.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-9/igt@core_hotunplug@hotreplug.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689">Intel XE#1689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_async_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_big_fb@y-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-434/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_big_fb@yf-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-9/igt@kms_ccs@crc-primary-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-9/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-434/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-6/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-with-enabled-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1210">Intel XE#1210</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_content_protection@atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-256x256:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_cursor_crc@cursor-random-256x256.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_cursor_crc@cursor-random-256x256.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-6/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_cursor_crc@cursor-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@single-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-435/igt@kms_cursor_legacy@single-move.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-2/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-2/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-9/igt@kms_flip@flip-vs-suspend@a-hdmi-a1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1210">Intel XE#1210</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-shrfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-1/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-a.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/380">Intel XE#380</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-464/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-pixel-format@pipe-a-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/904">Intel XE#904</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/909">Intel XE#909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-6/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-464/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-4/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1226">Intel XE#1226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-4/igt@kms_psr@psr2-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/362">Intel XE#362</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-433/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@xe_evict@evict-beng-mixed-many-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-436/igt@xe_evict@evict-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-cat-error:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-1/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068">Intel XE#1068</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@xe_exec_reset@cm-cat-error.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1068">Intel XE#1068</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-adlp-8/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-adlp-2/igt@xe_pm@s3-d3hot-basic-exec.html">WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1639">Intel XE#1639</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf/shard-dg2-435/igt@xe_pm@s4-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1043">Intel XE#1043</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/845">Intel XE#845</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132751v2/shard-dg2-466/igt@xe_pm@s4-basic-exec.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7816 -&gt; IGT_7818</li>
<li>Linux: xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf -&gt; xe-pw-132751v2</li>
</ul>
<p>IGT_7816: 2e8f3e06fbd7335cf65a93115c72f0e167a570a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7818: 8e68eb5f6393f1be25ff775c094b427243a6a403 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1159-861eed75446fe9dbac9d28d11f44caa47cebeebf: 861eed75446fe9dbac9d28d11f44caa47cebeebf<br />
  xe-pw-132751v2: 132751v2</p>

</body>
</html>

--===============0192887540540839521==--
