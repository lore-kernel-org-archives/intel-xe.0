Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD05BC4345F
	for <intel-xe@archiver.kernel.org>; Sun, 21 Apr 2024 05:13:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 226E511215C;
	Sun, 21 Apr 2024 05:13:32 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C0B83112156;
 Sun, 21 Apr 2024 05:13:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4250076472061045969=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/hwmon=3A_Remove_unwanted?=
 =?utf-8?q?_write_permission_for_currN=5Flabel?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 21 Apr 2024 05:13:30 -0000
Message-ID: <171367641078.1553548.16381443299561697838@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240419125945.4085629-1-karthik.poosa@intel.com>
In-Reply-To: <20240419125945.4085629-1-karthik.poosa@intel.com>
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

--===============4250076472061045969==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hwmon: Remove unwanted write permission for currN_label
URL   : https://patchwork.freedesktop.org/series/132643/
State : failure

== Summary ==

CI Bug Log - changes from xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724_full -> xe-pw-132643v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-132643v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-132643v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-132643v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][1] -> [FAIL][2] +1 other test fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html

  * igt@xe_exec_compute_mode@many-basic:
    - shard-adlp:         NOTRUN -> [ABORT][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@xe_exec_compute_mode@many-basic.html

  * igt@xe_vm@large-userptr-split-misaligned-binds-134217728:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][4] +4 other tests dmesg-fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@xe_vm@large-userptr-split-misaligned-binds-134217728.html

  
#### Warnings ####

  * igt@xe_exec_compute_mode@lr-mode-workload:
    - shard-adlp:         [FAIL][5] ([Intel XE#1396]) -> [ABORT][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-9/igt@xe_exec_compute_mode@lr-mode-workload.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-9/igt@xe_exec_compute_mode@lr-mode-workload.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_pm@s3-vm-bind-unbind-all}:
    - shard-adlp:         NOTRUN -> [FAIL][7]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@xe_pm@s3-vm-bind-unbind-all.html

  
Known issues
------------

  Here are the changes found in xe-pw-132643v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][8] ([Intel XE#1185] / [Intel XE#1201]) +7 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#1201] / [Intel XE#829])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][10] ([Intel XE#1231])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][11] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][12] ([Intel XE#1204])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][13] ([Intel XE#1124] / [Intel XE#1201]) +1 other test skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html

  * igt@kms_big_joiner@basic-force-joiner:
    - shard-dg2-set2:     [PASS][14] -> [SKIP][15] ([Intel XE#1201])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-433/igt@kms_big_joiner@basic-force-joiner.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-464/igt@kms_big_joiner@basic-force-joiner.html
    - shard-adlp:         NOTRUN -> [SKIP][16] ([Intel XE#1201])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_big_joiner@basic-force-joiner.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +11 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [SKIP][18] ([Intel XE#1201] / [Intel XE#787]) +47 other tests skip
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-7.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7:
    - shard-dg2-set2:     NOTRUN -> [FAIL][19] ([Intel XE#650]) +7 other tests fail
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7.html

  * igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][20] ([Intel XE#1201] / [Intel XE#787]) +17 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][22] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:
    - shard-adlp:         NOTRUN -> [SKIP][23] ([Intel XE#1201] / [Intel XE#373])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html

  * igt@kms_content_protection@legacy@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][24] ([Intel XE#1178])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-434/igt@kms_content_protection@legacy@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][25] ([Intel XE#1201] / [Intel XE#308])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][26] ([Intel XE#1195] / [Intel XE#927])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:
    - shard-dg2-set2:     [PASS][27] -> [DMESG-WARN][28] ([Intel XE#1214] / [Intel XE#282]) +10 other tests dmesg-warn
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html

  * igt@kms_cursor_legacy@cursor-vs-flip-legacy:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][29] ([Intel XE#1214])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:
    - shard-adlp:         NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#455]) +10 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][32] ([Intel XE#1201] / [Intel XE#651]) +7 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#653]) +5 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#656]) +15 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-set2:     [PASS][37] -> [SKIP][38] ([Intel XE#1201] / [Intel XE#1211]) +2 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@legacy-planes-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][39] ([Intel XE#1201] / [Intel XE#1211])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_pm_rpm@legacy-planes-dpms.html

  * igt@kms_properties@crtc-properties-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1201]) +2 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@kms_properties@crtc-properties-legacy.html

  * igt@kms_psr@fbc-psr-cursor-blt:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#929]) +6 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_psr@fbc-psr-cursor-blt.html

  * igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:
    - shard-adlp:         NOTRUN -> [FAIL][42] ([Intel XE#616]) +2 other tests fail
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_sequence@get-busy@pipe-d-dp-4:
    - shard-dg2-set2:     [PASS][44] -> [INCOMPLETE][45] ([Intel XE#1195]) +2 other tests incomplete
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-466/igt@kms_sequence@get-busy@pipe-d-dp-4.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-433/igt@kms_sequence@get-busy@pipe-d-dp-4.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][46] ([Intel XE#1214] / [Intel XE#1608])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html

  * igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-2:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][47] ([Intel XE#1195]) +2 other tests incomplete
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-2.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1201] / [Intel XE#756])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@xe_evict@evict-beng-cm-threads-large:
    - shard-dg2-set2:     [PASS][49] -> [TIMEOUT][50] ([Intel XE#1473] / [Intel XE#392])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html

  * igt@xe_evict@evict-beng-cm-threads-large-multi-vm:
    - shard-dg2-set2:     [PASS][51] -> [TIMEOUT][52] ([Intel XE#1206] / [Intel XE#1259] / [Intel XE#1473])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html

  * igt@xe_evict@evict-cm-threads-small:
    - shard-dg2-set2:     [PASS][53] -> [FAIL][54] ([Intel XE#1259])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-434/igt@xe_evict@evict-cm-threads-small.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-434/igt@xe_evict@evict-cm-threads-small.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#261])
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][56] -> [TIMEOUT][57] ([Intel XE#1473])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:
    - shard-adlp:         NOTRUN -> [SKIP][58] ([Intel XE#1201] / [Intel XE#688])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html

  * igt@xe_exec_balancer@once-cm-parallel-rebind:
    - shard-adlp:         NOTRUN -> [FAIL][59] ([Intel XE#1069])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@xe_exec_balancer@once-cm-parallel-rebind.html

  * igt@xe_exec_balancer@once-virtual-userptr-rebind:
    - shard-dg2-set2:     [PASS][60] -> [DMESG-WARN][61] ([Intel XE#1214]) +1 other test dmesg-warn
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-433/igt@xe_exec_balancer@once-virtual-userptr-rebind.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-433/igt@xe_exec_balancer@once-virtual-userptr-rebind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][62] ([Intel XE#1201] / [Intel XE#1392]) +2 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#288]) +7 other tests skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#288])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-fd-userptr-rebind:
    - shard-dg2-set2:     [PASS][65] -> [INCOMPLETE][66] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-464/igt@xe_exec_threads@threads-fd-userptr-rebind.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-463/igt@xe_exec_threads@threads-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-rebind:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][67] ([Intel XE#1069])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@xe_exec_threads@threads-mixed-shared-vm-rebind.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#977])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-adlp:         NOTRUN -> [FAIL][69] ([Intel XE#958])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_query@multigpu-query-config:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@xe_query@multigpu-query-config.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-dg2-set2:     [DMESG-WARN][71] ([Intel XE#1214] / [Intel XE#282] / [Intel XE#910]) -> [PASS][72]
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-dg2-set2:     [DMESG-WARN][73] ([Intel XE#1214] / [Intel XE#282]) -> [PASS][74]
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_dp_aux_dev:
    - shard-dg2-set2:     [SKIP][75] ([Intel XE#1201]) -> [PASS][76] +1 other test pass
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-464/igt@kms_dp_aux_dev.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-463/igt@kms_dp_aux_dev.html

  * igt@kms_pm_rpm@modeset-stress-extra-wait:
    - shard-dg2-set2:     [SKIP][77] ([Intel XE#1201] / [Intel XE#1211]) -> [PASS][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@kms_pm_rpm@modeset-stress-extra-wait.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [DMESG-WARN][79] ([Intel XE#1162] / [Intel XE#1214]) -> [PASS][80]
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html

  * igt@xe_evict@evict-beng-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][81] ([Intel XE#1041]) -> [PASS][82]
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [DMESG-FAIL][83] ([Intel XE#821]) -> [PASS][84]
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [TIMEOUT][85] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][86]
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-464/igt@xe_evict@evict-threads-large.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     [ABORT][87] ([Intel XE#1304] / [Intel XE#1364]) -> [PASS][88]
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [TIMEOUT][89] ([Intel XE#1261] / [Intel XE#1356] / [Intel XE#402]) -> [PASS][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-464/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-463/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:
    - shard-dg2-set2:     [TIMEOUT][91] ([Intel XE#1206] / [Intel XE#1261] / [Intel XE#1356]) -> [PASS][92] +1 other test pass
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html

  * igt@xe_exec_threads@threads-hang-fd-userptr-rebind:
    - shard-dg2-set2:     [TIMEOUT][93] ([Intel XE#1206] / [Intel XE#1356]) -> [PASS][94]
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html

  * igt@xe_exec_threads@threads-mixed-fd-userptr:
    - shard-dg2-set2:     [INCOMPLETE][95] ([Intel XE#1169] / [Intel XE#1195] / [Intel XE#1356] / [Intel XE#1376]) -> [PASS][96]
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-466/igt@xe_exec_threads@threads-mixed-fd-userptr.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-433/igt@xe_exec_threads@threads-mixed-fd-userptr.html

  * igt@xe_pm@d3hot-basic-exec:
    - shard-dg2-set2:     [FAIL][97] ([Intel XE#355]) -> [PASS][98]
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@xe_pm@d3hot-basic-exec.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@xe_pm@d3hot-basic-exec.html

  
#### Warnings ####

  * igt@core_hotunplug@hotreplug:
    - shard-adlp:         [INCOMPLETE][99] ([Intel XE#1195]) -> [ABORT][100] ([Intel XE#1538] / [Intel XE#1689])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-1/igt@core_hotunplug@hotreplug.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@core_hotunplug@hotreplug.html

  * igt@core_hotunplug@hotunplug-rescan:
    - shard-adlp:         [INCOMPLETE][101] ([Intel XE#1195] / [Intel XE#1365]) -> [ABORT][102] ([Intel XE#1689])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-1/igt@core_hotunplug@hotunplug-rescan.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-4/igt@core_hotunplug@hotunplug-rescan.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][103] ([Intel XE#1231]) -> [DMESG-FAIL][104] ([Intel XE#324])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][105] ([Intel XE#324]) -> [FAIL][106] ([Intel XE#1231])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         [FAIL][107] ([Intel XE#1231]) -> [FAIL][108] ([Intel XE#1242])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_content_protection@legacy:
    - shard-dg2-set2:     [SKIP][109] ([Intel XE#1201] / [Intel XE#455]) -> [FAIL][110] ([Intel XE#1178])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-464/igt@kms_content_protection@legacy.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-434/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][111] ([Intel XE#1188]) -> [SKIP][112] ([Intel XE#1201] / [Intel XE#455])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@kms_content_protection@uevent.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-464/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursor-vs-flip-atomic:
    - shard-adlp:         [INCOMPLETE][113] ([Intel XE#1195] / [Intel XE#1330]) -> [DMESG-WARN][114] ([Intel XE#1088] / [Intel XE#1214] / [Intel XE#1330])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [DMESG-WARN][115] ([Intel XE#1214]) -> [INCOMPLETE][116] ([Intel XE#1195])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:
    - shard-dg2-set2:     [FAIL][117] ([Intel XE#616]) -> [DMESG-FAIL][118] ([Intel XE#1162]) +1 other test dmesg-fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-adlp:         [DMESG-WARN][119] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][120] ([Intel XE#1034] / [Intel XE#1195])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][121] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][122] ([Intel XE#1034] / [Intel XE#1195])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-adlp:         [INCOMPLETE][123] ([Intel XE#1034] / [Intel XE#1195] / [Intel XE#927]) -> [DMESG-WARN][124] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:
    - shard-adlp:         [INCOMPLETE][125] ([Intel XE#1034] / [Intel XE#1195]) -> [DMESG-WARN][126] ([Intel XE#1191] / [Intel XE#1214])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][127] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][128] ([Intel XE#1473] / [Intel XE#392] / [Intel XE#931])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][129] ([Intel XE#1473]) -> [TIMEOUT][130] ([Intel XE#1473] / [Intel XE#821])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][131] ([Intel XE#1473] / [Intel XE#392]) -> [TIMEOUT][132] ([Intel XE#1041] / [Intel XE#1473] / [Intel XE#392])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-rebind:
    - shard-adlp:         [DMESG-FAIL][133] ([Intel XE#1069] / [Intel XE#1088] / [Intel XE#1330]) -> [DMESG-WARN][134] ([Intel XE#1088] / [Intel XE#1214] / [Intel XE#1330])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-1/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         [DMESG-WARN][135] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608]) -> [INCOMPLETE][136] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-multiple-execs:
    - shard-adlp:         [INCOMPLETE][137] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#927]) -> [DMESG-WARN][138] ([Intel XE#1191] / [Intel XE#1214] / [Intel XE#1608])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@xe_pm@s2idle-multiple-execs.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         [DMESG-WARN][139] ([Intel XE#1191] / [Intel XE#1214]) -> [INCOMPLETE][140] ([Intel XE#1195] / [Intel XE#1358])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-2/igt@xe_pm@s3-basic.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-9/igt@xe_pm@s3-basic.html

  * igt@xe_vm@mixed-userptr-misaligned-binds-1611661312:
    - shard-adlp:         [DMESG-FAIL][141] ([Intel XE#1088] / [Intel XE#1330]) -> [INCOMPLETE][142] ([Intel XE#1195] / [Intel XE#1330])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-8/igt@xe_vm@mixed-userptr-misaligned-binds-1611661312.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-9/igt@xe_vm@mixed-userptr-misaligned-binds-1611661312.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1034]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034
  [Intel XE#1041]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1169]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1185]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1185
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1206]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206
  [Intel XE#1211]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211
  [Intel XE#1214]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1259]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259
  [Intel XE#1261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261
  [Intel XE#1304]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304
  [Intel XE#1330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330
  [Intel XE#1356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1364]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1364
  [Intel XE#1365]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1396]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1396
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1538]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538
  [Intel XE#1608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608
  [Intel XE#1689]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#355]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/355
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#650]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/650
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/821
  [Intel XE#829]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/829
  [Intel XE#910]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/910
  [Intel XE#927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/927
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#931]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/931
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * Linux: xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724 -> xe-pw-132643v1

  IGT_7814: 7814
  xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724: a6272ececd0c019dbb4b9e20dfd2026b7e299724
  xe-pw-132643v1: 132643v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/index.html

--===============4250076472061045969==
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
<tr><td><b>Series:</b></td><td>drm/xe/hwmon: Remove unwanted write permission for currN_label</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132643/">https://patchwork.freedesktop.org/series/132643/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724_full -&gt; xe-pw-132643v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-132643v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-132643v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-132643v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-hdmi-a6-dp4.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@xe_exec_compute_mode@many-basic.html">ABORT</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-134217728:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@xe_vm@large-userptr-split-misaligned-binds-134217728.html">DMESG-FAIL</a> +4 other tests dmesg-fail</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_compute_mode@lr-mode-workload:<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-9/igt@xe_exec_compute_mode@lr-mode-workload.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1396">Intel XE#1396</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-9/igt@xe_exec_compute_mode@lr-mode-workload.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>{igt@xe_pm@s3-vm-bind-unbind-all}:<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@xe_pm@s3-vm-bind-unbind-all.html">FAIL</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-132643v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-464/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-7-4-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1185">Intel XE#1185</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/829">Intel XE#829</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_big_fb@y-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_joiner@basic-force-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-433/igt@kms_big_joiner@basic-force-joiner.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-464/igt@kms_big_joiner@basic-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_big_joiner@basic-force-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-464/igt@kms_ccs@bad-rotation-90-y-tiled-ccs@pipe-a-hdmi-a-7.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +47 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/650">Intel XE#650</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_ccs@crc-primary-basic-y-tiled-gen12-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-463/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_chamelium_hpd@hdmi-hpd-after-hibernate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-434/igt@kms_content_protection@legacy@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_cursor_crc@cursor-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-434/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-463/igt@kms_cursor_legacy@cursor-vs-flip-atomic-transitions.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) +10 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@kms_cursor_legacy@cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-blocking-wf-vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-32bpp-yftileccs-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_pm_rpm@legacy-planes-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@kms_properties@crtc-properties-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-cursor-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_psr@fbc-psr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-x-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_rotation_crc@primary-x-tiled-reflect-x-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-busy@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-466/igt@kms_sequence@get-busy@pipe-d-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-433/igt@kms_sequence@get-busy@pipe-d-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-d-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@kms_vblank@wait-idle-hang@pipe-a-hdmi-a-2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-435/igt@xe_evict@evict-beng-cm-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-large-multi-vm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-466/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-463/igt@xe_evict@evict-beng-cm-threads-large-multi-vm.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-434/igt@xe_evict@evict-cm-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-434/igt@xe_evict@evict-cm-threads-small.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1259">Intel XE#1259</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-samefd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-cm-parallel-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@xe_exec_balancer@once-cm-parallel-rebind.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-virtual-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-433/igt@xe_exec_balancer@once-virtual-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-433/igt@xe_exec_balancer@once-virtual-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-mmap.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@xe_exec_fault_mode@many-execqueues-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-464/igt@xe_exec_threads@threads-fd-userptr-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-463/igt@xe_exec_threads@threads-fd-userptr-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-rebind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@xe_exec_threads@threads-mixed-shared-vm-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-6/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-435/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/910">Intel XE#910</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-466/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-466/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-434/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-464/igt@kms_dp_aux_dev.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-463/igt@kms_dp_aux_dev.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-stress-extra-wait:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@kms_pm_rpm@modeset-stress-extra-wait.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1211">Intel XE#1211</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@kms_pm_rpm@modeset-stress-extra-wait.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-464/igt@kms_vblank@ts-continuation-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@xe_evict@evict-beng-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-464/igt@xe_evict@evict-beng-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@xe_evict@evict-large-multi-vm-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@xe_evict@evict-large-multi-vm-cm.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-464/igt@xe_evict@evict-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-434/igt@xe_evict@evict-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1304">Intel XE#1304</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1364">Intel XE#1364</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-464/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-463/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-433/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1261">Intel XE#1261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-464/igt@xe_exec_threads@threads-hang-fd-userptr-invalidate-race.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-fd-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-435/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1206">Intel XE#1206</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-466/igt@xe_exec_threads@threads-hang-fd-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-466/igt@xe_exec_threads@threads-mixed-fd-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1169">Intel XE#1169</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1356">Intel XE#1356</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Intel XE#1376</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-433/igt@xe_exec_threads@threads-mixed-fd-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@xe_pm@d3hot-basic-exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/355">Intel XE#355</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@xe_pm@d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotreplug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-1/igt@core_hotunplug@hotreplug.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@core_hotunplug@hotreplug.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1538">Intel XE#1538</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689">Intel XE#1689</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotunplug-rescan:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-1/igt@core_hotunplug@hotunplug-rescan.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1365">Intel XE#1365</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-4/igt@core_hotunplug@hotunplug-rescan.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1689">Intel XE#1689</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-464/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-434/igt@kms_content_protection@legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-464/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursor-vs-flip-atomic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-1/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-8/igt@kms_cursor_legacy@cursor-vs-flip-atomic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-435/igt@kms_flip@flip-vs-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-434/igt@kms_plane@plane-panning-bottom-right-suspend@pipe-b.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-6/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-9/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1034">Intel XE#1034</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-6/igt@kms_vblank@ts-continuation-suspend@pipe-a-hdmi-a-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-434/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-463/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/931">Intel XE#931</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/821">Intel XE#821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-dg2-435/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1041">Intel XE#1041</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-1/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-8/igt@xe_pm@s2idle-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-1/igt@xe_pm@s2idle-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-1/igt@xe_pm@s2idle-multiple-execs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/927">Intel XE#927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-2/igt@xe_pm@s2idle-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1608">Intel XE#1608</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-2/igt@xe_pm@s3-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1214">Intel XE#1214</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-9/igt@xe_pm@s3-basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@mixed-userptr-misaligned-binds-1611661312:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724/shard-adlp-8/igt@xe_vm@mixed-userptr-misaligned-binds-1611661312.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1088">Intel XE#1088</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132643v1/shard-adlp-9/igt@xe_vm@mixed-userptr-misaligned-binds-1611661312.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1330">Intel XE#1330</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724 -&gt; xe-pw-132643v1</li>
</ul>
<p>IGT_7814: 7814<br />
  xe-1125-a6272ececd0c019dbb4b9e20dfd2026b7e299724: a6272ececd0c019dbb4b9e20dfd2026b7e299724<br />
  xe-pw-132643v1: 132643v1</p>

</body>
</html>

--===============4250076472061045969==--
