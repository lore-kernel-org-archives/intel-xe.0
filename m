Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EDC23D44140
	for <intel-xe@archiver.kernel.org>; Tue, 19 Nov 2024 11:04:31 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFA8F10E618;
	Tue, 19 Nov 2024 11:04:31 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A442610E620;
 Tue, 19 Nov 2024 11:04:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5962015513863071109=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Sort_again_the_info_f?=
 =?utf-8?q?lags?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Nov 2024 11:04:30 -0000
Message-ID: <173201427067.281726.12291430752141419866@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241118223314.1969166-1-lucas.demarchi@intel.com>
In-Reply-To: <20241118223314.1969166-1-lucas.demarchi@intel.com>
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

--===============5962015513863071109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Sort again the info flags
URL   : https://patchwork.freedesktop.org/series/141521/
State : failure

== Summary ==

CI Bug Log - changes from xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6_full -> xe-pw-141521v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-141521v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-141521v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-141521v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2] +1 other test dmesg-warn
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-6/igt@core_hotunplug@hotrebind-lateclose.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-9/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@kms_dp_aux_dev:
    - shard-bmg:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_dp_aux_dev.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a3:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][4]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a3.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-linear:
    - shard-bmg:          NOTRUN -> [DMESG-FAIL][5]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-linear.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-bmg:          [PASS][6] -> [DMESG-WARN][7] +4 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_pm_dc@dc5-dpms-negative.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_rpm@legacy-planes@plane-50:
    - shard-lnl:          [PASS][8] -> [DMESG-WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@kms_pm_rpm@legacy-planes@plane-50.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-6/igt@kms_pm_rpm@legacy-planes@plane-50.html

  * igt@xe_ccs@large-ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][10]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@xe_ccs@large-ctrl-surf-copy.html

  * igt@xe_exec_compute_mode@many-execqueues-rebind:
    - shard-adlp:         [PASS][11] -> [FAIL][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-1/igt@xe_exec_compute_mode@many-execqueues-rebind.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-3/igt@xe_exec_compute_mode@many-execqueues-rebind.html

  * igt@xe_exec_threads@threads-bal-fd-userptr:
    - shard-bmg:          [PASS][13] -> [FAIL][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@xe_exec_threads@threads-bal-fd-userptr.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-1/igt@xe_exec_threads@threads-bal-fd-userptr.html
    - shard-lnl:          [PASS][15] -> [FAIL][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-5/igt@xe_exec_threads@threads-bal-fd-userptr.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-3/igt@xe_exec_threads@threads-bal-fd-userptr.html

  * igt@xe_vm@bind-once:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][17] +4 other tests dmesg-warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@xe_vm@bind-once.html

  
#### Warnings ####

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2:
    - shard-bmg:          [DMESG-WARN][18] ([Intel XE#877]) -> [DMESG-WARN][19] +1 other test dmesg-warn
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-4/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html

  * igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][20] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][21] +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:
    - shard-bmg:          [DMESG-FAIL][22] ([Intel XE#3468]) -> [SKIP][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [DMESG-WARN][24] ([Intel XE#1727]) -> [DMESG-WARN][25]
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][26] ([Intel XE#1727]) -> [DMESG-WARN][27] +1 other test dmesg-warn
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3.html

  * igt@kms_vblank@wait-forked-busy:
    - shard-bmg:          [DMESG-FAIL][28] ([Intel XE#3468]) -> [INCOMPLETE][29]
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_vblank@wait-forked-busy.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_vblank@wait-forked-busy.html

  * igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-3:
    - shard-bmg:          [DMESG-WARN][30] ([Intel XE#3468]) -> [INCOMPLETE][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-3.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-3.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue:
    - shard-bmg:          [DMESG-WARN][32] ([Intel XE#3468]) -> [DMESG-WARN][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@xe_exec_compute_mode@twice-bindexecqueue.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@xe_exec_compute_mode@twice-bindexecqueue.html

  * igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:
    - shard-lnl:          [FAIL][34] ([Intel XE#3499]) -> [ABORT][35]
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html

  
Known issues
------------

  Here are the changes found in xe-pw-141521v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_getversion@basic:
    - shard-dg2-set2:     NOTRUN -> [FAIL][36] ([Intel XE#3440])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@core_getversion@basic.html

  * igt@core_hotunplug@unbind-rebind:
    - shard-dg2-set2:     [PASS][37] -> [SKIP][38] ([Intel XE#1885]) +1 other test skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@core_hotunplug@unbind-rebind.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html

  * igt@fbdev@eof:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#2134])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@fbdev@eof.html

  * igt@fbdev@info:
    - shard-dg2-set2:     [PASS][40] -> [SKIP][41] ([Intel XE#2134]) +1 other test skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@fbdev@info.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@fbdev@info.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:
    - shard-bmg:          NOTRUN -> [SKIP][42] ([Intel XE#2370])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1124])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#2136] / [Intel XE#2351]) +4 other tests skip
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][45] ([Intel XE#316])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][46] ([Intel XE#1124])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [PASS][47] -> [DMESG-WARN][48] ([Intel XE#1033])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][49] -> [DMESG-FAIL][50] ([Intel XE#1033])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1124])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][52] ([Intel XE#2136]) +21 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2314] / [Intel XE#2894])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][54] ([Intel XE#455] / [Intel XE#787]) +7 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][55] ([Intel XE#787]) +11 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#787]) +62 other tests skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][57] ([Intel XE#2887]) +1 other test skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][58] ([Intel XE#1195])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#455] / [Intel XE#787]) +10 other tests skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][60] -> [INCOMPLETE][61] ([Intel XE#1195] / [Intel XE#1727])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][62] -> [INCOMPLETE][63] ([Intel XE#1195] / [Intel XE#3113])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition:
    - shard-dg2-set2:     [PASS][64] -> [SKIP][65] ([Intel XE#2136]) +35 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_cdclk@mode-transition.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#1152]) +3 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_chamelium_color@ctm-negative:
    - shard-adlp:         NOTRUN -> [SKIP][67] ([Intel XE#306]) +1 other test skip
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_chamelium_color@ctm-negative.html
    - shard-bmg:          NOTRUN -> [SKIP][68] ([Intel XE#2325])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_chamelium_color@ctm-negative.html

  * igt@kms_chamelium_hpd@dp-hpd:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#373]) +1 other test skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd.html
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2252]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd.html

  * igt@kms_chamelium_hpd@vga-hpd-after-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#373])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          NOTRUN -> [SKIP][72] ([Intel XE#2341])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-bmg:          NOTRUN -> [SKIP][73] ([Intel XE#2321])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html
    - shard-adlp:         NOTRUN -> [SKIP][74] ([Intel XE#308])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#2577]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-1/igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-3/igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1.html

  * igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:
    - shard-bmg:          [PASS][77] -> [SKIP][78] ([Intel XE#2291]) +1 other test skip
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][79] ([Intel XE#309])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
    - shard-bmg:          NOTRUN -> [SKIP][80] ([Intel XE#2291])
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2244])
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@display-3x:
    - shard-dg2-set2:     NOTRUN -> [SKIP][82] ([Intel XE#703])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_feature_discovery@display-3x.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#2423] / [i915#2575]) +18 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:
    - shard-bmg:          [PASS][84] -> [DMESG-WARN][85] ([Intel XE#2955] / [Intel XE#3468])
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][86] -> [FAIL][87] ([Intel XE#3486])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:
    - shard-bmg:          [PASS][88] -> [FAIL][89] ([Intel XE#3486])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][90] -> [FAIL][91] ([Intel XE#2882]) +2 other tests fail
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-bmg:          [PASS][92] -> [SKIP][93] ([Intel XE#2316]) +1 other test skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-flip-vs-panning:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#310])
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip@busy-flip:
    - shard-dg2-set2:     [PASS][95] -> [SKIP][96] ([Intel XE#2423] / [i915#2575]) +125 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_flip@busy-flip.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_flip@busy-flip.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:
    - shard-lnl:          [PASS][97] -> [FAIL][98] ([Intel XE#886]) +4 other tests fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][99] ([Intel XE#3468]) +2 other tests dmesg-warn
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip@flip-vs-suspend@c-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-FAIL][100] ([Intel XE#3468]) +5 other tests dmesg-fail
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][101] ([Intel XE#1195] / [Intel XE#1727]) +1 other test incomplete
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#455]) +2 other tests skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@basic:
    - shard-dg2-set2:     [PASS][103] -> [SKIP][104] ([Intel XE#2351])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][105] ([Intel XE#651]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#651]) +2 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html
    - shard-bmg:          NOTRUN -> [SKIP][107] ([Intel XE#2311]) +2 other tests skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#656]) +5 other tests skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][109] ([Intel XE#1033]) +3 other tests dmesg-fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html
    - shard-bmg:          NOTRUN -> [FAIL][110] ([Intel XE#2333]) +1 other test fail
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:
    - shard-dg2-set2:     [PASS][111] -> [SKIP][112] ([Intel XE#2136] / [Intel XE#2351]) +17 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][113] ([Intel XE#2313])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][114] ([Intel XE#2312]) +2 other tests skip
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#653]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#653]) +5 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_hdr@invalid-hdr:
    - shard-dg2-set2:     [PASS][117] -> [SKIP][118] ([Intel XE#455])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_hdr@invalid-hdr.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_hdr@invalid-hdr.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][119] ([Intel XE#3012])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_joiner@basic-force-big-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][120] ([Intel XE#3012])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][121] ([Intel XE#361]) +1 other test fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#2763]) +2 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#2763] / [Intel XE#455])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-dg2-set2:     [PASS][124] -> [SKIP][125] ([Intel XE#2446]) +4 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [PASS][126] -> [DMESG-WARN][127] ([Intel XE#3184])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@kms_pm_rpm@legacy-planes.html
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-6/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@system-suspend-modeset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#2446]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html

  * igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1489]) +1 other test skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#1489])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html
    - shard-bmg:          NOTRUN -> [SKIP][131] ([Intel XE#1489])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][132] ([Intel XE#2234] / [Intel XE#2850])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@psr2-cursor-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][133] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_psr@psr2-cursor-blt.html

  * igt@kms_psr@psr2-sprite-blt:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@kms_psr@psr2-sprite-blt.html

  * igt@kms_sequence@get-forked-busy:
    - shard-adlp:         [PASS][135] -> [DMESG-WARN][136] ([Intel XE#3086])
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-3/igt@kms_sequence@get-forked-busy.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-1/igt@kms_sequence@get-forked-busy.html

  * igt@kms_setmode@invalid-clone-single-crtc-stealing:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#455]) +2 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html
    - shard-bmg:          NOTRUN -> [SKIP][138] ([Intel XE#1435])
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-bmg:          NOTRUN -> [SKIP][139] ([Intel XE#2426])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:
    - shard-lnl:          [PASS][140] -> [FAIL][141] ([Intel XE#899]) +1 other test fail
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html

  * igt@testdisplay:
    - shard-dg2-set2:     [PASS][142] -> [SKIP][143] ([Intel XE#2423]) +1 other test skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@testdisplay.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@testdisplay.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#1123])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_create@multigpu-create-massive-size:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#2504])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#944])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@xe_create@multigpu-create-massive-size.html

  * igt@xe_eudebug@basic-vms:
    - shard-bmg:          NOTRUN -> [SKIP][147] ([Intel XE#2905])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@xe_eudebug@basic-vms.html

  * igt@xe_eudebug_online@breakpoint-many-sessions-tiles:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#2905]) +2 other tests skip
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-bmg:          [PASS][149] -> [TIMEOUT][150] ([Intel XE#1473] / [Intel XE#2472])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:
    - shard-dg2-set2:     [PASS][151] -> [SKIP][152] ([Intel XE#1130]) +220 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html

  * igt@xe_exec_balancer@once-parallel-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][153] ([Intel XE#1130]) +30 other tests skip
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][154] ([Intel XE#2322])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-userptr.html

  * igt@xe_exec_compute_mode@once-bindexecqueue-rebind:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][155] ([Intel XE#1727])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-8/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-prefetch:
    - shard-bmg:          [PASS][156] -> [DMESG-WARN][157] ([Intel XE#3468]) +3 other tests dmesg-warn
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-prefetch.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-prefetch.html

  * igt@xe_exec_fault_mode@many-execqueues-invalid-fault:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#288]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][159] ([Intel XE#288]) +2 other tests skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html

  * igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#2360])
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html

  * igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:
    - shard-bmg:          [PASS][161] -> [DMESG-FAIL][162] ([Intel XE#3371])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html

  * igt@xe_exec_threads@threads-cm-userptr:
    - shard-bmg:          [PASS][163] -> [DMESG-WARN][164] ([Intel XE#1727])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@xe_exec_threads@threads-cm-userptr.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@xe_exec_threads@threads-cm-userptr.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:
    - shard-adlp:         [PASS][165] -> [DMESG-WARN][166] ([Intel XE#3515])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-8/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#255])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@xe_huc_copy@huc_copy.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-dg2-set2:     [PASS][168] -> [SKIP][169] ([Intel XE#2229]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [PASS][170] -> [DMESG-WARN][171] ([Intel XE#2953] / [Intel XE#3086])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-3/igt@xe_module_load@many-reload.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-1/igt@xe_module_load@many-reload.html

  * igt@xe_oa@invalid-create-userspace-config:
    - shard-adlp:         NOTRUN -> [SKIP][172] ([Intel XE#2541]) +1 other test skip
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@xe_oa@invalid-create-userspace-config.html

  * igt@xe_oa@stress-open-close@rcs-0:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][173] ([Intel XE#3466])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-1/igt@xe_oa@stress-open-close@rcs-0.html

  * igt@xe_pm@d3cold-basic:
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#2284])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@xe_pm@d3cold-basic.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][175] -> [ABORT][176] ([Intel XE#1358] / [Intel XE#1607])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-6/igt@xe_pm@s4-exec-after.html
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][177] -> [ABORT][178] ([Intel XE#1794])
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_sriov_flr@flr-each-isolation:
    - shard-dg2-set2:     NOTRUN -> [SKIP][179] ([Intel XE#3342])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@xe_sriov_flr@flr-each-isolation.html
    - shard-adlp:         [PASS][180] -> [FAIL][181] ([Intel XE#3507])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-3/igt@xe_sriov_flr@flr-each-isolation.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@xe_sriov_flr@flr-each-isolation.html

  
#### Possible fixes ####

  * igt@core_getstats:
    - shard-dg2-set2:     [SKIP][182] ([Intel XE#2423]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@core_getstats.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@core_getstats.html

  * igt@core_hotunplug@hotrebind-lateclose:
    - shard-dg2-set2:     [SKIP][184] ([Intel XE#1885]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@core_hotunplug@hotrebind-lateclose.html

  * igt@fbdev@nullptr:
    - shard-dg2-set2:     [SKIP][186] ([Intel XE#2134]) -> [PASS][187]
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@fbdev@nullptr.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@fbdev@nullptr.html

  * igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:
    - shard-dg2-set2:     [FAIL][188] ([Intel XE#3105]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-463/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [FAIL][190] ([Intel XE#1426]) -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][192] ([Intel XE#2136] / [Intel XE#2351]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][194] ([Intel XE#3321] / [Intel XE#3486]) -> [PASS][195] +1 other test pass
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [FAIL][196] ([Intel XE#2882]) -> [PASS][197] +1 other test pass
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [SKIP][198] ([Intel XE#2423] / [i915#2575]) -> [PASS][199] +35 other tests pass
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_flip@flip-vs-absolute-wf_vblank.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@flip-vs-expired-vblank@b-edp1:
    - shard-lnl:          [FAIL][200] ([Intel XE#886]) -> [PASS][201] +1 other test pass
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-suspend@c-edp1:
    - shard-lnl:          [DMESG-WARN][202] ([Intel XE#2932]) -> [PASS][203] +2 other tests pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-4/igt@kms_flip@flip-vs-suspend@c-edp1.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-7/igt@kms_flip@flip-vs-suspend@c-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2:
    - shard-bmg:          [INCOMPLETE][204] ([Intel XE#2635]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2.html

  * igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][206] ([Intel XE#2136]) -> [PASS][207] +15 other tests pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][208] ([Intel XE#1503]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_hdr@invalid-hdr.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:
    - shard-adlp:         [DMESG-WARN][210] ([Intel XE#3086]) -> [PASS][211] +4 other tests pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:
    - shard-bmg:          [DMESG-WARN][212] ([Intel XE#2566]) -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html

  * igt@kms_pm_rpm@basic-rte:
    - shard-dg2-set2:     [SKIP][214] ([Intel XE#2446]) -> [PASS][215] +1 other test pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_pm_rpm@basic-rte.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_pm_rpm@basic-rte.html

  * igt@kms_sequence@queue-busy:
    - shard-bmg:          [DMESG-FAIL][216] ([Intel XE#3468]) -> [PASS][217] +1 other test pass
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_sequence@queue-busy.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-5/igt@kms_sequence@queue-busy.html

  * igt@kms_sequence@queue-busy@pipe-c-dp-2:
    - shard-bmg:          [DMESG-WARN][218] ([Intel XE#3468]) -> [PASS][219] +16 other tests pass
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_sequence@queue-busy@pipe-c-dp-2.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-5/igt@kms_sequence@queue-busy@pipe-c-dp-2.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][220] ([Intel XE#899]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][222] ([Intel XE#1473]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_basic@no-exec-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][224] ([Intel XE#1130]) -> [PASS][225] +60 other tests pass
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html

  * igt@xe_fault_injection@vm-create-fail-xe_pt_create:
    - shard-bmg:          [DMESG-WARN][226] ([Intel XE#3467]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html

  * igt@xe_live_ktest@xe_bo:
    - shard-dg2-set2:     [TIMEOUT][228] ([Intel XE#2961] / [Intel XE#3191]) -> [PASS][229] +1 other test pass
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_live_ktest@xe_bo.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_live_ktest@xe_bo.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - shard-bmg:          [INCOMPLETE][230] ([Intel XE#2998]) -> [PASS][231] +1 other test pass
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_pm@s2idle-vm-bind-prefetch:
    - shard-adlp:         [DMESG-WARN][232] ([Intel XE#2953] / [Intel XE#3086]) -> [PASS][233]
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-3/igt@xe_pm@s2idle-vm-bind-prefetch.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-prefetch.html

  * igt@xe_pm@s4-basic:
    - shard-adlp:         [ABORT][234] ([Intel XE#1358] / [Intel XE#1607]) -> [PASS][235]
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-9/igt@xe_pm@s4-basic.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@xe_pm@s4-basic.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][236] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][237]
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][238] ([Intel XE#958]) -> [PASS][239]
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-suspend-resume:
    - shard-dg2-set2:     [DMESG-FAIL][240] ([Intel XE#3468]) -> [DMESG-WARN][241] ([Intel XE#3468])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-463/igt@kms_async_flips@async-flip-suspend-resume.html

  * igt@kms_atomic@test-only:
    - shard-dg2-set2:     [DMESG-WARN][242] ([Intel XE#1727]) -> [SKIP][243] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_atomic@test-only.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_atomic@test-only.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:
    - shard-lnl:          [DMESG-FAIL][244] ([Intel XE#3466]) -> [DMESG-WARN][245] ([Intel XE#3466]) +1 other test dmesg-warn
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][247] ([Intel XE#316])
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [INCOMPLETE][248] ([Intel XE#3225]) -> [INCOMPLETE][249] ([Intel XE#3225] / [Intel XE#3466]) +3 other tests incomplete
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#316]) -> [SKIP][251] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-0:
    - shard-bmg:          [DMESG-FAIL][252] ([Intel XE#3468]) -> [DMESG-WARN][253] ([Intel XE#3468]) +1 other test dmesg-warn
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#316]) -> [SKIP][255] ([Intel XE#2136]) +2 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][256] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][257] ([Intel XE#1124])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#1124]) -> [SKIP][259] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#607]) -> [SKIP][261] ([Intel XE#2136] / [Intel XE#2351])
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#1124]) -> [SKIP][263] ([Intel XE#2136]) +9 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#610]) -> [SKIP][265] ([Intel XE#2136])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#2136]) -> [SKIP][267] ([Intel XE#1124]) +2 other tests skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#2191]) -> [SKIP][269] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#2423] / [i915#2575]) -> [SKIP][271] ([Intel XE#2191])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#2423] / [i915#2575]) -> [SKIP][273] ([Intel XE#367])
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#367]) -> [SKIP][275] ([Intel XE#2423] / [i915#2575]) +3 other tests skip
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#2136]) -> [SKIP][277] ([Intel XE#455] / [Intel XE#787]) +4 other tests skip
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][279] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html

  * igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][281] ([Intel XE#2136] / [Intel XE#2351]) +3 other tests skip
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     [SKIP][282] ([Intel XE#2907]) -> [SKIP][283] ([Intel XE#2136]) +2 other tests skip
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][284] ([Intel XE#1195]) -> [SKIP][285] ([Intel XE#2136]) +1 other test skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#2136]) -> [INCOMPLETE][287] ([Intel XE#1195])
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-dg2-set2:     [SKIP][288] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][289] ([Intel XE#2136]) +14 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][290] ([Intel XE#306]) -> [SKIP][291] ([Intel XE#2423] / [i915#2575]) +2 other tests skip
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#2423] / [i915#2575]) -> [SKIP][293] ([Intel XE#306]) +1 other test skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_chamelium_color@ctm-green-to-red.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:
    - shard-dg2-set2:     [SKIP][294] ([Intel XE#373]) -> [SKIP][295] ([Intel XE#2423] / [i915#2575]) +16 other tests skip
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html

  * igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#2423] / [i915#2575]) -> [SKIP][297] ([Intel XE#373]) +3 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     [FAIL][298] ([Intel XE#1178]) -> [SKIP][299] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][300] ([Intel XE#1188]) -> [SKIP][301] ([Intel XE#2423] / [i915#2575])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_content_protection@uevent.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_crc@cursor-random-512x170:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#308]) -> [SKIP][303] ([Intel XE#2423] / [i915#2575])
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x170.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#2423] / [i915#2575]) -> [SKIP][305] ([Intel XE#308]) +1 other test skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:
    - shard-dg2-set2:     [SKIP][306] ([Intel XE#323]) -> [SKIP][307] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][308] ([Intel XE#307]) -> [SKIP][309] ([Intel XE#2423] / [i915#2575])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_display_modes@mst-extended-mode-negative.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_draw_crc@draw-method-mmap-wc:
    - shard-bmg:          [DMESG-FAIL][310] ([Intel XE#3468]) -> [INCOMPLETE][311] ([Intel XE#3468])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_draw_crc@draw-method-mmap-wc.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-wc.html

  * igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:
    - shard-bmg:          [DMESG-FAIL][312] -> [INCOMPLETE][313] ([Intel XE#3468])
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#455]) -> [SKIP][315] ([Intel XE#2136] / [Intel XE#2351]) +1 other test skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#1137]) -> [SKIP][317] ([Intel XE#2423] / [i915#2575])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][318] ([Intel XE#301]) -> [SKIP][319] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#2423] / [i915#2575]) -> [DMESG-FAIL][321] ([Intel XE#3468])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-FAIL][322] ([Intel XE#1727]) -> [SKIP][323] ([Intel XE#2423] / [i915#2575])
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:
    - shard-bmg:          [INCOMPLETE][324] ([Intel XE#3468]) -> [DMESG-WARN][325] ([Intel XE#3468]) +1 other test dmesg-warn
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#455]) -> [SKIP][327] ([Intel XE#2136]) +5 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][329] ([Intel XE#455])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#2136]) -> [SKIP][331] ([Intel XE#455])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-dg2-set2:     [SKIP][332] ([i915#5274]) -> [SKIP][333] ([Intel XE#2423] / [i915#2575])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][335] ([Intel XE#651]) +3 other tests skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-bmg:          [INCOMPLETE][336] ([Intel XE#2050]) -> [INCOMPLETE][337] ([Intel XE#2050] / [Intel XE#3468])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#651]) -> [SKIP][339] ([Intel XE#2136]) +31 other tests skip
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][340] ([Intel XE#2136]) -> [SKIP][341] ([Intel XE#651]) +10 other tests skip
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:
    - shard-bmg:          [SKIP][342] ([Intel XE#2311]) -> [SKIP][343] ([Intel XE#2312]) +6 other tests skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#651]) -> [SKIP][345] ([Intel XE#2136] / [Intel XE#2351]) +13 other tests skip
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#658]) -> [SKIP][347] ([Intel XE#2136] / [Intel XE#2351])
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#653]) -> [SKIP][349] ([Intel XE#2136]) +33 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     [SKIP][350] ([Intel XE#1158]) -> [SKIP][351] ([Intel XE#2136])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#2136]) -> [SKIP][353] ([Intel XE#653]) +8 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][355] ([Intel XE#653]) +1 other test skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#653]) -> [SKIP][357] ([Intel XE#2136] / [Intel XE#2351]) +13 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:
    - shard-bmg:          [SKIP][358] ([Intel XE#2313]) -> [SKIP][359] ([Intel XE#2312]) +7 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#346]) -> [SKIP][361] ([Intel XE#2136])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_joiner@basic-force-ultra-joiner:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#2925]) -> [SKIP][363] ([Intel XE#2136])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html

  * igt@kms_joiner@invalid-modeset-ultra-joiner:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#2927]) -> [SKIP][365] ([Intel XE#2136])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html

  * igt@kms_lease@lessee-list:
    - shard-dg2-set2:     [DMESG-WARN][366] -> [SKIP][367] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_lease@lessee-list.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_lease@lessee-list.html

  * igt@kms_panel_fitting@legacy:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#2423] / [i915#2575]) -> [SKIP][369] ([Intel XE#455]) +1 other test skip
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_panel_fitting@legacy.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_panel_fitting@legacy.html

  * igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:
    - shard-bmg:          [DMESG-WARN][370] ([Intel XE#3468]) -> [DMESG-FAIL][371] ([Intel XE#3468]) +2 other tests dmesg-fail
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-1/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:
    - shard-dg2-set2:     [SKIP][372] ([Intel XE#2423] / [i915#2575]) -> [SKIP][373] ([Intel XE#2763] / [Intel XE#455])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][374] ([Intel XE#2763] / [Intel XE#455]) -> [SKIP][375] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-dg2-set2:     [SKIP][376] ([Intel XE#870]) -> [SKIP][377] ([Intel XE#2136]) +2 other tests skip
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-dg2-set2:     [SKIP][378] ([Intel XE#2136]) -> [SKIP][379] ([Intel XE#870]) +1 other test skip
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-dg2-set2:     [SKIP][380] ([Intel XE#1122]) -> [SKIP][381] ([Intel XE#2136] / [Intel XE#2351])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][382] ([Intel XE#1129]) -> [SKIP][383] ([Intel XE#2136] / [Intel XE#2351])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-dg2-set2:     [ABORT][384] ([Intel XE#1727]) -> [DMESG-WARN][385] ([Intel XE#1727])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][386] ([Intel XE#1489]) -> [SKIP][387] ([Intel XE#2136]) +10 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:
    - shard-dg2-set2:     [SKIP][388] ([Intel XE#2136]) -> [SKIP][389] ([Intel XE#1489]) +3 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-nv12:
    - shard-dg2-set2:     [SKIP][390] ([Intel XE#1122]) -> [SKIP][391] ([Intel XE#2136]) +1 other test skip
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html

  * igt@kms_psr@fbc-psr-no-drrs:
    - shard-dg2-set2:     [SKIP][392] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][393] ([Intel XE#2136] / [Intel XE#2351]) +5 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][394] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][395] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     [SKIP][396] ([Intel XE#2136]) -> [SKIP][397] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@fbc-psr2-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][398] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][399] ([Intel XE#2136]) +13 other tests skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][400] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][401] ([Intel XE#2351]) +1 other test skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_psr@psr-sprite-plane-onoff.html
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr_stress_test@flip-primary-invalidate-overlay:
    - shard-dg2-set2:     [SKIP][402] ([Intel XE#2136] / [Intel XE#2351]) -> [SKIP][403] ([Intel XE#2939])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     [SKIP][404] ([Intel XE#2423] / [i915#2575]) -> [SKIP][405] ([Intel XE#3414])
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][406] ([Intel XE#1127]) -> [SKIP][407] ([Intel XE#2423] / [i915#2575])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][408] ([Intel XE#3414]) -> [SKIP][409] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_tiled_display@basic-test-pattern:
    - shard-dg2-set2:     [FAIL][410] ([Intel XE#1729]) -> [SKIP][411] ([Intel XE#2423] / [i915#2575])
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][412] ([Intel XE#1500]) -> [SKIP][413] ([Intel XE#2423] / [i915#2575])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@cmrr:
    - shard-dg2-set2:     [SKIP][414] ([Intel XE#2168]) -> [SKIP][415] ([Intel XE#2423] / [i915#2575])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_vrr@cmrr.html
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_vrr@cmrr.html

  * igt@kms_vrr@flip-dpms:
    - shard-dg2-set2:     [SKIP][416] ([Intel XE#455]) -> [SKIP][417] ([Intel XE#2423] / [i915#2575]) +4 other tests skip
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_vrr@flip-dpms.html
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_vrr@flip-dpms.html

  * igt@kms_writeback@writeback-invalid-parameters:
    - shard-dg2-set2:     [SKIP][418] ([Intel XE#756]) -> [SKIP][419] ([Intel XE#2423] / [i915#2575]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     [SKIP][420] ([Intel XE#1091] / [Intel XE#2849]) -> [SKIP][421] ([Intel XE#2423] / [i915#2575])
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_compute_preempt@compute-preempt:
    - shard-dg2-set2:     [SKIP][422] ([Intel XE#1280] / [Intel XE#455]) -> [SKIP][423] ([Intel XE#1130])
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html

  * igt@xe_copy_basic@mem-copy-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][424] ([Intel XE#1123]) -> [SKIP][425] ([Intel XE#1130]) +1 other test skip
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     [SKIP][426] ([Intel XE#1130]) -> [SKIP][427] ([Intel XE#1123])
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][428] ([Intel XE#1126]) -> [SKIP][429] ([Intel XE#1130])
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-dg2-set2:     [SKIP][430] ([Intel XE#1130]) -> [SKIP][431] ([Intel XE#2905]) +2 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-discovery.html
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_eudebug_online@preempt-breakpoint:
    - shard-dg2-set2:     [SKIP][432] ([Intel XE#2905]) -> [SKIP][433] ([Intel XE#1130]) +18 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_eudebug_online@preempt-breakpoint.html
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_eudebug_online@preempt-breakpoint.html

  * igt@xe_evict@evict-beng-mixed-many-threads-large:
    - shard-dg2-set2:     [SKIP][434] ([Intel XE#1130]) -> [TIMEOUT][435] ([Intel XE#1473])
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html

  * igt@xe_evict@evict-mixed-many-threads-large:
    - shard-dg2-set2:     [TIMEOUT][436] ([Intel XE#1473]) -> [SKIP][437] ([Intel XE#1130])
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html

  * igt@xe_exec_fault_mode@once-invalid-userptr-fault:
    - shard-dg2-set2:     [SKIP][438] ([Intel XE#1130]) -> [SKIP][439] ([Intel XE#288]) +9 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][440] ([Intel XE#288]) -> [SKIP][441] ([Intel XE#1130]) +39 other tests skip
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][442] ([Intel XE#2360]) -> [SKIP][443] ([Intel XE#1130])
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:
    - shard-dg2-set2:     [DMESG-WARN][444] ([Intel XE#3343]) -> [SKIP][445] ([Intel XE#1130])
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:
    - shard-dg2-set2:     [SKIP][446] ([Intel XE#1130]) -> [DMESG-WARN][447] ([Intel XE#3343])
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html

  * igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:
    - shard-dg2-set2:     [DMESG-WARN][448] ([Intel XE#3467]) -> [SKIP][449] ([Intel XE#1130]) +1 other test skip
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html

  * igt@xe_media_fill@media-fill:
    - shard-dg2-set2:     [SKIP][450] ([Intel XE#560]) -> [SKIP][451] ([Intel XE#1130])
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_media_fill@media-fill.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_media_fill@media-fill.html

  * igt@xe_module_load@reload-no-display:
    - shard-dg2-set2:     [DMESG-WARN][452] ([Intel XE#3467]) -> [FAIL][453] ([Intel XE#2136])
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_module_load@reload-no-display.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@buffer-fill:
    - shard-dg2-set2:     [SKIP][454] ([Intel XE#1130]) -> [SKIP][455] ([Intel XE#2541]) +3 other tests skip
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_oa@buffer-fill.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     [SKIP][456] ([Intel XE#2541]) -> [SKIP][457] ([Intel XE#1130]) +10 other tests skip
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_oa@missing-sample-flags.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_oa@missing-sample-flags.html

  * igt@xe_pat@pat-index-xelpg:
    - shard-dg2-set2:     [SKIP][458] ([Intel XE#1130]) -> [SKIP][459] ([Intel XE#979])
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html

  * igt@xe_peer2peer@write:
    - shard-dg2-set2:     [FAIL][460] ([Intel XE#1173]) -> [SKIP][461] ([Intel XE#1061])
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_peer2peer@write.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_peer2peer@write.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     [SKIP][462] ([Intel XE#1130]) -> [SKIP][463] ([Intel XE#2284])
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_pm@d3cold-mocs.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-dg2-set2:     [SKIP][464] ([Intel XE#1130]) -> [DMESG-WARN][465] ([Intel XE#3468])
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_pm@d3hot-mmap-vram.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-basic:
    - shard-dg2-set2:     [DMESG-WARN][466] ([Intel XE#3468]) -> [SKIP][467] ([Intel XE#1130])
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_pm@s2idle-basic.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][468] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][469] ([Intel XE#1130]) +3 other tests skip
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-mocs:
    - shard-dg2-set2:     [DMESG-FAIL][470] ([Intel XE#3468]) -> [SKIP][471] ([Intel XE#1130])
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_pm@s2idle-mocs.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_pm@s2idle-mocs.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [SKIP][472] ([Intel XE#1130]) -> [DMESG-WARN][473] ([Intel XE#569])
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_pm@s3-basic-exec.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][474] ([Intel XE#569]) -> [SKIP][475] ([Intel XE#1130])
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [DMESG-WARN][476] ([Intel XE#1727]) -> [SKIP][477] ([Intel XE#1130]) +2 other tests skip
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][478] ([Intel XE#2280]) -> [SKIP][479] ([Intel XE#1130])
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_pm@s4-vm-bind-unbind-all.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-config:
    - shard-dg2-set2:     [SKIP][480] ([Intel XE#1130]) -> [SKIP][481] ([Intel XE#944]) +1 other test skip
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_query@multigpu-query-config.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@xe_query@multigpu-query-config.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     [SKIP][482] ([Intel XE#944]) -> [SKIP][483] ([Intel XE#1130]) +4 other tests skip
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_query@multigpu-query-engines.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_query@multigpu-query-engines.html

  * igt@xe_vm@large-split-binds-2147483648:
    - shard-dg2-set2:     [DMESG-WARN][484] -> [SKIP][485] ([Intel XE#1130])
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_vm@large-split-binds-2147483648.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_vm@large-split-binds-2147483648.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [DMESG-WARN][486] ([Intel XE#2919]) -> [SKIP][487] ([Intel XE#1130])
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_wedged@basic-wedged.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_wedged@basic-wedged.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1729]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1885]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885
  [Intel XE#2050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050
  [Intel XE#2134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134
  [Intel XE#2136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2291]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2312]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314
  [Intel XE#2316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2370]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370
  [Intel XE#2423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2446]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446
  [Intel XE#2472]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472
  [Intel XE#2504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2577]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577
  [Intel XE#2635]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2919]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919
  [Intel XE#2925]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2932]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932
  [Intel XE#2939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#2961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3086]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3105
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191
  [Intel XE#3225]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343
  [Intel XE#3371]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3440]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466
  [Intel XE#3467]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467
  [Intel XE#3468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468
  [Intel XE#3486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486
  [Intel XE#3499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499
  [Intel XE#3507]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3507
  [Intel XE#3515]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#560]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/560
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#703]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/703
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * Linux: xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6 -> xe-pw-141521v1

  IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6
  xe-pw-141521v1: 141521v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/index.html

--===============5962015513863071109==
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
<tr><td><b>Series:</b></td><td>drm/xe: Sort again the info flags</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141521/">https://patchwork.freedesktop.org/series/141521/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6_full -&gt; xe-pw-141521v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-141521v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-141521v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-141521v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-6/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-9/igt@core_hotunplug@hotrebind-lateclose.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_dp_aux_dev:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_dp_aux_dev.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@d-hdmi-a3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-linear:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-linear.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_pm_dc@dc5-dpms-negative.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-50:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@kms_pm_rpm@legacy-planes@plane-50.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-6/igt@kms_pm_rpm@legacy-planes@plane-50.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@xe_ccs@large-ctrl-surf-copy.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-1/igt@xe_exec_compute_mode@many-execqueues-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-3/igt@xe_exec_compute_mode@many-execqueues-rebind.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@xe_exec_threads@threads-bal-fd-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-1/igt@xe_exec_threads@threads-bal-fd-userptr.html">FAIL</a></li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-5/igt@xe_exec_threads@threads-bal-fd-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-3/igt@xe_exec_threads@threads-bal-fd-userptr.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-once:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@xe_vm@bind-once.html">DMESG-WARN</a> +4 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-4/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_ccs@crc-primary-suspend-yf-tiled-ccs.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-5/igt@kms_flip_tiling@flip-change-tiling@pipe-a-dp-2-x-to-x.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-5/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-a-hdmi-a-3.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_vblank@wait-forked-busy.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_vblank@wait-forked-busy.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_vblank@wait-forked-busy@pipe-a-hdmi-a-3.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@xe_exec_compute_mode@twice-bindexecqueue.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@xe_exec_compute_mode@twice-bindexecqueue.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-8/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3499">Intel XE#3499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-5/igt@xe_fault_injection@vm-bind-fail-vm_bind_ioctl_ops_create.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141521v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_getversion@basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@core_getversion@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3440">Intel XE#3440</a>)</li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@fbdev@eof:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@fbdev@eof.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>)</li>
</ul>
</li>
<li>
<p>igt@fbdev@info:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@fbdev@info.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@fbdev@info.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2370">Intel XE#2370</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_big_fb@4-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_big_fb@x-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_big_fb@y-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-4-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_cdclk@mode-transition.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +35 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-negative:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_chamelium_color@ctm-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_chamelium_hpd@dp-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-after-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_chamelium_hpd@vga-hpd-after-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_content_protection@srm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321">Intel XE#2321</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-1/igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-3/igt@kms_cursor_edge_walk@64x64-right-edge@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2577">Intel XE#2577</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-flip-vs-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244">Intel XE#2244</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-3x:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_feature_discovery@display-3x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/703">Intel XE#703</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_flip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race-interruptible:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-2/igt@kms_flip@2x-dpms-vs-vblank-race-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955">Intel XE#2955</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-436/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ac-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-panning.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@busy-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_flip@busy-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_flip@busy-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +125 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-3/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-8/igt@kms_flip@flip-vs-absolute-wf_vblank-interruptible@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend@c-hdmi-a6.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +5 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-downscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) +3 other tests dmesg-fail</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-1p-offscren-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-2p-primscrn-cur-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_hdr@invalid-hdr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-c.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-d.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@kms_pm_rpm@legacy-planes.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-6/igt@kms_pm_rpm@legacy-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@system-suspend-modeset:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_pm_rpm@system-suspend-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_psr2_sf@fbc-pr-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_psr@fbc-psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234">Intel XE#2234</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_psr@psr2-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-sprite-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@kms_psr@psr2-sprite-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@get-forked-busy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-3/igt@kms_sequence@get-forked-busy.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-1/igt@kms_sequence@get-forked-busy.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc-stealing:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc-stealing.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426">Intel XE#2426</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@testdisplay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@testdisplay.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@testdisplay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@multigpu-create-massive-size:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2504">Intel XE#2504</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@xe_create@multigpu-create-massive-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vms:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@xe_eudebug@basic-vms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@breakpoint-many-sessions-tiles:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@xe_eudebug_online@breakpoint-many-sessions-tiles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-5/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2472">Intel XE#2472</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_evict_ccs@evict-overcommit-standalone-instantfree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +220 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@once-parallel-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_exec_balancer@once-parallel-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@xe_exec_basic@multigpu-no-exec-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-8/igt@xe_exec_compute_mode@once-bindexecqueue-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-prefetch:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@xe_exec_fault_mode@many-bindexecqueue-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-7/igt@xe_exec_fault_mode@many-bindexecqueue-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-invalid-fault:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-invalid-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-rebind-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-spinner-interrupted-lr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@xe_exec_mix_modes@exec-spinner-interrupted-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-4/igt@xe_exec_threads@threads-cm-shared-vm-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3371">Intel XE#3371</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@xe_exec_threads@threads-cm-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@xe_exec_threads@threads-cm-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-8/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3515">Intel XE#3515</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-3/igt@xe_module_load@many-reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-1/igt@xe_module_load@many-reload.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-create-userspace-config:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@xe_oa@invalid-create-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@stress-open-close@rcs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-1/igt@xe_oa@stress-open-close@rcs-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-basic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@xe_pm@d3cold-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-6/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-1/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-each-isolation:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@xe_sriov_flr@flr-each-isolation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-3/igt@xe_sriov_flr@flr-each-isolation.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@xe_sriov_flr@flr-each-isolation.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3507">Intel XE#3507</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_getstats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@core_getstats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@core_getstats.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@core_hotunplug@hotrebind-lateclose:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@core_hotunplug@hotrebind-lateclose.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1885">Intel XE#1885</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@core_hotunplug@hotrebind-lateclose.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@fbdev@nullptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@fbdev@nullptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2134">Intel XE#2134</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@fbdev@nullptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3105">Intel XE#3105</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-463/igt@kms_async_flips@async-flip-suspend-resume@pipe-d-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-7/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-2/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3486">Intel XE#3486</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bc-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-4/igt@kms_flip@2x-plain-flip-fb-recreate.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_flip@flip-vs-absolute-wf_vblank.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_flip@flip-vs-absolute-wf_vblank.html">PASS</a> +35 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-7/igt@kms_flip@flip-vs-expired-vblank@b-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-4/igt@kms_flip@flip-vs-suspend@c-edp1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2932">Intel XE#2932</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-7/igt@kms_flip@flip-vs-suspend@c-edp1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2635">Intel XE#2635</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-4/igt@kms_flip@plain-flip-fb-recreate-interruptible@b-dp2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbc-rgb101010-draw-mmap-wc.html">PASS</a> +15 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-1/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-4/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-3/igt@kms_plane_scaling@plane-upscale-factor-0-25-with-pixel-format.html">PASS</a> +4 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-3/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-20x20.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@basic-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_pm_rpm@basic-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2446">Intel XE#2446</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_pm_rpm@basic-rte.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_sequence@queue-busy.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-5/igt@kms_sequence@queue-busy.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_sequence@queue-busy@pipe-c-dp-2:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_sequence@queue-busy@pipe-c-dp-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-5/igt@kms_sequence@queue-busy@pipe-c-dp-2.html">PASS</a> +16 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-436/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@no-exec-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@xe_exec_basic@no-exec-bindexecqueue-rebind.html">PASS</a> +60 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_pt_create:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-5/igt@xe_fault_injection@vm-create-fail-xe_pt_create.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_live_ktest@xe_bo.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2961">Intel XE#2961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3191">Intel XE#3191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_live_ktest@xe_bo.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-3/igt@xe_pm@s2idle-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3086">Intel XE#3086</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@xe_pm@s2idle-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-9/igt@xe_pm@s4-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-6/igt@xe_pm@s4-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-adlp-8/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-6/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-suspend-resume:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-463/igt@kms_async_flips@async-flip-suspend-resume.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@test-only:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_atomic@test-only.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_atomic@test-only.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-4/igt@kms_atomic_transition@plane-all-modeset-transition-internal-panels@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-lnl-1/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3225">Intel XE#3225</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3466">Intel XE#3466</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_big_fb@4-tiled-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_big_fb@x-tiled-64bpp-rotate-0.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_big_fb@y-tiled-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_bw@linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-yf-tiled-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_ccs@bad-pixel-format-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_ccs@ccs-on-another-bo-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_chamelium_frames@hdmi-crc-nonplanar-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-for-each-pipe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_chamelium_hpd@vga-hpd-for-each-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_content_protection@lic-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_content_protection@uevent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_content_protection@uevent.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_cursor_crc@cursor-random-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_draw_crc@draw-method-mmap-wc.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-2/igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_flip@flip-vs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_flip@flip-vs-suspend.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_flip@flip-vs-suspend-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-8/igt@kms_flip_scaled_crc@flip-32bpp-linear-to-64bpp-linear-upscaling@pipe-a-valid-mode.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-3/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-spr-indfb-draw-mmap-wc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2050">Intel XE#2050</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +31 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-1p-offscren-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/346">Intel XE#346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_joiner@basic-big-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2925">Intel XE#2925</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_joiner@basic-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-ultra-joiner:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927">Intel XE#2927</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_joiner@invalid-modeset-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@lessee-list:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_lease@lessee-list.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_lease@lessee-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_panel_fitting@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-bmg-2/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-bmg-1/igt@kms_plane_cursor@viewport@pipe-a-dp-2-size-64.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) +2 other tests dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_plane_scaling@planes-downscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-435/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_psr2_sf@fbc-psr2-primary-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_psr2_sf@psr2-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-nv12:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_psr2_su@page_flip-nv12.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_psr@fbc-psr-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_psr@fbc-psr2-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_psr@psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr_stress_test@flip-primary-invalidate-overlay:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@kms_psr_stress_test@flip-primary-invalidate-overlay.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2939">Intel XE#2939</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414">Intel XE#3414</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1729">Intel XE#1729</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel XE#2168</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_vrr@cmrr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_vrr@flip-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-invalid-parameters:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@kms_writeback@writeback-invalid-parameters.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2423">Intel XE#2423</a> / <a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-preempt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_compute_preempt@compute-preempt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@xe_copy_basic@mem-copy-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@xe_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@preempt-breakpoint:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_eudebug_online@preempt-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_eudebug_online@preempt-breakpoint.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_evict@evict-beng-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_evict@evict-mixed-many-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-userptr-fault:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@xe_exec_fault_mode@once-invalid-userptr-fault.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +39 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_guc_ads_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@xe_fault_injection@inject-fault-probe-function-xe_wopcm_init.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3343">Intel XE#3343</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_fault_injection@vm-create-fail-xe_vm_create_scratch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_media_fill@media-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/560">Intel XE#560</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_media_fill@media-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_module_load@reload-no-display.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3467">Intel XE#3467</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_module_load@reload-no-display.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2136">Intel XE#2136</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xelpg:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@xe_pat@pat-index-xelpg.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_peer2peer@write.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_peer2peer@write.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@xe_pm@d3cold-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_pm@d3hot-mmap-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@xe_pm@d3hot-mmap-vram.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_pm@s2idle-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_pm@s2idle-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-mocs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_pm@s2idle-mocs.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3468">Intel XE#3468</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_pm@s2idle-mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_pm@s3-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-433/igt@xe_pm@s3-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_pm@s3-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-464/igt@xe_pm@s4-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-434/igt@xe_pm@s4-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2280">Intel XE#2280</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_pm@s4-vm-bind-unbind-all.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-466/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-464/igt@xe_query@multigpu-query-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-433/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-2147483648:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-463/igt@xe_vm@large-split-binds-2147483648.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-434/igt@xe_vm@large-split-binds-2147483648.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6/shard-dg2-435/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2919">Intel XE#2919</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141521v1/shard-dg2-466/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6 -&gt; xe-pw-141521v1</li>
</ul>
<p>IGT_8115: 4942fc57c20f9cb2195e70991c4e4df03dd3db21 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2249-1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6: 1fe9a6cc7d136c9a34c47ccd6ee5a2b7d02c0bd6<br />
  xe-pw-141521v1: 141521v1</p>

</body>
</html>

--===============5962015513863071109==--
