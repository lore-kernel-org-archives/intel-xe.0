Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90FC6D13572
	for <intel-xe@archiver.kernel.org>; Sun, 27 Oct 2024 17:31:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03FB210E106;
	Sun, 27 Oct 2024 17:31:10 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4B5010E106;
 Sun, 27 Oct 2024 17:31:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3030585028958754079=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe/oa=3A_Increase_default_O?=
 =?utf-8?q?A_buffer_size_to_128_M_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dixit, Ashutosh" <ashutosh.dixit@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 27 Oct 2024 17:31:08 -0000
Message-ID: <173005026892.1352981.11372432118507519756@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241023181155.1208100-1-ashutosh.dixit@intel.com>
In-Reply-To: <20241023181155.1208100-1-ashutosh.dixit@intel.com>
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

--===============3030585028958754079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/oa: Increase default OA buffer size to 128 M (rev2)
URL   : https://patchwork.freedesktop.org/series/140390/
State : failure

== Summary ==

CI Bug Log - changes from xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306_full -> xe-pw-140390v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-140390v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-140390v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-140390v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@crc:
    - shard-adlp:         [PASS][1] -> [DMESG-FAIL][2] +1 other test dmesg-fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-4/igt@kms_async_flips@crc.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-3/igt@kms_async_flips@crc.html

  * igt@kms_content_protection@content-type-change:
    - shard-lnl:          NOTRUN -> [SKIP][3]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_content_protection@content-type-change.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][4] -> [FAIL][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html

  * igt@kms_vblank@ts-continuation-modeset:
    - shard-adlp:         [PASS][6] -> [DMESG-WARN][7] +5 other tests dmesg-warn
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-1/igt@kms_vblank@ts-continuation-modeset.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-9/igt@kms_vblank@ts-continuation-modeset.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:
    - shard-lnl:          [PASS][8] -> [FAIL][9] +6 other tests fail
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html

  * igt@xe_exec_fault_mode@once-invalid-fault:
    - shard-lnl:          [PASS][10] -> [DMESG-WARN][11] +2 other tests dmesg-warn
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_exec_fault_mode@once-invalid-fault.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@xe_exec_fault_mode@once-invalid-fault.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
    - shard-bmg:          [PASS][12] -> [DMESG-WARN][13] +2 other tests dmesg-warn
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-4/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-hang-shared-vm-rebind:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][14]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-1/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-mixed-fd-userptr:
    - shard-dg2-set2:     [PASS][15] -> [DMESG-WARN][16] +1 other test dmesg-warn
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-466/igt@xe_exec_threads@threads-mixed-fd-userptr.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-463/igt@xe_exec_threads@threads-mixed-fd-userptr.html

  * igt@xe_oa@closed-fd-and-unmapped-access:
    - shard-lnl:          [PASS][17] -> [WARN][18] +1 other test warn
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@xe_oa@closed-fd-and-unmapped-access.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-4/igt@xe_oa@closed-fd-and-unmapped-access.html

  * igt@xe_oa@closed-fd-and-unmapped-access@ccs-0:
    - shard-bmg:          NOTRUN -> [CRASH][19]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-8/igt@xe_oa@closed-fd-and-unmapped-access@ccs-0.html
    - shard-lnl:          NOTRUN -> [CRASH][20]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-4/igt@xe_oa@closed-fd-and-unmapped-access@ccs-0.html

  * igt@xe_oa@invalid-map-oa-buffer@ccs-0:
    - shard-lnl:          NOTRUN -> [FAIL][21]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-6/igt@xe_oa@invalid-map-oa-buffer@ccs-0.html

  * igt@xe_oa@invalid-map-oa-buffer@rcs-0:
    - shard-bmg:          [PASS][22] -> [FAIL][23] +5 other tests fail
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-5/igt@xe_oa@invalid-map-oa-buffer@rcs-0.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-5/igt@xe_oa@invalid-map-oa-buffer@rcs-0.html

  * igt@xe_oa@map-oa-buffer:
    - shard-bmg:          [PASS][24] -> [WARN][25] +1 other test warn
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@xe_oa@map-oa-buffer.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-1/igt@xe_oa@map-oa-buffer.html

  * igt@xe_oa@map-oa-buffer@rcs-0:
    - shard-lnl:          [PASS][26] -> [CRASH][27] +1 other test crash
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-6/igt@xe_oa@map-oa-buffer@rcs-0.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-8/igt@xe_oa@map-oa-buffer@rcs-0.html

  * igt@xe_oa@mmio-triggered-reports@ccs-0:
    - shard-bmg:          [PASS][28] -> [CRASH][29] +1 other test crash
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@xe_oa@mmio-triggered-reports@ccs-0.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-4/igt@xe_oa@mmio-triggered-reports@ccs-0.html

  
#### Warnings ####

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-dg2-set2:     [FAIL][30] ([Intel XE#1600]) -> [DMESG-FAIL][31]
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@xe_evict@evict-large-multi-vm-cm.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-adlp:         [SKIP][32] ([Intel XE#455]) -> [SKIP][33]
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-8/igt@xe_live_ktest@xe_eudebug.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-6/igt@xe_live_ktest@xe_eudebug.html

  
Known issues
------------

  Here are the changes found in xe-pw-140390v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:
    - shard-adlp:         [PASS][34] -> [DMESG-FAIL][35] ([Intel XE#1033] / [Intel XE#1727])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][36] -> [DMESG-WARN][37] ([Intel XE#3194]) +1 other test dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         NOTRUN -> [SKIP][38] ([Intel XE#1124]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][39] ([Intel XE#1124])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#1124])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][41] ([Intel XE#2191]) +1 other test skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#2887])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#455] / [Intel XE#787]) +5 other tests skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#2907])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][45] ([Intel XE#787]) +8 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][46] -> [INCOMPLETE][47] ([Intel XE#1195] / [Intel XE#3113])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][48] ([Intel XE#1195])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_chamelium_frames@dp-crc-single:
    - shard-lnl:          NOTRUN -> [SKIP][49] ([Intel XE#373])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_chamelium_frames@dp-crc-single.html

  * igt@kms_cursor_crc@cursor-onscreen-256x85:
    - shard-lnl:          NOTRUN -> [SKIP][50] ([Intel XE#1424])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html

  * igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:
    - shard-lnl:          [PASS][51] -> [FAIL][52] ([Intel XE#1541])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#307])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-3:
    - shard-bmg:          NOTRUN -> [DMESG-WARN][54] ([Intel XE#3177]) +2 other tests dmesg-warn
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:
    - shard-bmg:          [PASS][55] -> [FAIL][56] ([Intel XE#301]) +2 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][57] -> [FAIL][58] ([Intel XE#301]) +14 other tests fail
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#310]) +1 other test skip
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#1421]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_flip@2x-plain-flip.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][61] -> [FAIL][62] ([Intel XE#886]) +3 other tests fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:
    - shard-adlp:         [PASS][63] -> [FAIL][64] ([Intel XE#2882]) +2 other tests fail
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#455]) +3 other tests skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][66] ([Intel XE#455]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-linear:
    - shard-lnl:          [PASS][67] -> [FAIL][68] ([Intel XE#1491])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-linear.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-7/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-linear.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#656]) +10 other tests skip
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2311]) +1 other test skip
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#651]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#651]) +2 other tests skip
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][73] ([Intel XE#651]) +1 other test skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:
    - shard-bmg:          NOTRUN -> [SKIP][74] ([Intel XE#2313])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:
    - shard-adlp:         NOTRUN -> [SKIP][75] ([Intel XE#653]) +4 other tests skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][76] ([Intel XE#656]) +4 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_joiner@invalid-modeset-force-ultra-joiner:
    - shard-lnl:          NOTRUN -> [SKIP][77] ([Intel XE#2934])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html

  * igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128:
    - shard-adlp:         NOTRUN -> [FAIL][78] ([Intel XE#1874]) +3 other tests fail
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][79] -> [FAIL][80] ([Intel XE#361])
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#2763]) +3 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-adlp:         NOTRUN -> [SKIP][82] ([Intel XE#870])
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          [PASS][83] -> [FAIL][84] ([Intel XE#1430])
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_rpm@legacy-planes-dpms@plane-41:
    - shard-lnl:          [PASS][85] -> [DMESG-WARN][86] ([Intel XE#3184]) +1 other test dmesg-warn
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-3/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1489]) +2 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][88] ([Intel XE#1128])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-primary-page-flip@edp-1:
    - shard-lnl:          [PASS][89] -> [FAIL][90] ([Intel XE#2808]) +1 other test fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-4/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html

  * igt@kms_psr@pr-cursor-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][91] ([Intel XE#2850] / [Intel XE#929])
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@kms_psr@pr-cursor-blt.html

  * igt@kms_psr@psr2-cursor-plane-move@edp-1:
    - shard-lnl:          [PASS][92] -> [FAIL][93] ([Intel XE#2948]) +1 other test fail
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-8/igt@kms_psr@psr2-cursor-plane-move@edp-1.html
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-6/igt@kms_psr@psr2-cursor-plane-move@edp-1.html

  * igt@kms_psr@psr2-no-drrs:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#2850] / [Intel XE#929]) +2 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@kms_psr@psr2-no-drrs.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#327]) +1 other test skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2509])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vrr@flip-basic-fastset:
    - shard-lnl:          [PASS][97] -> [FAIL][98] ([Intel XE#2443]) +1 other test fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_vrr@flip-basic-fastset.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-4/igt@kms_vrr@flip-basic-fastset.html

  * igt@kms_vrr@negative-basic:
    - shard-lnl:          NOTRUN -> [SKIP][99] ([Intel XE#1499])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_vrr@negative-basic.html

  * igt@xe_ccs@block-copy-compressed-inc-dimension:
    - shard-adlp:         NOTRUN -> [SKIP][100] ([Intel XE#455] / [Intel XE#488])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_ccs@block-copy-compressed-inc-dimension.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][101] ([Intel XE#1123])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_eudebug@attach-debug-metadata:
    - shard-adlp:         NOTRUN -> [SKIP][102] ([Intel XE#2905]) +1 other test skip
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_eudebug@attach-debug-metadata.html

  * igt@xe_eudebug@basic-vm-bind-ufence:
    - shard-lnl:          NOTRUN -> [SKIP][103] ([Intel XE#2905]) +2 other tests skip
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-ufence.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [PASS][104] -> [TIMEOUT][105] ([Intel XE#1473])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-large:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#261] / [Intel XE#688]) +1 other test skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_evict@evict-large.html

  * igt@xe_evict@evict-threads-large:
    - shard-dg2-set2:     [PASS][107] -> [FAIL][108] ([Intel XE#1000])
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-435/igt@xe_evict@evict-threads-large.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-466/igt@xe_evict@evict-threads-large.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-adlp:         NOTRUN -> [SKIP][109] ([Intel XE#1392]) +3 other tests skip
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:
    - shard-lnl:          NOTRUN -> [SKIP][110] ([Intel XE#1392])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html

  * igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][111] ([Intel XE#288]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html

  * igt@xe_exec_reset@close-fd:
    - shard-adlp:         [PASS][112] -> [DMESG-WARN][113] ([Intel XE#358]) +2 other tests dmesg-warn
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-2/igt@xe_exec_reset@close-fd.html
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_exec_reset@close-fd.html

  * igt@xe_exec_reset@cm-close-fd-no-exec:
    - shard-bmg:          [PASS][114] -> [DMESG-WARN][115] ([Intel XE#3230]) +1 other test dmesg-warn
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-7/igt@xe_exec_reset@cm-close-fd-no-exec.html

  * igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:
    - shard-dg2-set2:     [PASS][116] -> [DMESG-WARN][117] ([Intel XE#358])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-436/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-434/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html

  * igt@xe_oa@mmio-triggered-reports:
    - shard-bmg:          [PASS][118] -> [FAIL][119] ([Intel XE#2249])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@xe_oa@mmio-triggered-reports.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-4/igt@xe_oa@mmio-triggered-reports.html
    - shard-lnl:          [PASS][120] -> [FAIL][121] ([Intel XE#2249])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_oa@mmio-triggered-reports.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html

  * igt@xe_oa@oa-exponents@ccs-0:
    - shard-lnl:          [PASS][122] -> [FAIL][123] ([Intel XE#2976])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-4/igt@xe_oa@oa-exponents@ccs-0.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-2/igt@xe_oa@oa-exponents@ccs-0.html

  * igt@xe_oa@privileged-forked-access-vaddr:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#2541]) +1 other test skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_oa@privileged-forked-access-vaddr.html

  * igt@xe_pm@s4-exec-after:
    - shard-adlp:         [PASS][125] -> [ABORT][126] ([Intel XE#1358] / [Intel XE#1607])
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-1/igt@xe_pm@s4-exec-after.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-9/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-lnl:          [PASS][127] -> [ABORT][128] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-lnl:          NOTRUN -> [SKIP][129] ([Intel XE#944])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@xe_query@multigpu-query-mem-usage.html

  
#### Possible fixes ####

  * igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:
    - shard-adlp:         [DMESG-FAIL][130] ([Intel XE#1033] / [Intel XE#1727]) -> [PASS][131]
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][132] ([Intel XE#1195] / [Intel XE#1727]) -> [PASS][133]
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][134] ([Intel XE#1195]) -> [PASS][135]
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [DMESG-WARN][136] ([Intel XE#3113]) -> [PASS][137]
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-bmg:          [DMESG-WARN][138] ([Intel XE#877]) -> [PASS][139]
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@flip-vs-cursor-toggle:
    - shard-dg2-set2:     [FAIL][140] ([Intel XE#1475]) -> [PASS][141]
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html

  * igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][142] -> [PASS][143] +1 other test pass
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-434/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][144] ([Intel XE#301]) -> [PASS][145] +2 other tests pass
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [FAIL][146] ([Intel XE#301]) -> [PASS][147] +6 other tests pass
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3:
    - shard-bmg:          [INCOMPLETE][148] ([Intel XE#2597]) -> [PASS][149] +1 other test pass
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:
    - shard-lnl:          [FAIL][150] ([Intel XE#886]) -> [PASS][151] +5 other tests pass
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:
    - shard-adlp:         [DMESG-WARN][152] ([Intel XE#2953]) -> [PASS][153] +1 other test pass
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-adlp:         [FAIL][154] ([Intel XE#1874]) -> [PASS][155] +1 other test pass
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs:
    - shard-lnl:          [FAIL][156] ([Intel XE#1491]) -> [PASS][157]
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-7/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html

  * igt@kms_hdr@invalid-hdr:
    - shard-bmg:          [SKIP][158] ([Intel XE#1503]) -> [PASS][159]
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-8/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][160] ([Intel XE#361]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_pm_rpm@legacy-planes:
    - shard-lnl:          [DMESG-WARN][162] ([Intel XE#3184]) -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-5/igt@kms_pm_rpm@legacy-planes.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-5/igt@kms_pm_rpm@legacy-planes.html

  * igt@kms_pm_rpm@legacy-planes@plane-50:
    - shard-lnl:          [DMESG-WARN][164] -> [PASS][165] +1 other test pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-5/igt@kms_pm_rpm@legacy-planes@plane-50.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-5/igt@kms_pm_rpm@legacy-planes@plane-50.html

  * igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:
    - shard-lnl:          [FAIL][166] ([Intel XE#2948]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html

  * igt@kms_vrr@flip-suspend@pipe-a-edp-1:
    - shard-lnl:          [FAIL][168] ([Intel XE#2443]) -> [PASS][169] +1 other test pass
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [TIMEOUT][170] ([Intel XE#1473]) -> [PASS][171]
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_exec_balancer@many-cm-parallel-basic:
    - shard-bmg:          [DMESG-WARN][172] -> [PASS][173] +3 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-7/igt@xe_exec_balancer@many-cm-parallel-basic.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-4/igt@xe_exec_balancer@many-cm-parallel-basic.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:
    - shard-lnl:          [FAIL][174] -> [PASS][175]
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:
    - shard-lnl:          [FAIL][176] ([Intel XE#3160]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-bmg:          [FAIL][178] -> [PASS][179] +2 other tests pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-invalid-fault:
    - shard-lnl:          [DMESG-WARN][180] ([Intel XE#3230]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html
    - shard-bmg:          [DMESG-WARN][182] ([Intel XE#3230]) -> [PASS][183]
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@xe_exec_fault_mode@twice-invalid-fault.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-4/igt@xe_exec_fault_mode@twice-invalid-fault.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
    - shard-dg2-set2:     [DMESG-WARN][184] -> [PASS][185] +2 other tests pass
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-cm-userptr:
    - shard-adlp:         [DMESG-WARN][186] -> [PASS][187] +2 other tests pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-4/igt@xe_exec_threads@threads-cm-userptr.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-2/igt@xe_exec_threads@threads-cm-userptr.html

  * igt@xe_exec_threads@threads-hang-shared-vm-rebind:
    - shard-dg2-set2:     [DMESG-WARN][188] ([Intel XE#358]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-basic:
    - shard-dg2-set2:     [DMESG-WARN][190] ([Intel XE#3230]) -> [PASS][191] +1 other test pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-434/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-434/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html

  * igt@xe_pm@s4-mocs:
    - shard-lnl:          [ABORT][192] ([Intel XE#1794]) -> [PASS][193]
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_pm@s4-mocs.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@xe_pm@s4-mocs.html

  * igt@xe_pm@s4-multiple-execs:
    - shard-adlp:         [ABORT][194] ([Intel XE#1358] / [Intel XE#1607] / [Intel XE#1794]) -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][196] ([Intel XE#1794]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html

  
#### Warnings ####

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][198] -> [FAIL][199] ([Intel XE#1231] / [Intel XE#1242])
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [DMESG-FAIL][200] ([Intel XE#3194]) -> [FAIL][201] ([Intel XE#1231] / [Intel XE#1242])
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][202] ([Intel XE#1195]) -> [DMESG-WARN][203] ([Intel XE#3113])
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-adlp:         [INCOMPLETE][204] ([Intel XE#1035]) -> [INCOMPLETE][205] ([Intel XE#1035] / [Intel XE#1195])
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping.html

  * igt@xe_live_ktest@xe_eudebug:
    - shard-lnl:          [SKIP][206] ([Intel XE#2833]) -> [SKIP][207] ([Intel XE#3026])
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-6/igt@xe_live_ktest@xe_eudebug.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html

  * igt@xe_live_ktest@xe_mocs:
    - shard-adlp:         [FAIL][208] ([Intel XE#1999]) -> [SKIP][209] ([Intel XE#1192])
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-2/igt@xe_live_ktest@xe_mocs.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_live_ktest@xe_mocs.html

  
  [Intel XE#1000]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000
  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1242]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1475]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2249]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#2509]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2808]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808
  [Intel XE#2833]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2882]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2934]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934
  [Intel XE#2948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#2976]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2976
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3160]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160
  [Intel XE#3177]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177
  [Intel XE#3184]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184
  [Intel XE#3194]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194
  [Intel XE#3230]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/358
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944


Build changes
-------------

  * Linux: xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306 -> xe-pw-140390v2

  IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306: 3ec61d11c7429a65dcc3ac46b9e845f13891a306
  xe-pw-140390v2: 140390v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/index.html

--===============3030585028958754079==
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
<tr><td><b>Series:</b></td><td>drm/xe/oa: Increase default OA buffer size to 128 M (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140390/">https://patchwork.freedesktop.org/series/140390/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306_full -&gt; xe-pw-140390v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-140390v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-140390v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-140390v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-4/igt@kms_async_flips@crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-3/igt@kms_async_flips@crc.html">DMESG-FAIL</a> +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_content_protection@content-type-change.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@bc-hdmi-a6-dp4.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-modeset:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-1/igt@kms_vblank@ts-continuation-modeset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-9/igt@kms_vblank@ts-continuation-modeset.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-3/igt@xe_exec_fault_mode@many-userptr-invalidate-race-prefetch.html">FAIL</a> +6 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_exec_fault_mode@once-invalid-fault.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@xe_exec_fault_mode@once-invalid-fault.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-4/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">DMESG-WARN</a> +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-1/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-466/igt@xe_exec_threads@threads-mixed-fd-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-463/igt@xe_exec_threads@threads-mixed-fd-userptr.html">DMESG-WARN</a> +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@xe_oa@closed-fd-and-unmapped-access.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-4/igt@xe_oa@closed-fd-and-unmapped-access.html">WARN</a> +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@closed-fd-and-unmapped-access@ccs-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-8/igt@xe_oa@closed-fd-and-unmapped-access@ccs-0.html">CRASH</a></li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-4/igt@xe_oa@closed-fd-and-unmapped-access@ccs-0.html">CRASH</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer@ccs-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-6/igt@xe_oa@invalid-map-oa-buffer@ccs-0.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-map-oa-buffer@rcs-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-5/igt@xe_oa@invalid-map-oa-buffer@rcs-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-5/igt@xe_oa@invalid-map-oa-buffer@rcs-0.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@xe_oa@map-oa-buffer.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-1/igt@xe_oa@map-oa-buffer.html">WARN</a> +1 other test warn</li>
</ul>
</li>
<li>
<p>igt@xe_oa@map-oa-buffer@rcs-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-6/igt@xe_oa@map-oa-buffer@rcs-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-8/igt@xe_oa@map-oa-buffer@rcs-0.html">CRASH</a> +1 other test crash</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports@ccs-0:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@xe_oa@mmio-triggered-reports@ccs-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-4/igt@xe_oa@mmio-triggered-reports@ccs-0.html">CRASH</a> +1 other test crash</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@xe_evict@evict-large-multi-vm-cm.html">DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-8/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-6/igt@xe_live_ktest@xe_eudebug.html">SKIP</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140390v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-b-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_ccs@crc-primary-rotation-180-4-tiled-dg2-rc-ccs-cc@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc@pipe-b-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-hdmi-a-6.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-single:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_chamelium_frames@dp-crc-single.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-256x85:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_cursor_crc@cursor-onscreen-256x85.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-6/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-8/igt@kms_cursor_legacy@short-flip-before-cursor-atomic-transitions-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-1/igt@kms_dither@fb-8bpc-vs-panel-8bpc@pipe-a-hdmi-a-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3177">Intel XE#3177</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@ad-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-expired-vblank@ab-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +14 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_flip@2x-plain-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-8/igt@kms_flip@blocking-wf_vblank.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-4/igt@kms_flip@blocking-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-9/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_flip@flip-vs-absolute-wf_vblank@a-hdmi-a1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2882">Intel XE#2882</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-ytile-to-64bpp-ytile-downscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-linear:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-7/igt@kms_flip_tiling@flip-change-tiling@pipe-a-edp-1-x-to-linear.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491">Intel XE#1491</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-1/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-offscren-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-ultra-joiner:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_joiner@invalid-modeset-force-ultra-joiner.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2934">Intel XE#2934</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@kms_plane_cursor@primary@pipe-a-hdmi-a-1-size-128.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-5@pipe-a.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_pm_backlight@fade-with-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_pm_dc@dc6-psr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-6/igt@kms_pm_dc@dc6-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">Intel XE#1430</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes-dpms@plane-41:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-3/igt@kms_pm_rpm@legacy-planes-dpms@plane-41.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-primary-page-flip@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-4/igt@kms_psr@fbc-psr-primary-page-flip@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2808">Intel XE#2808</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-cursor-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@kms_psr@pr-cursor-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-cursor-plane-move@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-8/igt@kms_psr@psr2-cursor-plane-move@edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-6/igt@kms_psr@psr2-cursor-plane-move@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-no-drrs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@kms_psr@psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_rotation_crc@primary-rotation-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2509">Intel XE#2509</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic-fastset:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_vrr@flip-basic-fastset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-4/igt@kms_vrr@flip-basic-fastset.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@negative-basic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@kms_vrr@negative-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499">Intel XE#1499</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@block-copy-compressed-inc-dimension:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_ccs@block-copy-compressed-inc-dimension.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@attach-debug-metadata:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_eudebug@attach-debug-metadata.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@xe_eudebug@basic-vm-bind-ufence.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905">Intel XE#2905</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-434/igt@xe_evict@evict-beng-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-466/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_evict@evict-large.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-435/igt@xe_evict@evict-threads-large.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-466/igt@xe_evict@evict-threads-large.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1000">Intel XE#1000</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_exec_fault_mode@once-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-fd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-2/igt@xe_exec_reset@close-fd.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_exec_reset@close-fd.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) +2 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@cm-close-fd-no-exec:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@xe_exec_reset@cm-close-fd-no-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-7/igt@xe_exec_reset@cm-close-fd-no-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-436/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-434/igt@xe_exec_threads@threads-hang-shared-vm-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mmio-triggered-reports:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@xe_oa@mmio-triggered-reports.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-4/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_oa@mmio-triggered-reports.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@xe_oa@mmio-triggered-reports.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2249">Intel XE#2249</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-exponents@ccs-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-4/igt@xe_oa@oa-exponents@ccs-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-2/igt@xe_oa@oa-exponents@ccs-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2976">Intel XE#2976</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@privileged-forked-access-vaddr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_oa@privileged-forked-access-vaddr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-1/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-9/igt@xe_pm@s4-exec-after.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-7/igt@xe_pm@s4-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-2/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@xe_query@multigpu-query-mem-usage.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-6/igt@kms_async_flips@alternate-sync-async-flip@pipe-c-hdmi-a-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-a-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-toggle:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-436/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1475">Intel XE#1475</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-435/igt@kms_cursor_legacy@flip-vs-cursor-toggle.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-434/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-466/igt@kms_flip@2x-flip-vs-blocking-wf-vblank@ad-hdmi-a6-dp4.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-2/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-3/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@bd-dp2-hdmi-a3.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-434/igt@kms_flip@2x-flip-vs-expired-vblank-interruptible@cd-hdmi-a6-dp4.html">PASS</a> +6 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-suspend@cd-dp2-hdmi-a3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-6/igt@kms_flip@flip-vs-blocking-wf-vblank@a-edp1.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-1/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-8/igt@kms_flip@flip-vs-suspend-interruptible@a-hdmi-a1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-4/igt@kms_flip_tiling@flip-change-tiling.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-1/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1491">Intel XE#1491</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-7/igt@kms_flip_tiling@flip-change-tiling@pipe-b-edp-1-4-to-4-rc-ccs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-8/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-434/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-5/igt@kms_pm_rpm@legacy-planes.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3184">Intel XE#3184</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-5/igt@kms_pm_rpm@legacy-planes.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@legacy-planes@plane-50:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-5/igt@kms_pm_rpm@legacy-planes@plane-50.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-5/igt@kms_pm_rpm@legacy-planes@plane-50.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-page-flip@edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2948">Intel XE#2948</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-5/igt@kms_psr@fbc-psr2-primary-page-flip@edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-suspend@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-3/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-6/igt@kms_vrr@flip-suspend@pipe-a-edp-1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-466/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@many-cm-parallel-basic:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-7/igt@xe_exec_balancer@many-cm-parallel-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-4/igt@xe_exec_balancer@many-cm-parallel-basic.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3160">Intel XE#3160</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-4/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-8/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-invalid-fault:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a></li>
<li>shard-bmg:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-bmg-6/igt@xe_exec_fault_mode@twice-invalid-fault.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-bmg-4/igt@xe_exec_fault_mode@twice-invalid-fault.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-466/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-463/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-4/igt@xe_exec_threads@threads-cm-userptr.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-2/igt@xe_exec_threads@threads-cm-userptr.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-hang-shared-vm-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-464/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/358">Intel XE#358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-436/igt@xe_exec_threads@threads-hang-shared-vm-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-434/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3230">Intel XE#3230</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-434/igt@xe_exec_threads@threads-mixed-shared-vm-basic.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-mocs:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-2/igt@xe_pm@s4-mocs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-1/igt@xe_pm@s4-mocs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-multiple-execs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-9/igt@xe_pm@s4-multiple-execs.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1607">Intel XE#1607</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@xe_pm@s4-multiple-execs.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-3/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3194">Intel XE#3194</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1242">Intel XE#1242</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-dg2-464/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-3/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@kms_plane@pixel-format-source-clamping.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_eudebug:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-lnl-6/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2833">Intel XE#2833</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-lnl-8/igt@xe_live_ktest@xe_eudebug.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3026">Intel XE#3026</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306/shard-adlp-2/igt@xe_live_ktest@xe_mocs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140390v2/shard-adlp-1/igt@xe_live_ktest@xe_mocs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306 -&gt; xe-pw-140390v2</li>
</ul>
<p>IGT_8086: 18939acec2446c6644644186b090d16e366af8bc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2133-3ec61d11c7429a65dcc3ac46b9e845f13891a306: 3ec61d11c7429a65dcc3ac46b9e845f13891a306<br />
  xe-pw-140390v2: 140390v2</p>

</body>
</html>

--===============3030585028958754079==--
