Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE5DAC021B3
	for <intel-xe@archiver.kernel.org>; Fri, 21 Feb 2025 02:09:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5EEBD10EA10;
	Fri, 21 Feb 2025 02:09:15 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EE44210E1F0;
 Fri, 21 Feb 2025 02:09:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3921914496703804275=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_Introduce_drm_sharpness_pr?=
 =?utf-8?q?operty_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 21 Feb 2025 02:09:14 -0000
Message-ID: <174010375494.338270.8523478367290005427@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250219115359.2320992-1-nemesa.garg@intel.com>
In-Reply-To: <20250219115359.2320992-1-nemesa.garg@intel.com>
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

--===============3921914496703804275==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce drm sharpness property (rev9)
URL   : https://patchwork.freedesktop.org/series/139954/
State : failure

== Summary ==

CI Bug Log - changes from xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6_full -> xe-pw-139954v9_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-139954v9_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-139954v9_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-139954v9_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-adlp:         [PASS][1] -> [INCOMPLETE][2] +8 other tests incomplete
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-8/igt@kms_async_flips@alternate-sync-async-flip.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@test-cursor:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][3] +6 other tests incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic@atomic-plane-damage:
    - shard-adlp:         NOTRUN -> [INCOMPLETE][4] +6 other tests incomplete
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_atomic@atomic-plane-damage.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][5] -> [DMESG-FAIL][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_color@ctm-0-75:
    - shard-adlp:         [PASS][7] -> [DMESG-FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-3/igt@kms_color@ctm-0-75.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-6/igt@kms_color@ctm-0-75.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] +7 other tests skip
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-bmg:          NOTRUN -> [SKIP][10] +2 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:
    - shard-bmg:          NOTRUN -> [FAIL][11] +391 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb@ac-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][12] -> [FAIL][13] +965 other tests fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_flip@2x-nonexisting-fb@ac-hdmi-a6-dp4.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@kms_flip@2x-nonexisting-fb@ac-hdmi-a6-dp4.html

  * igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:
    - shard-bmg:          [PASS][14] -> [FAIL][15] +979 other tests fail
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html

  * igt@kms_flip@plain-flip-ts-check@b-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][16] +548 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@kms_flip@plain-flip-ts-check@b-hdmi-a6.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-4:
    - shard-bmg:          [PASS][17] -> [SKIP][18] +105 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-4.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-4.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:
    - shard-adlp:         [PASS][19] -> [SKIP][20] +63 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-8/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4:
    - shard-dg2-set2:     [PASS][21] -> [SKIP][22] +322 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:
    - shard-adlp:         NOTRUN -> [FAIL][23] +200 other tests fail
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt.html

  * igt@kms_hdr@static-swap:
    - shard-bmg:          [PASS][24] -> [INCOMPLETE][25] +17 other tests incomplete
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@kms_hdr@static-swap.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_hdr@static-swap.html

  * igt@kms_hdr@static-toggle:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][26] +1 other test incomplete
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_hdr@static-toggle.html

  * igt@kms_hdr@static-toggle-dpms:
    - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] +15 other tests incomplete
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_hdr@static-toggle-dpms.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@kms_hdr@static-toggle-dpms.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:
    - shard-adlp:         NOTRUN -> [SKIP][29] +6 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:
    - shard-adlp:         [PASS][30] -> [FAIL][31] +647 other tests fail
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-4/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html

  * igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:
    - shard-bmg:          [PASS][32] -> [DMESG-WARN][33] +34 other tests dmesg-warn
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early.html

  * igt@xe_pm@s2idle-basic:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][34] +7 other tests dmesg-warn
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s2idle-basic-exec:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][35] +3 other tests dmesg-warn
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html
    - shard-bmg:          NOTRUN -> [DMESG-WARN][36] +6 other tests dmesg-warn
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@xe_pm@s2idle-basic-exec.html

  * igt@xe_pm@s2idle-exec-after:
    - shard-dg2-set2:     [PASS][37] -> [DMESG-WARN][38] +31 other tests dmesg-warn
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@xe_pm@s2idle-exec-after.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@xe_pm@s2idle-exec-after.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-adlp:         [PASS][39] -> [DMESG-WARN][40] +9 other tests dmesg-warn
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-9/igt@xe_pm_residency@cpg-basic.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@xe_pm_residency@cpg-basic.html

  
#### Warnings ####

  * igt@kms_async_flips@alternate-sync-async-flip:
    - shard-dg2-set2:     [DMESG-WARN][41] -> [INCOMPLETE][42]
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_async_flips@alternate-sync-async-flip.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_async_flips@alternate-sync-async-flip.html

  * igt@kms_async_flips@async-flip-with-page-flip-events:
    - shard-adlp:         [DMESG-WARN][43] ([Intel XE#4330]) -> [INCOMPLETE][44]
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-3/igt@kms_async_flips@async-flip-with-page-flip-events.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html

  * igt@kms_async_flips@async-flip-with-page-flip-events-atomic:
    - shard-bmg:          [DMESG-WARN][45] ([Intel XE#4330]) -> [INCOMPLETE][46] +1 other test incomplete
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_async_flips@async-flip-with-page-flip-events-atomic.html

  * igt@kms_async_flips@crc-atomic:
    - shard-adlp:         [DMESG-FAIL][47] ([Intel XE#4330]) -> [INCOMPLETE][48]
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-2/igt@kms_async_flips@crc-atomic.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@kms_async_flips@crc-atomic.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-bmg:          [SKIP][49] ([Intel XE#2327]) -> [FAIL][50] +16 other tests fail
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         [DMESG-FAIL][51] ([Intel XE#4330]) -> [FAIL][52] +4 other tests fail
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-6/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][53] ([Intel XE#316]) -> [FAIL][54] +16 other tests fail
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_big_fb@x-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-adlp:         [SKIP][55] ([Intel XE#316]) -> [FAIL][56] +15 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-3/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][57] ([Intel XE#4330]) -> [SKIP][58] +6 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [DMESG-WARN][59] -> [FAIL][60]
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:
    - shard-dg2-set2:     [INCOMPLETE][61] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124]) -> [FAIL][62] +1 other test fail
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-adlp:         [SKIP][63] ([Intel XE#314]) -> [FAIL][64]
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-4/igt@kms_cdclk@mode-transition-all-outputs.html
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_cdclk@mode-transition-all-outputs.html
    - shard-dg2-set2:     [SKIP][65] ([Intel XE#314]) -> [FAIL][66]
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@kms_cdclk@mode-transition-all-outputs.html
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          [SKIP][67] ([Intel XE#2252]) -> [FAIL][68] +43 other tests fail
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@dp-hpd-after-suspend:
    - shard-adlp:         [SKIP][69] ([Intel XE#373]) -> [FAIL][70] +35 other tests fail
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-3/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@kms_chamelium_hpd@dp-hpd-after-suspend.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     [SKIP][71] ([Intel XE#373]) -> [FAIL][72] +37 other tests fail
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd.html
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_color@ctm-negative:
    - shard-bmg:          [DMESG-WARN][73] ([Intel XE#877]) -> [FAIL][74] +1 other test fail
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-3/igt@kms_color@ctm-negative.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_color@ctm-negative.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         [SKIP][75] ([Intel XE#455]) -> [INCOMPLETE][76] +7 other tests incomplete
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-6/igt@kms_content_protection@legacy.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-1/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@mei-interface:
    - shard-bmg:          [SKIP][77] ([Intel XE#2341]) -> [INCOMPLETE][78]
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_content_protection@mei-interface.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-suspend:
    - shard-bmg:          [DMESG-WARN][79] ([Intel XE#4330]) -> [FAIL][80] +35 other tests fail
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_cursor_crc@cursor-suspend.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_cursor_crc@cursor-suspend.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic:
    - shard-bmg:          [SKIP][81] ([Intel XE#2291]) -> [SKIP][82] +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_cursor_legacy@cursora-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-dg2-set2:     [DMESG-WARN][83] ([Intel XE#4330]) -> [SKIP][84] +5 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-bmg:          [DMESG-WARN][85] ([Intel XE#4330]) -> [SKIP][86] +3 other tests skip
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:
    - shard-dg2-set2:     [SKIP][87] ([Intel XE#309]) -> [SKIP][88] +3 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:
    - shard-bmg:          [SKIP][89] ([Intel XE#2291]) -> [FAIL][90]
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:
    - shard-dg2-set2:     [SKIP][91] ([Intel XE#309]) -> [FAIL][92] +1 other test fail
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-dpms-vs-vblank-race:
    - shard-dg2-set2:     [SKIP][93] ([Intel XE#310]) -> [FAIL][94] +2 other tests fail
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_flip@2x-dpms-vs-vblank-race.html
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_flip@2x-dpms-vs-vblank-race.html

  * igt@kms_flip@2x-flip-vs-dpms:
    - shard-bmg:          [DMESG-WARN][95] ([Intel XE#2955]) -> [FAIL][96] +2 other tests fail
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_flip@2x-flip-vs-dpms.html
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_flip@2x-flip-vs-dpms.html
    - shard-dg2-set2:     [DMESG-WARN][97] ([Intel XE#2955]) -> [FAIL][98] +2 other tests fail
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_flip@2x-flip-vs-dpms.html
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_flip@2x-flip-vs-dpms.html

  * igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:
    - shard-bmg:          [FAIL][99] ([Intel XE#3321]) -> [FAIL][100] +3 other tests fail
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html

  * igt@kms_flip@2x-nonexisting-fb:
    - shard-bmg:          [SKIP][101] ([Intel XE#2316]) -> [FAIL][102] +9 other tests fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@kms_flip@2x-nonexisting-fb.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_flip@2x-nonexisting-fb.html

  * igt@kms_flip@dpms-vs-vblank-race:
    - shard-bmg:          [FAIL][103] ([Intel XE#3098]) -> [FAIL][104]
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@kms_flip@dpms-vs-vblank-race.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_flip@dpms-vs-vblank-race.html

  * igt@kms_flip@flip-vs-expired-vblank:
    - shard-dg2-set2:     [DMESG-FAIL][105] ([Intel XE#4330]) -> [FAIL][106] +1 other test fail
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank.html
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:
    - shard-dg2-set2:     [FAIL][107] ([Intel XE#301]) -> [FAIL][108] +9 other tests fail
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html

  * igt@kms_flip@flip-vs-expired-vblank@a-dp4:
    - shard-dg2-set2:     [FAIL][109] ([Intel XE#301] / [Intel XE#3321]) -> [FAIL][110] +2 other tests fail
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:
    - shard-dg2-set2:     [DMESG-WARN][111] ([Intel XE#4330]) -> [FAIL][112] +40 other tests fail
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:
    - shard-adlp:         [SKIP][113] ([Intel XE#455]) -> [FAIL][114] +35 other tests fail
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-2/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling:
    - shard-bmg:          [SKIP][115] ([Intel XE#2380]) -> [FAIL][116] +1 other test fail
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][117] ([Intel XE#324] / [Intel XE#4330]) -> [FAIL][118] +1 other test fail
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-2/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:
    - shard-bmg:          [SKIP][119] ([Intel XE#2293] / [Intel XE#2380]) -> [FAIL][120] +20 other tests fail
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:
    - shard-dg2-set2:     [SKIP][121] ([Intel XE#455]) -> [FAIL][122] +37 other tests fail
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode:
    - shard-bmg:          [SKIP][123] ([Intel XE#2293]) -> [FAIL][124] +20 other tests fail
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][125] ([Intel XE#2312]) -> [FAIL][126] +7 other tests fail
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][127] ([Intel XE#656]) -> [FAIL][128] +5 other tests fail
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][129] ([Intel XE#4141]) -> [FAIL][130] +39 other tests fail
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_hdr@static-toggle-suspend:
    - shard-dg2-set2:     [DMESG-WARN][131] ([Intel XE#4330]) -> [INCOMPLETE][132]
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_hdr@static-toggle-suspend.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_hdr@static-toggle-suspend.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-bmg:          [FAIL][133] ([Intel XE#1430]) -> [FAIL][134]
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@kms_pm_dc@dc6-dpms.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-lpsp:
    - shard-bmg:          [SKIP][135] ([Intel XE#1439] / [Intel XE#836]) -> [FAIL][136]
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-3/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         [SKIP][137] ([Intel XE#836]) -> [FAIL][138] +2 other tests fail
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-3/igt@kms_pm_rpm@dpms-non-lpsp.html
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_pm_rpm@modeset-lpsp:
    - shard-bmg:          [SKIP][139] ([Intel XE#1439] / [Intel XE#3141] / [Intel XE#836]) -> [FAIL][140] +2 other tests fail
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_pm_rpm@modeset-lpsp.html
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html

  * igt@kms_rotation_crc@multiplane-rotation:
    - shard-adlp:         [FAIL][141] ([Intel XE#1874]) -> [FAIL][142] +2 other tests fail
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-2/igt@kms_rotation_crc@multiplane-rotation.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-1/igt@kms_rotation_crc@multiplane-rotation.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-bmg:          [SKIP][143] ([Intel XE#2330]) -> [FAIL][144] +2 other tests fail
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
    - shard-dg2-set2:     [SKIP][145] ([Intel XE#1127]) -> [FAIL][146] +2 other tests fail
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-adlp:         [SKIP][147] ([Intel XE#1127]) -> [FAIL][148] +1 other test fail
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-3/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_setmode@basic-clone-single-crtc:
    - shard-bmg:          [SKIP][149] ([Intel XE#1435]) -> [INCOMPLETE][150]
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_setmode@basic-clone-single-crtc.html
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_setmode@basic-clone-single-crtc.html
    - shard-dg2-set2:     [SKIP][151] ([Intel XE#455]) -> [INCOMPLETE][152] +2 other tests incomplete
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_setmode@basic-clone-single-crtc.html
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_setmode@basic-clone-single-crtc.html

  * igt@xe_pm@d3hot-mmap-vram:
    - shard-adlp:         [SKIP][153] ([Intel XE#1948]) -> [FAIL][154]
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-4/igt@xe_pm@d3hot-mmap-vram.html
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@xe_pm@d3hot-mmap-vram.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-bmg:          [DMESG-WARN][155] ([Intel XE#4330]) -> [DMESG-WARN][156] +1 other test dmesg-warn
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-adlp:         [SKIP][157] ([Intel XE#2284] / [Intel XE#366]) -> [FAIL][158] +4 other tests fail
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-6/igt@xe_pm@s3-d3cold-basic-exec.html
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@xe_pm@s3-d3cold-basic-exec.html
    - shard-bmg:          [SKIP][159] ([Intel XE#2284]) -> [FAIL][160] +4 other tests fail
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@xe_pm@s3-d3cold-basic-exec.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@xe_pm@s3-d3cold-basic-exec.html
    - shard-dg2-set2:     [SKIP][161] ([Intel XE#2284] / [Intel XE#366]) -> [FAIL][162] +3 other tests fail
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@xe_pm@s3-d3cold-basic-exec.html
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-bmg:          [DMESG-WARN][163] ([Intel XE#4330] / [Intel XE#569]) -> [FAIL][164]
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@xe_pm@s3-d3hot-basic-exec.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@xe_pm@s3-d3hot-basic-exec.html
    - shard-dg2-set2:     [DMESG-WARN][165] ([Intel XE#4330] / [Intel XE#569]) -> [FAIL][166]
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@xe_pm@s3-d3hot-basic-exec.html
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-dg2-set2:     [ABORT][167] -> [FAIL][168]
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@xe_pm@s4-d3hot-basic-exec.html
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-exec.html
    - shard-adlp:         [ABORT][169] ([Intel XE#4268]) -> [FAIL][170]
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-6/igt@xe_pm@s4-d3hot-basic-exec.html
    - shard-bmg:          [ABORT][171] ([Intel XE#4268]) -> [FAIL][172]
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@xe_pm@s4-d3hot-basic-exec.html
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm_residency@cpg-basic:
    - shard-dg2-set2:     [DMESG-WARN][173] ([Intel XE#4330]) -> [DMESG-WARN][174]
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@xe_pm_residency@cpg-basic.html
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@xe_pm_residency@cpg-basic.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@kms_dp_link_training@non-uhbr-sst}:
    - shard-dg2-set2:     NOTRUN -> [FAIL][175]
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@kms_dp_link_training@non-uhbr-sst.html

  * {igt@kms_dp_link_training@uhbr-sst}:
    - shard-adlp:         NOTRUN -> [SKIP][176] +2 other tests skip
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_dp_link_training@uhbr-sst.html
    - shard-bmg:          NOTRUN -> [SKIP][177] +1 other test skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@kms_dp_link_training@uhbr-sst.html

  
New tests
---------

  New tests have been introduced between xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6_full and xe-pw-139954v9_full:

### New IGT tests (65) ###

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.46] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.46] s

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.44] s

  * igt@kms_color@legacy-gamma@pipe-a-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma@pipe-b-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma@pipe-c-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_color@legacy-gamma@pipe-d-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.44] s

  * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [1.04] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ab-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ac-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ac-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ad-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bc-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bc-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bd-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bd-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@cd-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [0.08] s

  * igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@cd-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.03] s

  * igt@kms_flip@2x-flip-vs-dpms@ab-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [0.08] s

  * igt@kms_flip@2x-flip-vs-dpms@ab-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@kms_flip@2x-flip-vs-dpms@ac-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@kms_flip@2x-flip-vs-dpms@ac-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@2x-flip-vs-dpms@ad-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@kms_flip@2x-flip-vs-dpms@ad-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@2x-flip-vs-dpms@bc-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@kms_flip@2x-flip-vs-dpms@bc-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@2x-flip-vs-dpms@bd-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [0.08] s

  * igt@kms_flip@2x-flip-vs-dpms@bd-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@2x-flip-vs-dpms@cd-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [1.58] s

  * igt@kms_flip@2x-flip-vs-dpms@cd-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ab-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [0.08] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ab-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ac-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ac-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ad-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ad-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@bc-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@bc-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@bd-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@bd-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@cd-dp3-hdmi-a3:
    - Statuses : 1 fail(s)
    - Exec time: [1.86] s

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@cd-hdmi-a7-dp4:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@flip-vs-rmfb@a-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.07] s

  * igt@kms_flip@flip-vs-rmfb@b-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@flip-vs-rmfb@c-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@flip-vs-rmfb@d-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@c-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip@modeset-vs-vblank-race-interruptible@d-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.04] s

  * igt@kms_flip@wf_vblank-ts-check@a-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@wf_vblank-ts-check@b-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.06] s

  * igt@kms_flip@wf_vblank-ts-check@c-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@kms_flip@wf_vblank-ts-check@d-hdmi-a7:
    - Statuses : 1 fail(s)
    - Exec time: [0.05] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.02] s

  * igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-d-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.86] s

  * igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.78] s

  * igt@kms_vblank@accuracy-idle@pipe-a-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_vblank@accuracy-idle@pipe-d-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  * igt@kms_vblank@query-idle-hang@pipe-d-hdmi-a-7:
    - Statuses : 1 fail(s)
    - Exec time: [0.01] s

  

Known issues
------------

  Here are the changes found in xe-pw-139954v9_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@intel_hwmon@hwmon-write:
    - shard-adlp:         NOTRUN -> [SKIP][178] ([Intel XE#1125])
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@intel_hwmon@hwmon-write.html
    - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#1125])
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@intel_hwmon@hwmon-write.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#623])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
    - shard-lnl:          NOTRUN -> [SKIP][181] ([Intel XE#1466])
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][182] ([Intel XE#873])
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_async_flips@test-cursor:
    - shard-lnl:          NOTRUN -> [SKIP][183] ([Intel XE#664])
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-5/igt@kms_async_flips@test-cursor.html

  * igt@kms_atomic@atomic-plane-damage:
    - shard-bmg:          [PASS][184] -> [INCOMPLETE][185] ([Intel XE#4245])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_atomic@atomic-plane-damage.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_atomic@atomic-plane-damage.html

  * igt@kms_atomic@test-only:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][186] ([Intel XE#4245])
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@kms_atomic@test-only.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:
    - shard-dg2-set2:     [PASS][187] -> [INCOMPLETE][188] ([Intel XE#2613]) +1 other test incomplete
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
    - shard-bmg:          [PASS][189] -> [INCOMPLETE][190] ([Intel XE#2613]) +1 other test incomplete
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
    - shard-adlp:         [PASS][191] -> [INCOMPLETE][192] ([Intel XE#2613])
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-2/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs:
    - shard-bmg:          [PASS][193] -> [SKIP][194] ([Intel XE#4258]) +2 other tests skip
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html

  * igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels:
    - shard-lnl:          [PASS][195] -> [FAIL][196] ([Intel XE#3908]) +1 other test fail
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-lnl-6/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-panels.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - shard-bmg:          [PASS][197] -> [FAIL][198] ([Intel XE#3908]) +3 other tests fail
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][199] ([Intel XE#3908] / [Intel XE#4215]) +1 other test fail
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [FAIL][200] ([Intel XE#3908]) +5 other tests fail
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking:
    - shard-bmg:          [PASS][201] -> [FAIL][202] ([Intel XE#3908] / [Intel XE#4215]) +7 other tests fail
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-3/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
    - shard-dg2-set2:     [PASS][203] -> [FAIL][204] ([Intel XE#3908]) +7 other tests fail
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_atomic_transition@plane-all-transition-nonblocking.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@kms_atomic_transition@plane-all-transition-nonblocking.html

  * igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:
    - shard-dg2-set2:     NOTRUN -> [FAIL][205] ([Intel XE#3908]) +5 other tests fail
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-bmg:          NOTRUN -> [FAIL][206] ([Intel XE#3908]) +1 other test fail
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:
    - shard-adlp:         [PASS][207] -> [FAIL][208] ([Intel XE#3908]) +5 other tests fail
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-8/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-bmg:          [PASS][209] -> [SKIP][210] ([Intel XE#4260]) +11 other tests skip
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@linear-16bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][211] ([Intel XE#1407]) +3 other tests skip
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-2/igt@kms_big_fb@linear-16bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-bmg:          NOTRUN -> [SKIP][212] ([Intel XE#4260])
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-addfb-size-overflow:
    - shard-lnl:          NOTRUN -> [SKIP][213] ([Intel XE#1428])
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:
    - shard-lnl:          NOTRUN -> [SKIP][214] ([Intel XE#1124]) +7 other tests skip
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][215] ([Intel XE#1124]) +11 other tests skip
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][216] ([Intel XE#1124]) +10 other tests skip
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html
    - shard-bmg:          NOTRUN -> [SKIP][217] ([Intel XE#1124]) +7 other tests skip
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0.html

  * igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:
    - shard-bmg:          [PASS][218] -> [SKIP][219] ([Intel XE#367]) +2 other tests skip
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
    - shard-adlp:         [PASS][220] -> [SKIP][221] ([Intel XE#367]) +2 other tests skip
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-8/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-bmg:          [PASS][222] -> [SKIP][223] ([Intel XE#2314] / [Intel XE#2894]) +1 other test skip
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [PASS][224] -> [SKIP][225] ([Intel XE#367]) +4 other tests skip
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html

  * igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][226] ([Intel XE#2191]) +1 other test skip
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html
    - shard-lnl:          NOTRUN -> [SKIP][227] ([Intel XE#2191]) +1 other test skip
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-1/igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][228] ([Intel XE#367])
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][229] ([Intel XE#367]) +1 other test skip
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
    - shard-lnl:          NOTRUN -> [SKIP][230] ([Intel XE#367])
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][231] ([Intel XE#455] / [Intel XE#787]) +43 other tests skip
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][232] ([Intel XE#787]) +71 other tests skip
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][233] ([Intel XE#2887]) +18 other tests skip
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][234] ([Intel XE#787]) +173 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][235] ([Intel XE#455] / [Intel XE#787]) +43 other tests skip
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][236] ([Intel XE#2907])
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:
    - shard-bmg:          NOTRUN -> [SKIP][237] ([Intel XE#2887]) +12 other tests skip
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][238] ([Intel XE#3432])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][239] ([Intel XE#3432])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [PASS][240] -> [INCOMPLETE][241] ([Intel XE#3124])
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html

  * igt@kms_cdclk@plane-scaling:
    - shard-bmg:          NOTRUN -> [SKIP][242] ([Intel XE#2724])
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_cdclk@plane-scaling.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-adlp:         NOTRUN -> [SKIP][243] ([Intel XE#306]) +1 other test skip
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_chamelium_color@ctm-0-50.html
    - shard-bmg:          NOTRUN -> [SKIP][244] ([Intel XE#2325]) +1 other test skip
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-0-75:
    - shard-dg2-set2:     NOTRUN -> [SKIP][245] ([Intel XE#306]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_chamelium_color@ctm-0-75.html
    - shard-lnl:          NOTRUN -> [SKIP][246] ([Intel XE#306]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_chamelium_color@ctm-0-75.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-lnl:          NOTRUN -> [SKIP][247] ([Intel XE#373]) +9 other tests skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][248] ([Intel XE#2715] / [Intel XE#4132]) +1 other test incomplete
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@kms_content_protection@lic-type-0.html
    - shard-lnl:          NOTRUN -> [SKIP][249] ([Intel XE#3278]) +2 other tests skip
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_content_protection@lic-type-0.html
    - shard-bmg:          NOTRUN -> [INCOMPLETE][250] ([Intel XE#2715])
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_content_protection@lic-type-0.html

  * igt@kms_content_protection@type1:
    - shard-bmg:          NOTRUN -> [INCOMPLETE][251] ([Intel XE#2715] / [Intel XE#4132])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_content_protection@type1.html

  * igt@kms_cursor_crc@cursor-offscreen-128x42:
    - shard-adlp:         NOTRUN -> [SKIP][252] ([Intel XE#455]) +26 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_cursor_crc@cursor-offscreen-128x42.html
    - shard-bmg:          NOTRUN -> [SKIP][253] ([Intel XE#2320]) +5 other tests skip
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@kms_cursor_crc@cursor-offscreen-128x42.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-adlp:         NOTRUN -> [SKIP][254] ([Intel XE#308]) +1 other test skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][255] ([Intel XE#308]) +1 other test skip
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-lnl:          NOTRUN -> [SKIP][256] ([Intel XE#2321]) +1 other test skip
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html
    - shard-bmg:          NOTRUN -> [SKIP][257] ([Intel XE#2321]) +1 other test skip
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_cursor_crc@cursor-onscreen-64x64:
    - shard-dg2-set2:     [PASS][258] -> [SKIP][259] ([Intel XE#455]) +25 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-64x64.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@kms_cursor_crc@cursor-onscreen-64x64.html

  * igt@kms_cursor_crc@cursor-rapid-movement-64x21:
    - shard-lnl:          NOTRUN -> [SKIP][260] ([Intel XE#1424]) +7 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-movement-64x21.html

  * igt@kms_cursor_crc@cursor-sliding-64x64:
    - shard-dg2-set2:     NOTRUN -> [SKIP][261] ([Intel XE#455]) +13 other tests skip
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_cursor_crc@cursor-sliding-64x64.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:
    - shard-bmg:          NOTRUN -> [SKIP][262] ([Intel XE#2291]) +1 other test skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-dg2-set2:     [PASS][263] -> [SKIP][264] ([Intel XE#309]) +1 other test skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:
    - shard-lnl:          NOTRUN -> [SKIP][265] ([Intel XE#309]) +3 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:
    - shard-bmg:          [PASS][266] -> [SKIP][267] ([Intel XE#2291]) +1 other test skip
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_cursor_legacy@cursora-vs-flipb-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-dg2-set2:     NOTRUN -> [SKIP][268] ([Intel XE#323])
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][269] ([Intel XE#323])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html
    - shard-adlp:         NOTRUN -> [SKIP][270] ([Intel XE#323])
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][271] -> [FAIL][272] ([Intel XE#1540])
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][273] ([Intel XE#4331])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_dp_linktrain_fallback@dp-fallback.html
    - shard-lnl:          NOTRUN -> [SKIP][274] ([Intel XE#4294])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_dsc@dsc-with-formats:
    - shard-lnl:          NOTRUN -> [SKIP][275] ([Intel XE#2244]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-6/igt@kms_dsc@dsc-with-formats.html

  * igt@kms_fbcon_fbt@psr:
    - shard-adlp:         NOTRUN -> [SKIP][276] ([Intel XE#776])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_fbcon_fbt@psr.html

  * igt@kms_feature_discovery@display-4x:
    - shard-adlp:         NOTRUN -> [SKIP][277] ([Intel XE#1138])
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-6/igt@kms_feature_discovery@display-4x.html
    - shard-bmg:          NOTRUN -> [SKIP][278] ([Intel XE#1138])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_feature_discovery@display-4x.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][279] ([Intel XE#1138])
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@kms_feature_discovery@display-4x.html
    - shard-lnl:          NOTRUN -> [SKIP][280] ([Intel XE#1138])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_feature_discovery@display-4x.html

  * igt@kms_flip@2x-flip-vs-absolute-wf_vblank:
    - shard-dg2-set2:     [PASS][281] -> [FAIL][282] ([Intel XE#3333])
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
    - shard-lnl:          NOTRUN -> [SKIP][283] ([Intel XE#1421]) +6 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
    - shard-bmg:          [PASS][284] -> [FAIL][285] ([Intel XE#3333])
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-3/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_flip@2x-flip-vs-absolute-wf_vblank.html

  * igt@kms_flip@2x-flip-vs-wf_vblank:
    - shard-dg2-set2:     [PASS][286] -> [SKIP][287] ([Intel XE#310]) +1 other test skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_flip@2x-flip-vs-wf_vblank.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_flip@2x-flip-vs-wf_vblank.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][288] ([Intel XE#310]) +7 other tests skip
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@2x-plain-flip-ts-check-interruptible:
    - shard-bmg:          [PASS][289] -> [SKIP][290] ([Intel XE#2316]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_flip@2x-plain-flip-ts-check-interruptible.html

  * igt@kms_flip@blocking-wf_vblank:
    - shard-lnl:          [PASS][291] -> [FAIL][292] ([Intel XE#3149] / [Intel XE#886]) +1 other test fail
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-lnl-3/igt@kms_flip@blocking-wf_vblank.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_flip@blocking-wf_vblank.html

  * igt@kms_flip@blocking-wf_vblank@c-edp1:
    - shard-lnl:          [PASS][293] -> [FAIL][294] ([Intel XE#886]) +5 other tests fail
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-lnl-3/igt@kms_flip@blocking-wf_vblank@c-edp1.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_flip@blocking-wf_vblank@c-edp1.html

  * igt@kms_flip@bo-too-big-interruptible@a-edp1:
    - shard-lnl:          NOTRUN -> [INCOMPLETE][295] ([Intel XE#1504]) +1 other test incomplete
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@kms_flip@bo-too-big-interruptible@a-edp1.html

  * igt@kms_flip@flip-vs-expired-vblank@a-edp1:
    - shard-lnl:          [PASS][296] -> [FAIL][297] ([Intel XE#301]) +1 other test fail
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-lnl-3/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@a-edp1.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-dg2-set2:     [PASS][298] -> [FAIL][299] ([Intel XE#3149]) +1 other test fail
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_flip@plain-flip-fb-recreate.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@plain-flip-ts-check:
    - shard-adlp:         NOTRUN -> [FAIL][300] ([Intel XE#3149]) +2 other tests fail
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_flip@plain-flip-ts-check.html

  * igt@kms_flip@plain-flip-ts-check-interruptible:
    - shard-dg2-set2:     NOTRUN -> [FAIL][301] ([Intel XE#3149]) +1 other test fail
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@kms_flip@plain-flip-ts-check-interruptible.html

  * igt@kms_flip@plain-flip-ts-check@b-edp1:
    - shard-lnl:          NOTRUN -> [FAIL][302] ([Intel XE#886]) +2 other tests fail
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@b-edp1.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-adlp:         [PASS][303] -> [FAIL][304] ([Intel XE#3149]) +2 other tests fail
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-9/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][305] ([Intel XE#1397] / [Intel XE#1745])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][306] ([Intel XE#1397])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][307] ([Intel XE#1401] / [Intel XE#1745]) +3 other tests skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][308] ([Intel XE#1401]) +3 other tests skip
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][309] ([Intel XE#352]) +1 other test skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][310] ([Intel XE#651]) +16 other tests skip
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][311] ([Intel XE#651]) +16 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][312] ([Intel XE#656]) +43 other tests skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
    - shard-bmg:          NOTRUN -> [SKIP][313] ([Intel XE#2311]) +18 other tests skip
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-dg2-set2:     NOTRUN -> [SKIP][314] ([Intel XE#651]) +29 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [PASS][315] -> [SKIP][316] ([Intel XE#656]) +3 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][317] ([Intel XE#656]) +1 other test skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][318] ([Intel XE#2312]) +4 other tests skip
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][319] ([Intel XE#1151])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][320] ([Intel XE#653]) +32 other tests skip
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][321] ([Intel XE#653]) +22 other tests skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:
    - shard-bmg:          NOTRUN -> [SKIP][322] ([Intel XE#2313]) +23 other tests skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][323] ([Intel XE#656]) +43 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-lnl:          NOTRUN -> [SKIP][324] ([Intel XE#3374] / [Intel XE#3544])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-6/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_hdr@static-toggle:
    - shard-lnl:          NOTRUN -> [SKIP][325] ([Intel XE#1503])
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-6/igt@kms_hdr@static-toggle.html

  * igt@kms_joiner@basic-force-big-joiner:
    - shard-bmg:          [PASS][326] -> [SKIP][327] ([Intel XE#3012])
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_joiner@basic-force-big-joiner.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_joiner@basic-force-big-joiner.html

  * igt@kms_joiner@basic-ultra-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][328] ([Intel XE#2927])
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@kms_joiner@basic-ultra-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][329] ([Intel XE#2927])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][330] ([Intel XE#2927])
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_joiner@basic-ultra-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][331] ([Intel XE#2927])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@kms_joiner@basic-ultra-joiner.html

  * igt@kms_lease@setcrtc-implicit-plane:
    - shard-bmg:          [PASS][332] -> [FAIL][333] ([Intel XE#4243]) +8 other tests fail
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@kms_lease@setcrtc-implicit-plane.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_lease@setcrtc-implicit-plane.html

  * igt@kms_panel_fitting@legacy:
    - shard-bmg:          NOTRUN -> [SKIP][334] ([Intel XE#2486])
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_panel_fitting@legacy.html

  * igt@kms_pipe_stress@stress-xrgb8888-ytiled:
    - shard-bmg:          NOTRUN -> [SKIP][335] ([Intel XE#4329])
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][336] ([Intel XE#4359])
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html
    - shard-lnl:          NOTRUN -> [SKIP][337] ([Intel XE#4329])
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-3/igt@kms_pipe_stress@stress-xrgb8888-ytiled.html

  * igt@kms_plane@pixel-format:
    - shard-bmg:          [PASS][338] -> [INCOMPLETE][339] ([Intel XE#1035])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_plane@pixel-format.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_plane@pixel-format.html
    - shard-dg2-set2:     [PASS][340] -> [INCOMPLETE][341] ([Intel XE#1035])
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@kms_plane@pixel-format.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@kms_plane@pixel-format.html

  * igt@kms_plane@pixel-format-source-clamping:
    - shard-dg2-set2:     [PASS][342] -> [INCOMPLETE][343] ([Intel XE#1035] / [Intel XE#2566])
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_plane@pixel-format-source-clamping.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@kms_plane@pixel-format-source-clamping.html
    - shard-bmg:          [PASS][344] -> [INCOMPLETE][345] ([Intel XE#1035] / [Intel XE#2566])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_plane@pixel-format-source-clamping.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_plane@pixel-format-source-clamping.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-bmg:          [PASS][346] -> [SKIP][347] ([Intel XE#3380]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_alpha_blend@coverage-7efc:
    - shard-bmg:          [PASS][348] -> [SKIP][349] ([Intel XE#3280]) +2 other tests skip
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@kms_plane_alpha_blend@coverage-7efc.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_plane_alpha_blend@coverage-7efc.html

  * igt@kms_plane_multiple@tiling-none:
    - shard-adlp:         [PASS][350] -> [SKIP][351] ([Intel XE#455]) +49 other tests skip
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-3/igt@kms_plane_multiple@tiling-none.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@kms_plane_multiple@tiling-none.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-bmg:          NOTRUN -> [SKIP][352] ([Intel XE#2493])
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.html
    - shard-lnl:          NOTRUN -> [SKIP][353] ([Intel XE#2493])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-bmg:          NOTRUN -> [SKIP][354] ([Intel XE#2571])
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
    - shard-adlp:         NOTRUN -> [SKIP][355] ([Intel XE#309]) +5 other tests skip
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b:
    - shard-dg2-set2:     NOTRUN -> [SKIP][356] ([Intel XE#2763]) +29 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d:
    - shard-adlp:         [PASS][357] -> [SKIP][358] ([Intel XE#2763] / [Intel XE#455]) +21 other tests skip
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-6/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:
    - shard-adlp:         NOTRUN -> [SKIP][359] ([Intel XE#2763]) +23 other tests skip
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:
    - shard-bmg:          NOTRUN -> [SKIP][360] ([Intel XE#2763]) +34 other tests skip
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][361] ([Intel XE#2763] / [Intel XE#455]) +19 other tests skip
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:
    - shard-lnl:          NOTRUN -> [SKIP][362] ([Intel XE#2763]) +15 other tests skip
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b:
    - shard-adlp:         [PASS][363] -> [SKIP][364] ([Intel XE#2763]) +49 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-4/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html

  * igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c:
    - shard-bmg:          [PASS][365] -> [SKIP][366] ([Intel XE#2763]) +107 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c.html

  * igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:
    - shard-dg2-set2:     [PASS][367] -> [SKIP][368] ([Intel XE#2763]) +65 other tests skip
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25:
    - shard-dg2-set2:     [PASS][369] -> [SKIP][370] ([Intel XE#2763] / [Intel XE#455]) +43 other tests skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_plane_scaling@planes-upscale-factor-0-25.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@kms_plane_scaling@planes-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:
    - shard-adlp:         NOTRUN -> [SKIP][371] ([Intel XE#2763] / [Intel XE#455]) +11 other tests skip
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75.html

  * igt@kms_pm_backlight@fade:
    - shard-bmg:          NOTRUN -> [SKIP][372] ([Intel XE#870])
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_pm_backlight@fade.html
    - shard-adlp:         NOTRUN -> [SKIP][373] ([Intel XE#870])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@kms_pm_backlight@fade.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][374] ([Intel XE#870])
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-bmg:          [PASS][375] -> [FAIL][376] ([Intel XE#4266])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_pm_dc@dc5-dpms-negative.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_pm_dc@dc5-dpms-negative.html
    - shard-dg2-set2:     [PASS][377] -> [FAIL][378] ([Intel XE#4266])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@kms_pm_dc@dc5-dpms-negative.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-lnl:          NOTRUN -> [FAIL][379] ([Intel XE#1430])
   [379]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html
    - shard-bmg:          NOTRUN -> [SKIP][380] ([Intel XE#2392])
   [380]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html
    - shard-adlp:         NOTRUN -> [SKIP][381] ([Intel XE#1129])
   [381]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][382] ([Intel XE#1129])
   [382]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][383] ([Intel XE#734])
   [383]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-lnl:          NOTRUN -> [SKIP][384] ([Intel XE#1439] / [Intel XE#836])
   [384]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:
    - shard-bmg:          NOTRUN -> [SKIP][385] ([Intel XE#1489]) +8 other tests skip
   [385]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area.html

  * igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-adlp:         NOTRUN -> [SKIP][386] ([Intel XE#1489]) +11 other tests skip
   [386]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][387] ([Intel XE#1489]) +10 other tests skip
   [387]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:
    - shard-lnl:          NOTRUN -> [SKIP][388] ([Intel XE#2893]) +6 other tests skip
   [388]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@frontbuffer-xrgb8888:
    - shard-lnl:          NOTRUN -> [SKIP][389] ([Intel XE#1128])
   [389]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-adlp:         NOTRUN -> [SKIP][390] ([Intel XE#1122])
   [390]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrgb8888.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][391] ([Intel XE#1122])
   [391]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrgb8888.html

  * igt@kms_psr@fbc-psr2-cursor-blt:
    - shard-bmg:          NOTRUN -> [SKIP][392] ([Intel XE#2234] / [Intel XE#2850]) +8 other tests skip
   [392]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-blt.html

  * igt@kms_psr@fbc-psr2-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][393] ([Intel XE#2850] / [Intel XE#929]) +11 other tests skip
   [393]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-render.html

  * igt@kms_psr@pr-primary-page-flip:
    - shard-adlp:         NOTRUN -> [SKIP][394] ([Intel XE#2850] / [Intel XE#929]) +13 other tests skip
   [394]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-1/igt@kms_psr@pr-primary-page-flip.html

  * igt@kms_psr@pr-sprite-blt:
    - shard-lnl:          NOTRUN -> [SKIP][395] ([Intel XE#1406]) +3 other tests skip
   [395]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@kms_psr@pr-sprite-blt.html

  * igt@kms_rotation_crc@primary-rotation-270:
    - shard-bmg:          NOTRUN -> [SKIP][396] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [396]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-adlp:         NOTRUN -> [SKIP][397] ([Intel XE#3414]) +1 other test skip
   [397]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_rotation_crc@primary-rotation-270.html
    - shard-lnl:          NOTRUN -> [SKIP][398] ([Intel XE#3414] / [Intel XE#3904]) +1 other test skip
   [398]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-1/igt@kms_rotation_crc@primary-rotation-270.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:
    - shard-lnl:          NOTRUN -> [SKIP][399] ([Intel XE#1127])
   [399]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][400] ([Intel XE#3414]) +2 other tests skip
   [400]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_scaling_modes@scaling-mode-full:
    - shard-bmg:          NOTRUN -> [SKIP][401] ([Intel XE#2413])
   [401]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_scaling_modes@scaling-mode-full.html

  * igt@kms_setmode@clone-exclusive-crtc:
    - shard-bmg:          NOTRUN -> [SKIP][402] ([Intel XE#1435])
   [402]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_setmode@clone-exclusive-crtc.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][403] -> [FAIL][404] ([Intel XE#1522]) +1 other test fail
   [403]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-lnl-4/igt@kms_vrr@flip-basic.html
   [404]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-6/igt@kms_vrr@flip-basic.html

  * igt@kms_vrr@lobf:
    - shard-adlp:         NOTRUN -> [SKIP][405] ([Intel XE#2168])
   [405]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-1/igt@kms_vrr@lobf.html
    - shard-bmg:          NOTRUN -> [SKIP][406] ([Intel XE#2168])
   [406]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_vrr@lobf.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][407] ([Intel XE#2168])
   [407]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@kms_vrr@lobf.html

  * igt@kms_vrr@seamless-rr-switch-vrr:
    - shard-bmg:          NOTRUN -> [SKIP][408] ([Intel XE#1499])
   [408]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vrr.html
    - shard-lnl:          NOTRUN -> [SKIP][409] ([Intel XE#1499]) +1 other test skip
   [409]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-vrr.html

  * igt@kms_writeback@writeback-fb-id:
    - shard-dg2-set2:     NOTRUN -> [SKIP][410] ([Intel XE#756]) +1 other test skip
   [410]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_writeback@writeback-fb-id.html
    - shard-lnl:          NOTRUN -> [SKIP][411] ([Intel XE#756])
   [411]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_writeback@writeback-fb-id.html
    - shard-adlp:         NOTRUN -> [SKIP][412] ([Intel XE#756])
   [412]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_writeback@writeback-fb-id.html
    - shard-bmg:          NOTRUN -> [SKIP][413] ([Intel XE#756])
   [413]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@kms_writeback@writeback-fb-id.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-lnl:          NOTRUN -> [SKIP][414] ([Intel XE#1091] / [Intel XE#2849])
   [414]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_ccs@large-ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][415] ([Intel XE#3576])
   [415]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@xe_ccs@large-ctrl-surf-copy.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-adlp:         NOTRUN -> [SKIP][416] ([Intel XE#1447])
   [416]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-lnl:          NOTRUN -> [SKIP][417] ([Intel XE#1447])
   [417]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_copy_basic@mem-copy-linear-0xfd:
    - shard-adlp:         NOTRUN -> [SKIP][418] ([Intel XE#1123]) +1 other test skip
   [418]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@xe_copy_basic@mem-copy-linear-0xfd.html

  * igt@xe_copy_basic@mem-copy-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][419] ([Intel XE#1123])
   [419]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@xe_copy_basic@mem-copy-linear-0xfffe.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][420] ([Intel XE#1126]) +1 other test skip
   [420]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][421] ([Intel XE#1126])
   [421]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eudebug@basic-vm-bind-metadata-discovery:
    - shard-bmg:          NOTRUN -> [SKIP][422] ([Intel XE#2905]) +7 other tests skip
   [422]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-metadata-discovery.html

  * igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:
    - shard-adlp:         NOTRUN -> [SKIP][423] ([Intel XE#3889])
   [423]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][424] ([Intel XE#3889])
   [424]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html
    - shard-lnl:          NOTRUN -> [SKIP][425] ([Intel XE#3889])
   [425]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-6/igt@xe_eudebug@basic-vm-bind-ufence-sigint-client.html

  * igt@xe_eudebug@discovery-empty-clients:
    - shard-lnl:          NOTRUN -> [SKIP][426] ([Intel XE#2905]) +10 other tests skip
   [426]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@xe_eudebug@discovery-empty-clients.html

  * igt@xe_eudebug@multigpu-basic-client-many:
    - shard-dg2-set2:     NOTRUN -> [SKIP][427] ([Intel XE#2905]) +10 other tests skip
   [427]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@xe_eudebug@multigpu-basic-client-many.html

  * igt@xe_eudebug_online@single-step-one:
    - shard-adlp:         NOTRUN -> [SKIP][428] ([Intel XE#2905]) +11 other tests skip
   [428]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@xe_eudebug_online@single-step-one.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][429] ([Intel XE#261] / [Intel XE#688]) +3 other tests skip
   [429]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@xe_evict@evict-small-external-cm.html
    - shard-lnl:          NOTRUN -> [SKIP][430] ([Intel XE#688]) +4 other tests skip
   [430]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-1/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][431] ([Intel XE#688])
   [431]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-bmg:          NOTRUN -> [SKIP][432] ([Intel XE#2322]) +4 other tests skip
   [432]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][433] ([Intel XE#1392]) +8 other tests skip
   [433]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-null-defer-bind:
    - shard-dg2-set2:     [PASS][434] -> [SKIP][435] ([Intel XE#1392]) +5 other tests skip
   [434]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@xe_exec_basic@multigpu-once-null-defer-bind.html
   [435]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-bind.html

  * igt@xe_exec_basic@multigpu-once-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][436] ([Intel XE#1392]) +8 other tests skip
   [436]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-1/igt@xe_exec_basic@multigpu-once-userptr.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][437] ([Intel XE#288]) +27 other tests skip
   [437]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@xe_exec_fault_mode@once-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr:
    - shard-adlp:         NOTRUN -> [SKIP][438] ([Intel XE#288]) +23 other tests skip
   [438]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@xe_exec_fault_mode@once-bindexecqueue-userptr.html

  * igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:
    - shard-adlp:         [PASS][439] -> [DMESG-WARN][440] ([Intel XE#3970] / [Intel XE#4173]) +1 other test dmesg-warn
   [439]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-4/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html
   [440]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready.html

  * igt@xe_module_load@load:
    - shard-bmg:          ([PASS][441], [PASS][442], [PASS][443], [PASS][444], [PASS][445], [PASS][446], [PASS][447], [PASS][448], [PASS][449], [PASS][450], [PASS][451], [PASS][452], [PASS][453], [PASS][454], [PASS][455], [PASS][456], [PASS][457], [PASS][458], [PASS][459], [PASS][460], [PASS][461], [PASS][462], [PASS][463], [PASS][464], [PASS][465]) -> ([PASS][466], [PASS][467], [PASS][468], [PASS][469], [PASS][470], [PASS][471], [PASS][472], [PASS][473], [PASS][474], [PASS][475], [PASS][476], [PASS][477], [PASS][478], [PASS][479], [PASS][480], [PASS][481], [SKIP][482], [PASS][483], [PASS][484], [PASS][485], [PASS][486], [PASS][487], [PASS][488], [PASS][489], [PASS][490], [PASS][491]) ([Intel XE#2457])
   [441]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@xe_module_load@load.html
   [442]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@xe_module_load@load.html
   [443]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@xe_module_load@load.html
   [444]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@xe_module_load@load.html
   [445]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@xe_module_load@load.html
   [446]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@xe_module_load@load.html
   [447]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@xe_module_load@load.html
   [448]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@xe_module_load@load.html
   [449]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-3/igt@xe_module_load@load.html
   [450]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-3/igt@xe_module_load@load.html
   [451]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@xe_module_load@load.html
   [452]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@xe_module_load@load.html
   [453]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@xe_module_load@load.html
   [454]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@xe_module_load@load.html
   [455]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@xe_module_load@load.html
   [456]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@xe_module_load@load.html
   [457]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-3/igt@xe_module_load@load.html
   [458]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@xe_module_load@load.html
   [459]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@xe_module_load@load.html
   [460]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@xe_module_load@load.html
   [461]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@xe_module_load@load.html
   [462]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@xe_module_load@load.html
   [463]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@xe_module_load@load.html
   [464]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@xe_module_load@load.html
   [465]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@xe_module_load@load.html
   [466]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@xe_module_load@load.html
   [467]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@xe_module_load@load.html
   [468]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@xe_module_load@load.html
   [469]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@xe_module_load@load.html
   [470]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@xe_module_load@load.html
   [471]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@xe_module_load@load.html
   [472]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@xe_module_load@load.html
   [473]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@xe_module_load@load.html
   [474]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@xe_module_load@load.html
   [475]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@xe_module_load@load.html
   [476]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@xe_module_load@load.html
   [477]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@xe_module_load@load.html
   [478]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@xe_module_load@load.html
   [479]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@xe_module_load@load.html
   [480]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@xe_module_load@load.html
   [481]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@xe_module_load@load.html
   [482]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@xe_module_load@load.html
   [483]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@xe_module_load@load.html
   [484]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@xe_module_load@load.html
   [485]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@xe_module_load@load.html
   [486]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@xe_module_load@load.html
   [487]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@xe_module_load@load.html
   [488]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@xe_module_load@load.html
   [489]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@xe_module_load@load.html
   [490]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@xe_module_load@load.html
   [491]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@xe_module_load@load.html
    - shard-dg2-set2:     ([PASS][492], [PASS][493], [PASS][494], [PASS][495], [PASS][496], [PASS][497], [PASS][498], [PASS][499], [PASS][500], [PASS][501], [PASS][502], [PASS][503], [PASS][504], [PASS][505], [PASS][506], [PASS][507], [PASS][508], [PASS][509], [PASS][510], [PASS][511], [PASS][512], [PASS][513], [PASS][514], [PASS][515], [PASS][516]) -> ([PASS][517], [PASS][518], [PASS][519], [PASS][520], [PASS][521], [PASS][522], [PASS][523], [PASS][524], [PASS][525], [PASS][526], [PASS][527], [PASS][528], [PASS][529], [PASS][530], [PASS][531], [PASS][532], [PASS][533], [PASS][534], [PASS][535], [SKIP][536], [PASS][537], [PASS][538], [PASS][539], [PASS][540], [PASS][541], [PASS][542]) ([Intel XE#378])
   [492]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@xe_module_load@load.html
   [493]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@xe_module_load@load.html
   [494]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@xe_module_load@load.html
   [495]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@xe_module_load@load.html
   [496]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@xe_module_load@load.html
   [497]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@xe_module_load@load.html
   [498]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@xe_module_load@load.html
   [499]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@xe_module_load@load.html
   [500]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@xe_module_load@load.html
   [501]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@xe_module_load@load.html
   [502]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@xe_module_load@load.html
   [503]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@xe_module_load@load.html
   [504]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@xe_module_load@load.html
   [505]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@xe_module_load@load.html
   [506]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@xe_module_load@load.html
   [507]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@xe_module_load@load.html
   [508]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@xe_module_load@load.html
   [509]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@xe_module_load@load.html
   [510]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@xe_module_load@load.html
   [511]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@xe_module_load@load.html
   [512]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@xe_module_load@load.html
   [513]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@xe_module_load@load.html
   [514]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@xe_module_load@load.html
   [515]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@xe_module_load@load.html
   [516]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@xe_module_load@load.html
   [517]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@xe_module_load@load.html
   [518]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@xe_module_load@load.html
   [519]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@xe_module_load@load.html
   [520]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@xe_module_load@load.html
   [521]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@xe_module_load@load.html
   [522]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@xe_module_load@load.html
   [523]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@xe_module_load@load.html
   [524]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@xe_module_load@load.html
   [525]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@xe_module_load@load.html
   [526]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@xe_module_load@load.html
   [527]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@xe_module_load@load.html
   [528]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@xe_module_load@load.html
   [529]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@xe_module_load@load.html
   [530]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@xe_module_load@load.html
   [531]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@xe_module_load@load.html
   [532]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@xe_module_load@load.html
   [533]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@xe_module_load@load.html
   [534]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@xe_module_load@load.html
   [535]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@xe_module_load@load.html
   [536]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@xe_module_load@load.html
   [537]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@xe_module_load@load.html
   [538]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@xe_module_load@load.html
   [539]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@xe_module_load@load.html
   [540]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@xe_module_load@load.html
   [541]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@xe_module_load@load.html
   [542]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@xe_module_load@load.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][543] ([Intel XE#3970]) +5 other tests dmesg-warn
   [543]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@xe_module_load@many-reload.html

  * igt@xe_module_load@reload-no-display:
    - shard-adlp:         [PASS][544] -> [DMESG-WARN][545] ([Intel XE#3970]) +15 other tests dmesg-warn
   [544]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-4/igt@xe_module_load@reload-no-display.html
   [545]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@xe_module_load@reload-no-display.html

  * igt@xe_oa@non-zero-reason:
    - shard-adlp:         NOTRUN -> [SKIP][546] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [546]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@xe_oa@non-zero-reason.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][547] ([Intel XE#2541] / [Intel XE#3573]) +3 other tests skip
   [547]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@xe_oa@non-zero-reason.html

  * igt@xe_pat@pat-index-xe2:
    - shard-adlp:         NOTRUN -> [SKIP][548] ([Intel XE#977])
   [548]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@xe_pat@pat-index-xe2.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][549] ([Intel XE#977])
   [549]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@xe_pat@pat-index-xe2.html

  * igt@xe_peer2peer@write:
    - shard-bmg:          NOTRUN -> [SKIP][550] ([Intel XE#2427])
   [550]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@xe_peer2peer@write.html
    - shard-adlp:         NOTRUN -> [SKIP][551] ([Intel XE#1061])
   [551]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@xe_peer2peer@write.html
    - shard-lnl:          NOTRUN -> [SKIP][552] ([Intel XE#1061])
   [552]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-1/igt@xe_peer2peer@write.html

  * igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:
    - shard-dg2-set2:     NOTRUN -> [FAIL][553] ([Intel XE#1173]) +1 other test fail
   [553]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p.html

  * igt@xe_pm@d3cold-mmap-vram:
    - shard-dg2-set2:     NOTRUN -> [SKIP][554] ([Intel XE#2284] / [Intel XE#366])
   [554]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html
    - shard-lnl:          NOTRUN -> [SKIP][555] ([Intel XE#2284] / [Intel XE#366])
   [555]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-2/igt@xe_pm@d3cold-mmap-vram.html
    - shard-adlp:         NOTRUN -> [SKIP][556] ([Intel XE#2284] / [Intel XE#366])
   [556]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@xe_pm@d3cold-mmap-vram.html

  * igt@xe_pm@s3-basic:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][557] ([Intel XE#569]) +1 other test dmesg-warn
   [557]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@xe_pm@s3-basic.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     [PASS][558] -> [DMESG-WARN][559] ([Intel XE#569]) +3 other tests dmesg-warn
   [558]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@xe_pm@s3-basic-exec.html
   [559]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@xe_pm@s3-basic-exec.html
    - shard-lnl:          NOTRUN -> [SKIP][560] ([Intel XE#584]) +1 other test skip
   [560]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-3/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-bmg:          [PASS][561] -> [DMESG-WARN][562] ([Intel XE#569]) +3 other tests dmesg-warn
   [561]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@xe_pm@s3-multiple-execs.html
   [562]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html
    - shard-adlp:         [PASS][563] -> [DMESG-WARN][564] ([Intel XE#569]) +5 other tests dmesg-warn
   [563]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-2/igt@xe_pm@s3-multiple-execs.html
   [564]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][565] ([Intel XE#569])
   [565]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [ABORT][566] ([Intel XE#4268])
   [566]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@gt-c6-freeze:
    - shard-dg2-set2:     [PASS][567] -> [DMESG-WARN][568] ([Intel XE#3088]) +1 other test dmesg-warn
   [567]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@xe_pm_residency@gt-c6-freeze.html
   [568]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@xe_pm_residency@gt-c6-freeze.html

  * igt@xe_pm_residency@gt-c6-freeze@gt0:
    - shard-bmg:          [PASS][569] -> [DMESG-WARN][570] ([Intel XE#3088]) +2 other tests dmesg-warn
   [569]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@xe_pm_residency@gt-c6-freeze@gt0.html
   [570]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@xe_pm_residency@gt-c6-freeze@gt0.html

  * igt@xe_query@multigpu-query-mem-usage:
    - shard-bmg:          NOTRUN -> [SKIP][571] ([Intel XE#944]) +1 other test skip
   [571]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@xe_query@multigpu-query-mem-usage.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][572] ([Intel XE#944]) +1 other test skip
   [572]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@xe_query@multigpu-query-mem-usage.html
    - shard-lnl:          NOTRUN -> [SKIP][573] ([Intel XE#944])
   [573]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@xe_query@multigpu-query-mem-usage.html
    - shard-adlp:         NOTRUN -> [SKIP][574] ([Intel XE#944])
   [574]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@xe_query@multigpu-query-mem-usage.html

  * igt@xe_sriov_auto_provisioning@exclusive-ranges:
    - shard-bmg:          NOTRUN -> [SKIP][575] ([Intel XE#4130])
   [575]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][576] ([Intel XE#4130])
   [576]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@xe_sriov_auto_provisioning@exclusive-ranges.html
    - shard-lnl:          NOTRUN -> [SKIP][577] ([Intel XE#4130])
   [577]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@xe_sriov_auto_provisioning@exclusive-ranges.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - shard-lnl:          NOTRUN -> [SKIP][578] ([Intel XE#3342])
   [578]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-5/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@large-userptr-split-misaligned-binds-2147483648:
    - shard-adlp:         [PASS][579] -> [DMESG-WARN][580] ([Intel XE#3868])
   [579]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-4/igt@xe_vm@large-userptr-split-misaligned-binds-2147483648.html
   [580]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@xe_vm@large-userptr-split-misaligned-binds-2147483648.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [PASS][581] -> [DMESG-WARN][582] ([Intel XE#3858])
   [581]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@xe_wedged@basic-wedged.html
   [582]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@xe_wedged@basic-wedged.html
    - shard-bmg:          [PASS][583] -> [DMESG-WARN][584] ([Intel XE#3858])
   [583]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@xe_wedged@basic-wedged.html
   [584]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@xe_wedged@basic-wedged.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear:
    - shard-lnl:          [FAIL][585] ([Intel XE#911]) -> [PASS][586] +3 other tests pass
   [585]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-lnl-6/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html
   [586]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [FAIL][587] ([Intel XE#899]) -> [PASS][588]
   [587]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [588]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@xe_evict@evict-beng-large-external:
    - shard-bmg:          [DMESG-WARN][589] ([Intel XE#1473] / [Intel XE#4330]) -> [PASS][590]
   [589]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@xe_evict@evict-beng-large-external.html
   [590]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@xe_evict@evict-beng-large-external.html

  * igt@xe_exec_threads@threads-userptr-rebind:
    - shard-dg2-set2:     [DMESG-WARN][591] ([Intel XE#4330]) -> [PASS][592] +5 other tests pass
   [591]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@xe_exec_threads@threads-userptr-rebind.html
   [592]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@xe_exec_threads@threads-userptr-rebind.html

  * igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:
    - shard-dg2-set2:     [FAIL][593] ([Intel XE#1999]) -> [PASS][594] +2 other tests pass
   [593]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html
   [594]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html

  * igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:
    - shard-bmg:          [DMESG-WARN][595] ([Intel XE#4330]) -> [PASS][596] +9 other tests pass
   [595]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html
   [596]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.html

  
#### Warnings ####

  * igt@core_hotunplug@hotunbind-rebind:
    - shard-adlp:         [DMESG-WARN][597] ([Intel XE#4173]) -> [DMESG-WARN][598] ([Intel XE#3970])
   [597]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-4/igt@core_hotunplug@hotunbind-rebind.html
   [598]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-1/igt@core_hotunplug@hotunbind-rebind.html

  * igt@kms_atomic@plane-primary-overlay-mutable-zpos:
    - shard-bmg:          [SKIP][599] ([Intel XE#2385]) -> [INCOMPLETE][600] ([Intel XE#4245])
   [599]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html
   [600]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][601] ([Intel XE#2191]) -> [SKIP][602] ([Intel XE#367])
   [601]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [602]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][603] ([Intel XE#2314] / [Intel XE#2894]) -> [SKIP][604] ([Intel XE#367]) +1 other test skip
   [603]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [604]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][605] ([Intel XE#787]) -> [SKIP][606] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [605]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [606]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][607] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][608] ([Intel XE#787]) +8 other tests skip
   [607]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html
   [608]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][609] -> [INCOMPLETE][610] ([Intel XE#3124])
   [609]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [610]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-dg2-set2:     [DMESG-FAIL][611] ([Intel XE#4330]) -> [INCOMPLETE][612] ([Intel XE#2715] / [Intel XE#4132]) +1 other test incomplete
   [611]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_content_protection@atomic-dpms.html
   [612]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_content_protection@atomic-dpms.html
    - shard-bmg:          [DMESG-FAIL][613] ([Intel XE#4330]) -> [INCOMPLETE][614] ([Intel XE#2715] / [Intel XE#4132])
   [613]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html
   [614]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@content-type-change:
    - shard-bmg:          [SKIP][615] ([Intel XE#2341]) -> [INCOMPLETE][616] ([Intel XE#2715]) +3 other tests incomplete
   [615]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_content_protection@content-type-change.html
   [616]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][617] ([Intel XE#2341]) -> [INCOMPLETE][618] ([Intel XE#2715] / [Intel XE#4132])
   [617]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@kms_content_protection@legacy.html
   [618]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_content_protection@legacy.html
    - shard-dg2-set2:     [FAIL][619] ([Intel XE#1178]) -> [INCOMPLETE][620] ([Intel XE#2715] / [Intel XE#4132])
   [619]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_content_protection@legacy.html
   [620]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-1:
    - shard-dg2-set2:     [SKIP][621] ([Intel XE#455]) -> [INCOMPLETE][622] ([Intel XE#2715] / [Intel XE#4132]) +2 other tests incomplete
   [621]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_content_protection@lic-type-1.html
   [622]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@kms_content_protection@lic-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2-set2:     [SKIP][623] ([Intel XE#455]) -> [INCOMPLETE][624] ([Intel XE#4132])
   [623]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_content_protection@mei-interface.html
   [624]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_content_protection@mei-interface.html

  * igt@kms_content_protection@srm:
    - shard-bmg:          [FAIL][625] ([Intel XE#1178]) -> [INCOMPLETE][626] ([Intel XE#2715] / [Intel XE#4132])
   [625]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_content_protection@srm.html
   [626]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_content_protection@srm.html

  * igt@kms_content_protection@uevent:
    - shard-dg2-set2:     [FAIL][627] ([Intel XE#1188]) -> [INCOMPLETE][628] ([Intel XE#2715] / [Intel XE#4132])
   [627]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_content_protection@uevent.html
   [628]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_content_protection@uevent.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-toggle:
    - shard-bmg:          [DMESG-WARN][629] ([Intel XE#4330]) -> [SKIP][630] ([Intel XE#2291]) +1 other test skip
   [629]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html
   [630]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-dg2-set2:     [DMESG-WARN][631] ([Intel XE#4330]) -> [SKIP][632] ([Intel XE#309])
   [631]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [632]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  * igt@kms_flip@2x-busy-flip:
    - shard-bmg:          [DMESG-WARN][633] ([Intel XE#4330]) -> [SKIP][634] ([Intel XE#2316])
   [633]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_flip@2x-busy-flip.html
   [634]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@kms_flip@2x-busy-flip.html
    - shard-dg2-set2:     [DMESG-WARN][635] ([Intel XE#4330]) -> [SKIP][636] ([Intel XE#310])
   [635]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_flip@2x-busy-flip.html
   [636]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_flip@2x-busy-flip.html

  * igt@kms_flip@plain-flip-fb-recreate:
    - shard-lnl:          [FAIL][637] ([Intel XE#886]) -> [FAIL][638] ([Intel XE#3149] / [Intel XE#886])
   [637]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-lnl-8/igt@kms_flip@plain-flip-fb-recreate.html
   [638]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-6/igt@kms_flip@plain-flip-fb-recreate.html

  * igt@kms_flip@wf_vblank-ts-check-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][639] ([Intel XE#4330]) -> [FAIL][640] ([Intel XE#3149])
   [639]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_flip@wf_vblank-ts-check-interruptible.html
   [640]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_flip@wf_vblank-ts-check-interruptible.html

  * igt@kms_flip_tiling@flip-change-tiling:
    - shard-bmg:          [DMESG-WARN][641] ([Intel XE#4330]) -> [SKIP][642] ([Intel XE#2682])
   [641]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_flip_tiling@flip-change-tiling.html
   [642]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_flip_tiling@flip-change-tiling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:
    - shard-bmg:          [SKIP][643] ([Intel XE#2311]) -> [SKIP][644] ([Intel XE#2312]) +12 other tests skip
   [643]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html
   [644]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     [SKIP][645] ([Intel XE#656]) -> [SKIP][646] ([Intel XE#651]) +16 other tests skip
   [645]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [646]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][647] ([Intel XE#2312]) -> [SKIP][648] ([Intel XE#2311]) +21 other tests skip
   [647]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [648]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:
    - shard-dg2-set2:     [SKIP][649] ([Intel XE#651]) -> [SKIP][650] ([Intel XE#656]) +10 other tests skip
   [649]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html
   [650]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:
    - shard-dg2-set2:     [DMESG-WARN][651] ([Intel XE#4330]) -> [SKIP][652] ([Intel XE#656])
   [651]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html
   [652]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:
    - shard-bmg:          [SKIP][653] ([Intel XE#4141]) -> [SKIP][654] ([Intel XE#2312]) +6 other tests skip
   [653]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html
   [654]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-bmg:          [SKIP][655] ([Intel XE#2313]) -> [SKIP][656] ([Intel XE#2312]) +13 other tests skip
   [655]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [656]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][657] ([Intel XE#656]) -> [SKIP][658] ([Intel XE#653]) +9 other tests skip
   [657]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [658]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:
    - shard-dg2-set2:     [SKIP][659] ([Intel XE#653]) -> [SKIP][660] ([Intel XE#656]) +8 other tests skip
   [659]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html
   [660]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:
    - shard-bmg:          [SKIP][661] ([Intel XE#2312]) -> [SKIP][662] ([Intel XE#2313]) +15 other tests skip
   [661]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html
   [662]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_hdr@brightness-with-hdr:
    - shard-bmg:          [SKIP][663] ([Intel XE#3374] / [Intel XE#3544]) -> [SKIP][664] ([Intel XE#3544])
   [663]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-3/igt@kms_hdr@brightness-with-hdr.html
   [664]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_hdr@brightness-with-hdr.html

  * igt@kms_plane@plane-panning-bottom-right-suspend:
    - shard-dg2-set2:     [DMESG-WARN][665] ([Intel XE#4330]) -> [SKIP][666] ([Intel XE#455]) +5 other tests skip
   [665]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_plane@plane-panning-bottom-right-suspend.html
   [666]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:
    - shard-bmg:          [DMESG-WARN][667] ([Intel XE#4330]) -> [SKIP][668] ([Intel XE#2763]) +1 other test skip
   [667]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html
   [668]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [DMESG-WARN][669] ([Intel XE#4330] / [Intel XE#569]) -> [DMESG-WARN][670] ([Intel XE#569]) +2 other tests dmesg-warn
   [669]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html
   [670]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-bmg:          [DMESG-WARN][671] ([Intel XE#4330] / [Intel XE#569]) -> [DMESG-WARN][672] ([Intel XE#569]) +3 other tests dmesg-warn
   [671]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@xe_pm@s3-vm-bind-userptr.html
   [672]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-adlp:         [ABORT][673] ([Intel XE#4268]) -> [ABORT][674] ([Intel XE#4054] / [Intel XE#4268])
   [673]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html
   [674]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@xe_pm@s4-vm-bind-unbind-all.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1035]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1035
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1125]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1125
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1173
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1397]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1428]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1428
  [Intel XE#1430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1466]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1466
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1499
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1504]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1504
  [Intel XE#1522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522
  [Intel XE#1540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1540
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1948]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1948
  [Intel XE#1999]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1999
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
  [Intel XE#2321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2321
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2330
  [Intel XE#2341]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2341
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2385]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2385
  [Intel XE#2392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392
  [Intel XE#2413]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2413
  [Intel XE#2427]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#2486]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2486
  [Intel XE#2493]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2493
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2566]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566
  [Intel XE#2571]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2571
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2613]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2613
  [Intel XE#2682]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2682
  [Intel XE#2715]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715
  [Intel XE#2724]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2724
  [Intel XE#2763]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2763
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2905]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2905
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2927]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2927
  [Intel XE#2955]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2955
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#3088]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3088
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3280
  [Intel XE#3321]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3321
  [Intel XE#3333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3333
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#3374]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3374
  [Intel XE#3380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3380
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3432]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3432
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#3544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3544
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#3576]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3576
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#3858]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3858
  [Intel XE#3868]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868
  [Intel XE#3889]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3889
  [Intel XE#3904]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3904
  [Intel XE#3908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908
  [Intel XE#3970]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3970
  [Intel XE#4054]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4054
  [Intel XE#4130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4130
  [Intel XE#4132]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4215]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4215
  [Intel XE#4243]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4243
  [Intel XE#4245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4245
  [Intel XE#4258]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4258
  [Intel XE#4260]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4260
  [Intel XE#4266]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4266
  [Intel XE#4268]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4268
  [Intel XE#4294]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4294
  [Intel XE#4329]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4329
  [Intel XE#4330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330
  [Intel XE#4331]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4331
  [Intel XE#4354]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4354
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4359]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4359
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#664]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/664
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#776]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/776
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977


Build changes
-------------

  * IGT: IGT_8239 -> IGT_8241
  * Linux: xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6 -> xe-pw-139954v9

  IGT_8239: f058a041a6b7b7643246a92b7f1ff5d4e22a926f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8241: 983ffca5ff96fd67c937691337f4488e28948aa7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6: e19eb43c82480789a93ce0c452e22bbd851b93c6
  xe-pw-139954v9: 139954v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/index.html

--===============3921914496703804275==
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
<tr><td><b>Series:</b></td><td>Introduce drm sharpness property (rev9)</td>=
</tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/139954/">https://patchwork.freedesktop.org/series/139954/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139954v9/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-139954v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2692-e19eb43c82480789a93ce0c452e22bbd8=
51b93c6_full -&gt; xe-pw-139954v9_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-139954v9_full absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-139954v9_full, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1399=
54v9_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-8/igt@kms_asy=
nc_flips@alternate-sync-async-flip.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_async=
_flips@alternate-sync-async-flip.html">INCOMPLETE</a> +8 other tests incomp=
lete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@kms_async_flips@test-cursor=
.html">INCOMPLETE</a> +6 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-plane-damage:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_atomic@atomic-plane-dama=
ge.html">INCOMPLETE</a> +6 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg=
2-436/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-hdmi-a-6.html">=
DMESG-FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-0-75:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-3/igt@kms_col=
or@ctm-0-75.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-139954v9/shard-adlp-6/igt@kms_color@ctm-0-75.html">DMESG-F=
AIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_cursor_legacy@2x-nonblo=
cking-modeset-vs-cursor-atomic.html">SKIP</a> +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-interruptible@cd-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning-i=
nterruptible@cd-dp2-hdmi-a3.html">FAIL</a> +391 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb@ac-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_fl=
ip@2x-nonexisting-fb@ac-hdmi-a6-dp4.html">PASS</a> -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@kms_fli=
p@2x-nonexisting-fb@ac-hdmi-a6-dp4.html">FAIL</a> +965 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_flip=
@plain-flip-ts-check-interruptible@d-hdmi-a3.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/ig=
t@kms_flip@plain-flip-ts-check-interruptible@d-hdmi-a3.html">FAIL</a> +979 =
other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@kms_flip@plain-flip-ts-chec=
k@b-hdmi-a6.html">FAIL</a> +548 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_flip=
_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-4.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6=
/igt@kms_flip_tiling@flip-change-tiling@pipe-a-hdmi-a-3-4-to-4.html">SKIP</=
a> +105 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-8/igt@kms_fli=
p_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">PASS</a> -&gt; <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp=
-6/igt@kms_flip_tiling@flip-change-tiling@pipe-c-hdmi-a-1-x-to-x.html">SKIP=
</a> +63 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_fl=
ip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4.html">PASS</a> -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2=
-434/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-6-4-to-4.html">SK=
IP</a> +322 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc=
-1p-primscrn-cur-indfb-draw-blt.html">FAIL</a> +200 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-swap:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@kms_hdr@=
static-swap.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_hdr@static-swap.html">INCOMPL=
ETE</a> +17 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_hdr@static-toggle.html">I=
NCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_hd=
r@static-toggle-dpms.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@kms_hdr@static-toggle-=
dpms.html">INCOMPLETE</a> +15 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-rotation@pipe-a:</=
p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@kms_plane_scaling@plane-scal=
er-unity-scaling-with-rotation@pipe-a.html">SKIP</a> +6 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-4/igt@kms_uni=
versal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">PASS</a> -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-6/igt@=
kms_universal_plane@cursor-fb-leak@pipe-c-hdmi-a-1.html">FAIL</a> +647 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_early:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@xe_fault=
_injection@inject-fault-probe-function-xe_ggtt_init_early.html">PASS</a> -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/sha=
rd-bmg-3/igt@xe_fault_injection@inject-fault-probe-function-xe_ggtt_init_ea=
rly.html">DMESG-WARN</a> +34 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@xe_pm@s2idle-basic.html">DM=
ESG-WARN</a> +7 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@xe_pm@s2idle-basic-exec.html=
">DMESG-WARN</a> +3 other tests dmesg-warn</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@xe_pm@s2idle-basic-exec.html"=
>DMESG-WARN</a> +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@xe_pm@=
s2idle-exec-after.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@xe_pm@s2idle-exec-after.h=
tml">DMESG-WARN</a> +31 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-9/igt@xe_pm_r=
esidency@cpg-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@xe_pm_residency@cpg-basic=
.html">DMESG-WARN</a> +9 other tests dmesg-warn</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@alternate-sync-async-flip:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_as=
ync_flips@alternate-sync-async-flip.html">DMESG-WARN</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@k=
ms_async_flips@alternate-sync-async-flip.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-3/igt@kms_asy=
nc_flips@async-flip-with-page-flip-events.html">DMESG-WARN</a> (<a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>=
) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9=
/shard-adlp-9/igt@kms_async_flips@async-flip-with-page-flip-events.html">IN=
COMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-atomic.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#43=
30</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
9954v9/shard-bmg-1/igt@kms_async_flips@async-flip-with-page-flip-events-ato=
mic.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@crc-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-2/igt@kms_asy=
nc_flips@crc-atomic.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@kms_=
async_flips@crc-atomic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@kms_big_=
fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2327">Intel XE#2327</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_=
big_fb@4-tiled-32bpp-rotate-90.html">FAIL</a> +16 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-6/igt@kms_big=
_fb@x-tiled-64bpp-rotate-180.html">DMESG-FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3=
/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> +4 other tests fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_bi=
g_fb@x-tiled-8bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@km=
s_big_fb@x-tiled-8bpp-rotate-270.html">FAIL</a> +16 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-3/igt@kms_big=
_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@kms_=
big_fb@y-tiled-64bpp-rotate-90.html">FAIL</a> +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-9/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel=
 XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139954v9/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">DMESG-WARN</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-4=
66/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs-cc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs-cc.html">INCOMPLETE</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel=
 XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3124">Intel XE#3124</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tile=
d-dg2-rc-ccs-cc.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-4/igt@kms_cdc=
lk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@k=
ms_cdclk@mode-transition-all-outputs.html">FAIL</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@kms_cd=
clk@mode-transition-all-outputs.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt=
@kms_cdclk@mode-transition-all-outputs.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@kms_cham=
elium_edid@dp-edid-change-during-hibernate.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shar=
d-bmg-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html">FAIL</=
a> +43 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-after-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-3/igt@kms_cha=
melium_hpd@dp-hpd-after-suspend.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@=
kms_chamelium_hpd@dp-hpd-after-suspend.html">FAIL</a> +35 other tests fail<=
/li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_ch=
amelium_hpd@vga-hpd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@kms_chameli=
um_hpd@vga-hpd.html">FAIL</a> +37 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-3/igt@kms_colo=
r@ctm-negative.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_color@ct=
m-negative.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-6/igt@kms_con=
tent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-1/igt@kms_conte=
nt_protection@legacy.html">INCOMPLETE</a> +7 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_cont=
ent_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@km=
s_content_protection@mei-interface.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_curs=
or_crc@cursor-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms=
_cursor_crc@cursor-suspend.html">FAIL</a> +35 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_curs=
or_legacy@cursora-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/i=
gt@kms_cursor_legacy@cursora-vs-flipb-atomic.html">SKIP</a> +2 other tests =
skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WA=
RN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330=
">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139954v9/shard-dg2-436/igt@kms_cursor_legacy@cursorb-vs-flipa-at=
omic-transitions-varying-size.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_curs=
or_legacy@cursorb-vs-flipa-legacy.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-b=
mg-5/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> +3 other =
tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-d=
g2-432/igt@kms_cursor_legacy@cursorb-vs-flipa-varying-size.html">SKIP</a> +=
3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/i=
gt@kms_cursor_legacy@cursorb-vs-flipb-atomic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-atomic-transitions-varying-size.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel=
 XE#309</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-139954v9/shard-dg2-466/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-tra=
nsitions-varying-size.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-dpms-vs-vblank-race:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_fl=
ip@2x-dpms-vs-vblank-race.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_f=
lip@2x-dpms-vs-vblank-race.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_flip=
@2x-flip-vs-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_flip=
@2x-flip-vs-dpms.html">FAIL</a> +2 other tests fail</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_fl=
ip@2x-flip-vs-dpms.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2955">Intel XE#2955</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_=
flip@2x-flip-vs-dpms.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_flip=
@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard=
-bmg-1/igt@kms_flip@2x-flip-vs-expired-vblank@ac-dp2-hdmi-a3.html">FAIL</a>=
 +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@kms_flip=
@2x-nonexisting-fb.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_flip@2x-=
nonexisting-fb.html">FAIL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@dpms-vs-vblank-race:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@kms_flip=
@dpms-vs-vblank-race.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3098">Intel XE#3098</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_flip@d=
pms-vs-vblank-race.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/=
igt@kms_flip@flip-vs-expired-vblank.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank-interruptible@a-dp4.html">FAIL</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/sha=
rd-dg2-466/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-dp4.html">FA=
IL</a> +9 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_fl=
ip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/3321">Intel XE#3321</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/sha=
rd-dg2-433/igt@kms_flip@flip-vs-expired-vblank@a-dp4.html">FAIL</a> +2 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_fl=
ip_scaled_crc@flip-32bpp-4tile-to-64bpp-4tile-downscaling.html">DMESG-WARN<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">I=
ntel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-139954v9/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-=
64bpp-4tile-downscaling.html">FAIL</a> +40 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-2/igt@kms_fli=
p_scaled_crc@flip-32bpp-yftileccs-to-64bpp-yftile-upscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel =
XE#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-139954v9/shard-adlp-1/igt@kms_flip_scaled_crc@flip-32bpp-yftileccs-to-64b=
pp-yftile-upscaling.html">FAIL</a> +35 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscal=
ing:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@kms_flip=
_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">I=
ntel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-139954v9/shard-bmg-5/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32=
bpp-4tiledg2rcccs-downscaling.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-2/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Int=
el XE#324</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp=
-xtile-to-16bpp-xtile-downscaling.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@kms_flip=
_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel X=
E#2293</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/2380">Intel XE#2380</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@kms_flip_scaled_crc@flip-64bpp-yft=
ile-to-16bpp-yftile-downscaling.html">FAIL</a> +20 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_fl=
ip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytile-downscaling.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE=
#455</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
139954v9/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-yt=
ile-downscaling.html">FAIL</a> +37 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling=
@pipe-a-valid-mode:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-3/igt@kms_flip=
_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-m=
ode.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2293">Intel XE#2293</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_flip_scaled_crc@flip-64=
bpp-ytile-to-32bpp-ytilercccs-downscaling@pipe-a-valid-mode.html">FAIL</a> =
+20 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39954v9/shard-bmg-1/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-=
draw-render.html">FAIL</a> +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39954v9/shard-dg2-463/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indf=
b-draw-render.html">FAIL</a> +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v=
9/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">FAIL</a> +39 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_hd=
r@static-toggle-suspend.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt=
@kms_hdr@static-toggle-suspend.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@kms_pm_d=
c@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/1430">Intel XE#1430</a>) -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_pm_dc@dc6-dpms.h=
tml">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-3/igt@kms_pm_r=
pm@dpms-mode-unset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8=
/igt@kms_pm_rpm@dpms-mode-unset-lpsp.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-3/igt@kms_pm_=
rpm@dpms-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_pm_rpm@dpm=
s-non-lpsp.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-lpsp:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_pm_r=
pm@modeset-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a> / <a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard=
-bmg-5/igt@kms_pm_rpm@modeset-lpsp.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-2/igt@kms_rot=
ation_crc@multiplane-rotation.html">FAIL</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-1/igt@=
kms_rotation_crc@multiplane-rotation.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_rota=
tion_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2330">Intel XE#2330</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bm=
g-1/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">FAIL</a> +2 ot=
her tests fail</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-=
dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">FAIL</a> +=
2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-3/igt@kms_rot=
ation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-ad=
lp-4/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">FAIL</a> +1 ot=
her test fail</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@basic-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_setm=
ode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms=
_setmode@basic-clone-single-crtc.html">INCOMPLETE</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_se=
tmode@basic-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@k=
ms_setmode@basic-clone-single-crtc.html">INCOMPLETE</a> +2 other tests inco=
mplete</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3hot-mmap-vram:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-4/igt@xe_pm@d=
3hot-mmap-vram.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1948">Intel XE#1948</a>) -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@xe_pm@d3hot-mma=
p-vram.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@xe_pm@s2=
idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@x=
e_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> +1 other test dmesg-war=
n</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-6/igt@xe_pm@s=
3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/i=
gt@xe_pm@s3-d3cold-basic-exec.html">FAIL</a> +4 other tests fail</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@xe_pm@s3=
-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/2284">Intel XE#2284</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@xe_pm@s3-d3c=
old-basic-exec.html">FAIL</a> +4 other tests fail</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@xe_pm@=
s3-d3cold-basic-exec.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/=
igt@xe_pm@s3-d3cold-basic-exec.html">FAIL</a> +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@xe_pm@s3=
-d3hot-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4330">Intel XE#4330</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-4=
/igt@xe_pm@s3-d3hot-basic-exec.html">FAIL</a></li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@xe_pm@=
s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a> / <a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2=
-464/igt@xe_pm@s3-d3hot-basic-exec.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@xe_pm@=
s4-d3hot-basic-exec.html">ABORT</a> -&gt; <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@xe_pm@s4-d3hot-basic-e=
xec.html">FAIL</a></li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-9/igt@xe_pm@s=
4-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-6/igt@xe_pm@s4-d=
3hot-basic-exec.html">FAIL</a></li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@xe_pm@s4=
-d3hot-basic-exec.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@xe_pm@s4-d3h=
ot-basic-exec.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@cpg-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@xe_pm_=
residency@cpg-basic.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@xe_=
pm_residency@cpg-basic.html">DMESG-WARN</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<=
br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@kms_dp_link_training@non-uhbr-sst}:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@kms_dp_link_training@non-uh=
br-sst.html">FAIL</a></li>
</ul>
</li>
<li>
<p>{igt@kms_dp_link_training@uhbr-sst}:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_dp_link_training@uhbr-ss=
t.html">SKIP</a> +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@kms_dp_link_training@uhbr-sst=
.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-2692-e19eb43c82480789a93ce0c45=
2e22bbd851b93c6_full and xe-pw-139954v9_full:</p>
<h3>New IGT tests (65)</h3>
<ul>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.46] s</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.44] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_edge_walk@128x128-top-bottom@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ab-dp3-hdmi-a3=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ab-hdmi-a7-dp4=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ac-dp3-hdmi-a3=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ac-hdmi-a7-dp4=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ad-dp3-hdmi-a3=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@ad-hdmi-a7-dp4=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bc-dp3-hdmi-a3=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bc-hdmi-a7-dp4=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bd-dp3-hdmi-a3=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@bd-hdmi-a7-dp4=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@cd-dp3-hdmi-a3=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-off-vs-modeset-interruptible@cd-hdmi-a7-dp4=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@ab-dp3-hdmi-a3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@ab-hdmi-a7-dp4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@ac-dp3-hdmi-a3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@ac-hdmi-a7-dp4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@ad-dp3-hdmi-a3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@ad-hdmi-a7-dp4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@bc-dp3-hdmi-a3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@bc-hdmi-a7-dp4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@bd-dp3-hdmi-a3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@bd-hdmi-a7-dp4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@cd-dp3-hdmi-a3:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.58] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms@cd-hdmi-a7-dp4:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ab-dp3-hdmi-a3=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.08] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ab-hdmi-a7-dp4=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ac-dp3-hdmi-a3=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ac-hdmi-a7-dp4=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ad-dp3-hdmi-a3=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@ad-hdmi-a7-dp4=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@bc-dp3-hdmi-a3=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@bc-hdmi-a7-dp4=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@bd-dp3-hdmi-a3=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@bd-hdmi-a7-dp4=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@cd-dp3-hdmi-a3=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [1.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset@cd-hdmi-a7-dp4=
:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@a-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.07] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@b-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@c-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-rmfb@d-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@a-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@b-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@c-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@modeset-vs-vblank-race-interruptible@d-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.04] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@a-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@b-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.06] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@c-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check@d-hdmi-a7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.05] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.02] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-transparent-fb@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.86] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.78] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@accuracy-idle@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-a-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@query-idle-hang@pipe-d-hdmi-a-7:</p>
<ul>
<li>Statuses : 1 fail(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-139954v9_full that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@intel_hwmon@hwmon-write:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@intel_hwmon@hwmon-write.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1125">Intel XE#1125</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@intel_hwmon@hwmon-write.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1=
125">Intel XE#1125</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_addfb_basic@addfb25-y-t=
iled-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-3/igt@kms_addfb_basic@addfb25-y-til=
ed-small-legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1466">Intel XE#1466</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_async_flips@invalid-async=
-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@test-cursor:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-5/igt@kms_async_flips@test-cursor.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/664">Intel XE#664</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@atomic-plane-damage:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_atom=
ic@atomic-plane-damage.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_atomic@atomic-plan=
e-damage.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4245">Intel XE#4245</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@test-only:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@kms_atomic@test-only.html">IN=
COMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/4245">Intel XE#4245</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@kms_at=
omic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-=
dg2-432/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.ht=
ml">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2613">Intel XE#2613</a>) +1 other test incomplete</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_atom=
ic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bm=
g-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html">=
INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2613">Intel XE#2613</a>) +1 other test incomplete</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-2/igt@kms_ato=
mic_transition@modeset-transition-nonblocking-fencing.html">PASS</a> -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-a=
dlp-3/igt@kms_atomic_transition@modeset-transition-nonblocking-fencing.html=
">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2613">Intel XE#2613</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@modeset-transition-nonblocking-fencing@1x-outp=
uts:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_atom=
ic_transition@modeset-transition-nonblocking-fencing@1x-outputs.html">PASS<=
/a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954=
v9/shard-bmg-8/igt@kms_atomic_transition@modeset-transition-nonblocking-fen=
cing@1x-outputs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4258">Intel XE#4258</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition-fencing-internal-=
panels:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-lnl-6/igt@kms_atom=
ic_transition@plane-all-modeset-transition-fencing-internal-panels.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139=
954v9/shard-lnl-1/igt@kms_atomic_transition@plane-all-modeset-transition-fe=
ncing-internal-panels.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_atom=
ic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a> -&gt;=
 <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-=
bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.ht=
ml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3908">Intel XE#3908</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_atomic_transition@plane-a=
ll-transition-fencing@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/4215">Intel XE#4215</a>=
) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-fencing@pipe-a-hdmi-a-1:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@kms_atomic_transition@plane-=
all-transition-fencing@pipe-a-hdmi-a-1.html">FAIL</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +5 othe=
r tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-3/igt@kms_atom=
ic_transition@plane-all-transition-nonblocking.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/ig=
t@kms_atomic_transition@plane-all-transition-nonblocking.html">FAIL</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE=
#3908</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4215">Intel XE#4215</a>) +7 other tests fail</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_at=
omic_transition@plane-all-transition-nonblocking.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-46=
6/igt@kms_atomic_transition@plane-all-transition-nonblocking.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">Inte=
l XE#3908</a>) +7 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-transition-nonblocking-fencing:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@kms_atomic_transition@plane=
-all-transition-nonblocking-fencing.html">FAIL</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +5 other t=
ests fail</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_atomic_transition@plane-t=
oggle-modeset-transition.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3908">Intel XE#3908</a>) +1 other test fail</l=
i>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-use-after-nonblocking-unbind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-8/igt@kms_ato=
mic_transition@plane-use-after-nonblocking-unbind.html">PASS</a> -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-=
9/igt@kms_atomic_transition@plane-use-after-nonblocking-unbind.html">FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3908">In=
tel XE#3908</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@kms_big_=
fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bm=
g-5/igt@kms_big_fb@4-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/42=
60">Intel XE#4260</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-2/igt@kms_big_fb@linear-16bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@kms_big_fb@x-tiled-max-hw-str=
ide-32bpp-rotate-0-async-flip.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/4260">Intel XE#4260</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_big_fb@y-tiled-addfb-size=
-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1428">Intel XE#1428</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_big_fb@y-tiled-max-hw-str=
ide-64bpp-rotate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-r=
otate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1124">Intel XE#1124</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@kms_big_fb@yf-tiled-max-hw-s=
tride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +10 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@kms_big_fb@yf-tiled-max-hw-st=
ride-32bpp-rotate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_bw@c=
onnected-linear-tiling-1-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/ig=
t@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#36=
7</a>) +2 other tests skip</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-8/igt@kms_bw@=
connected-linear-tiling-1-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/i=
gt@kms_bw@connected-linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#3=
67</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_bw@c=
onnected-linear-tiling-2-displays-1920x1080p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_bw=
@connected-linear-tiling-2-displays-2160x1440p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/=
igt@kms_bw@connected-linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#=
367</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@kms_bw@connected-linear-tili=
ng-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</l=
i>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-1/igt@kms_bw@connected-linear-tilin=
g-3-displays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@kms_bw@linear-tiling-2-displ=
ays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/367">Intel XE#367</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_bw@linear-tiling-2-disp=
lays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@kms_bw@linear-tiling-2-displa=
ys-2560x1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-4-tiled-mtl-mc-ccs@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_ccs@bad-aux-stride-4-til=
ed-mtl-mc-ccs@pipe-d-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +43 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@kms_ccs@bad-pixel-format-4-t=
iled-dg2-rc-ccs-cc@pipe-a-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +71 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-5/igt@kms_ccs@bad-rotation-90-4-til=
ed-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2887">Intel XE#2887</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@kms_ccs@crc-primary-basic-4=
-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +173 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-yf-tiled-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_ccs@crc-primary-basic-y=
f-tiled-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +43 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-lnl-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-lnl-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_ccs@crc-primary-rotation-=
180-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +12 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_ccs@crc-primary-suspend-4=
-tiled-dg2-rc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3432">Intel XE#3432</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">PASS</a> -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-43=
6/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-a-dp-4.html">INCOMPLE=
TE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124=
">Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_cdclk@plane-scaling.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
724">Intel XE#2724</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_chamelium_color@ctm-0-50=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_chamelium_color@ctm-0-50.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2325">Intel XE#2325</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-75:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_chamelium_color@ctm-0-7=
5.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/306">Intel XE#306</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_chamelium_color@ctm-0-75.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_chamelium_hpd@vga-hpd-wit=
hout-ddc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@kms_content_protection@lic-=
type-0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2715">Intel XE#2715</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>) +1 other test incom=
plete</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_content_protection@lic-ty=
pe-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3278">Intel XE#3278</a>) +2 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_content_protection@lic-ty=
pe-0.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2715">Intel XE#2715</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@type1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_content_protection@type1.=
html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2715">Intel XE#2715</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4132">Intel XE#4132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-128x42:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_cursor_crc@cursor-offscr=
een-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>) +26 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@kms_cursor_crc@cursor-offscre=
en-128x42.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2320">Intel XE#2320</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_cursor_crc@cursor-offscr=
een-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@kms_cursor_crc@cursor-offsc=
reen-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-1/igt@kms_cursor_crc@cursor-offscre=
en-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_cursor_crc@cursor-offscre=
en-512x512.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2321">Intel XE#2321</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-64x64:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_cu=
rsor_crc@cursor-onscreen-64x64.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@kms_cursor_c=
rc@cursor-onscreen-64x64.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +25 other tests skip</l=
i>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-64x21:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-3/igt@kms_cursor_crc@cursor-rapid-m=
ovement-64x21.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1424">Intel XE#1424</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-64x64:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_cursor_crc@cursor-slidi=
ng-64x64.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/455">Intel XE#455</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-atomic:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_cursor_legacy@2x-flip-vs-=
cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2291">Intel XE#2291</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@kms_cu=
rsor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_cu=
rsor_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other te=
st skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-nonblocking-modeset-vs-cursor-atomic:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@kms_cursor_legacy@2x-nonblock=
ing-modeset-vs-cursor-atomic.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +3 other tests skip=
</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-varying-size:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_curs=
or_legacy@cursora-vs-flipb-varying-size.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_c=
ursor_legacy@cursora-vs-flipb-varying-size.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +1 =
other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_cursor_legacy@short-bus=
y-flip-before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323<=
/a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_cursor_legacy@short-busy-=
flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_cursor_legacy@short-busy=
-flip-before-cursor-toggle.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_disp=
lay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_display_mod=
es@extended-mode-basic.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1540">Intel XE#1540</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_dp_linktrain_fallback@dp=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4331">Intel XE#4331</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-1/igt@kms_dp_linktrain_fallback@dp-=
fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4294">Intel XE#4294</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-6/igt@kms_dsc@dsc-with-formats.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2244">Intel XE#2244</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_fbcon_fbt@psr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_fbcon_fbt@psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/776">I=
ntel XE#776</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-6/igt@kms_feature_discovery@displa=
y-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1138">Intel XE#1138</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@kms_feature_discovery@displ=
ay-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1138">Intel XE#1138</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_feature_discovery@display=
-4x.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-absolute-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_fl=
ip@2x-flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_flip@2=
x-flip-vs-absolute-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/3333">Intel XE#3333</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-3/igt@kms_flip@2x-flip-vs-absolute-=
wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1421">Intel XE#1421</a>) +6 other tests skip</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-3/igt@kms_flip=
@2x-flip-vs-absolute-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_flip@2x-fl=
ip-vs-absolute-wf_vblank.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/3333">Intel XE#3333</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-wf_vblank:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_fl=
ip@2x-flip-vs-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_flip@2x-flip-vs=
-wf_vblank.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/310">Intel XE#310</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_flip@2x-nonexisting-fb-i=
nterruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/310">Intel XE#310</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@kms_flip=
@2x-plain-flip-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_fli=
p@2x-plain-flip-ts-check-interruptible.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-lnl-3/igt@kms_flip=
@blocking-wf_vblank.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_flip@blocking-wf_vbla=
nk.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3149">Intel XE#3149</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@blocking-wf_vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-lnl-3/igt@kms_flip=
@blocking-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_flip@blocking-=
wf_vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/886">Intel XE#886</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@bo-too-big-interruptible@a-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@kms_flip@bo-too-big-interrupt=
ible@a-edp1.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1504">Intel XE#1504</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@a-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-lnl-3/igt@kms_flip=
@flip-vs-expired-vblank@a-edp1.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_flip@flip-=
vs-expired-vblank@a-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/301">Intel XE#301</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_fl=
ip@plain-flip-fb-recreate.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@kms_flip@plain-fl=
ip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_flip@plain-flip-ts-check=
.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/3149">Intel XE#3149</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@kms_flip@plain-flip-ts-chec=
k-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3149">Intel XE#3149</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-ts-check@b-edp1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_flip@plain-flip-ts-check@=
b-edp1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/886">Intel XE#886</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-9/igt@kms_fli=
p@wf_vblank-ts-check-interruptible.html">PASS</a> -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_flip@=
wf_vblank-ts-check-interruptible.html">FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) +2 other test=
s fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-downscaling.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1397</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe=
-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_flip_scaled_crc@flip-64bp=
p-xtile-to-32bpp-xtile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1397">Intel XE#1=
397</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE=
#1745</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscal=
ing@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-3/igt@kms_flip_scaled_crc@flip-64bp=
p-ytile-to-32bpp-ytilegen12rcccs-upscaling@pipe-a-default-mode.html">SKIP</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">In=
tel XE#1401</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@kms_force_connector_basic@pru=
ne-stale-modes.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/352">Intel XE#352</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-1/igt@kms_frontbuffer_tracking@drrs=
-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@kms_frontbuffer_tracking@drr=
s-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +16 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@kms_frontbuffer_tracking@drr=
s-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +43 other te=
sts skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@kms_frontbuffer_tracking@drrs=
-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +18 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@kms_frontbuffer_tracking@dr=
rs-indfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-render.html">PASS</a> -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shar=
d-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-cur-indfb-draw-rende=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/656">Intel XE#656</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_frontbuffer_tracking@fb=
c-2p-scndscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +1 other test ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-cur-indfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@kms_frontbuffer_tracking@fbcd=
rrs-2p-scndscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc=
drrs-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1151">Intel XE#1151</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@kms_frontbuffer_tracking@fb=
cpsr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +32 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_frontbuffer_tracking@fbc=
psr-rgb101010-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +22 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-=
2p-primscrn-indfb-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +23 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +43 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-6/igt@kms_hdr@brightness-with-hdr.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3374">Intel XE#3374</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-6/igt@kms_hdr@static-toggle.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/150=
3">Intel XE#1503</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_join=
er@basic-force-big-joiner.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_joiner@basic-fo=
rce-big-joiner.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3012">Intel XE#3012</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-ultra-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@kms_joiner@basic-ultra-joine=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2927">Intel XE#2927</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2927">Intel XE#2927</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_joiner@basic-ultra-join=
er.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2927">Intel XE#2927</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@kms_joiner@basic-ultra-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2927">Intel XE#2927</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_lease@setcrtc-implicit-plane:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@kms_leas=
e@setcrtc-implicit-plane.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@kms_lease@setcrtc-im=
plicit-plane.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4243">Intel XE#4243</a>) +8 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_panel_fitting@legacy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_panel_fitting@legacy.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2486">Intel XE#2486</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_stress@stress-xrgb8888-ytiled:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_pipe_stress@stress-xrgb=
8888-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4359">Intel XE#4359</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-3/igt@kms_pipe_stress@stress-xrgb88=
88-ytiled.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4329">Intel XE#4329</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_plan=
e@pixel-format.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_plane@pixel-format.html">I=
NCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/1035">Intel XE#1035</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@kms_pl=
ane@pixel-format.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@kms_plane@pixel-format.htm=
l">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/1035">Intel XE#1035</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@pixel-format-source-clamping:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_pl=
ane@pixel-format-source-clamping.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@kms_plane@=
pixel-format-source-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a=
>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_plan=
e@pixel-format-source-clamping.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_plane@pixe=
l-format-source-clamping.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/1035">Intel XE#1035</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2566">Intel XE#2566</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_plan=
e@plane-panning-bottom-right-suspend.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/3380">Intel XE#3380</a>) +1 other =
test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@coverage-7efc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@kms_plan=
e_alpha_blend@coverage-7efc.html">PASS</a> -&gt; <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_plane_alpha_b=
lend@coverage-7efc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3280">Intel XE#3280</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-none:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-3/igt@kms_pla=
ne_multiple@tiling-none.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@kms_plane_multiple@t=
iling-none.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/455">Intel XE#455</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2493">Intel XE#2493</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-3/igt@kms_plane_multiple@tiling-yf.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2493">Intel XE#2493</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_plane_scaling@2x-scaler-m=
ulti-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2571">Intel XE#2571</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-6/igt@kms_plane_scaling@2x-scaler-=
multi-pipe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/309">Intel XE#309</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-pixel-format@pipe=
-b:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@kms_plane_scaling@plane-dow=
nscale-factor-0-25-with-pixel-format@pipe-b.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +2=
9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-6/igt@kms_pla=
ne_scaling@plane-downscale-factor-0-5-with-modifiers@pipe-d.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/s=
hard-adlp-3/igt@kms_plane_scaling@plane-downscale-factor-0-5-with-modifiers=
@pipe-d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2763">Intel XE#2763</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-modifiers@pipe-b:=
</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@kms_plane_scaling@plane-down=
scale-factor-0-75-with-modifiers@pipe-b.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +23 ot=
her tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-75-with-rotation:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_plane_scaling@plane-downs=
cale-factor-0-75-with-rotation.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +34 other tests=
 skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_plane_scaling@planes-do=
wnscale-factor-0-25-unity-scaling.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) =
+19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-unity-scaling@pipe-c:=
</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_plane_scaling@planes-down=
scale-factor-0-25-unity-scaling@pipe-c.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +15 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@p=
ipe-b:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-4/igt@kms_pla=
ne_scaling@planes-downscale-factor-0-75-upscale-factor-0-25@pipe-b.html">PA=
SS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139=
954v9/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-75-upsca=
le-factor-0-25@pipe-b.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +49 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c:=
</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@kms_plan=
e_scaling@planes-unity-scaling-downscale-factor-0-75@pipe-c.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/s=
hard-bmg-1/igt@kms_plane_scaling@planes-unity-scaling-downscale-factor-0-75=
@pipe-c.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2763">Intel XE#2763</a>) +107 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a:<=
/p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_pl=
ane_scaling@planes-upscale-20x20-downscale-factor-0-5@pipe-a.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/=
shard-dg2-466/igt@kms_plane_scaling@planes-upscale-20x20-downscale-factor-0=
-5@pipe-a.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2763">Intel XE#2763</a>) +65 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_pl=
ane_scaling@planes-upscale-factor-0-25.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@kms_=
plane_scaling@planes-upscale-factor-0-25.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +43 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-upscale-factor-0-25-downscale-factor-0-75:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_plane_scaling@planes-ups=
cale-factor-0-25-downscale-factor-0-75.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2763">Intel XE#2763</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455<=
/a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_pm_backlight@fade.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/870=
">Intel XE#870</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@kms_pm_backlight@fade.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/87=
0">Intel XE#870</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@kms_pm_backlight@fade.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/8=
70">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_pm_d=
c@dc5-dpms-negative.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_pm_dc@dc5-dpms-negati=
ve.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4266">Intel XE#4266</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@kms_pm=
_dc@dc5-dpms-negative.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@kms_pm_dc@dc5-dpms-ne=
gative.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4266">Intel XE#4266</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@kms_pm_dc@dc6-psr.html">FAIL<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1430">I=
ntel XE#1430</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_pm_dc@dc6-psr.html">SKIP<=
/a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2392">I=
ntel XE#2392</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@kms_pm_dc@dc6-psr.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">=
Intel XE#1129</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_pm_dc@dc6-psr.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129"=
>Intel XE#1129</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@kms_pm_dc@dc9-dpms.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">=
Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_pm_rpm@dpms-mode-unset-no=
n-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/836">Intel XE#836</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_psr2_sf@fbc-psr2-plane-mo=
ve-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1489">Intel XE#1489</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@kms_psr2_sf@pr-overlay-plane=
-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +11 other tes=
ts skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_psr2_sf@pr-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +10 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@pr-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-6/igt@kms_psr2_sf@pr-overlay-primar=
y-update-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2893">Intel XE#2893</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@frontbuffer-xrgb8888:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-6/igt@kms_psr2_su@frontbuffer-xrgb8=
888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1128">Intel XE#1128</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-6/igt@kms_psr2_su@frontbuffer-xrgb=
8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1122">Intel XE#1122</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@kms_psr2_su@frontbuffer-xrg=
b8888.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-cursor-blt:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_psr@fbc-psr2-cursor-blt.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/2850">Intel XE#2850</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_psr@fbc-psr2-primary-re=
nder.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-page-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-1/igt@kms_psr@pr-primary-page-flip=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/929">Intel XE#929</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-sprite-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@kms_psr@pr-sprite-blt.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/140=
6">Intel XE#1406</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-rotation-270:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@kms_rotation_crc@primary-rot=
ation-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/3414">Intel XE#3414</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-1/igt@kms_rotation_crc@primary-rota=
tion-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3414">Intel XE#3414</a> / <a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3904">Intel XE#3904</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-180:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@kms_rotation_crc@primary-yf-t=
iled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_rotation_crc@sprite-rot=
ation-90-pos-100-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3414">Intel XE#3414</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_scaling_modes@scaling-mode-full:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_scaling_modes@scaling-mod=
e-full.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2413">Intel XE#2413</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@clone-exclusive-crtc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@kms_setmode@clone-exclusive-c=
rtc.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-lnl-4/igt@kms_vrr@=
flip-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-139954v9/shard-lnl-6/igt@kms_vrr@flip-basic.html">FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1522">Intel=
 XE#1522</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@lobf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-1/igt@kms_vrr@lobf.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel=
 XE#2168</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@kms_vrr@lobf.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Intel =
XE#2168</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@kms_vrr@lobf.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168">Inte=
l XE#2168</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-vrr:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_vrr@seamless-rr-switch-vr=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1499">Intel XE#1499</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@kms_vrr@seamless-rr-switch-vr=
r.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/1499">Intel XE#1499</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_writeback@writeback-fb-=
id.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/756">Intel XE#756</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@kms_writeback@writeback-fb-id=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/756">Intel XE#756</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@kms_writeback@writeback-fb-i=
d.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/756">Intel XE#756</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@kms_writeback@writeback-fb-id=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@sriov_basic@enable-vfs-bind-u=
nbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@large-ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@xe_ccs@large-ctrl-surf-copy.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3576">Intel XE#3576</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@xe_compute@ccs-mode-compute-=
kernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1447">Intel XE#1447</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@xe_compute@ccs-mode-compute-k=
ernel.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfd:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@xe_copy_basic@mem-copy-linea=
r-0xfd.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1123">Intel XE#1123</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@xe_copy_basic@mem-copy-line=
ar-0xfffe.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/1123">Intel XE#1123</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@xe_copy_basic@mem-set-linear=
-0x369.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1126">Intel XE#1126</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@xe_copy_basic@mem-set-linea=
r-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-metadata-discovery:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@xe_eudebug@basic-vm-bind-meta=
data-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/2905">Intel XE#2905</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-sigint-client:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-ufe=
nce-sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@xe_eudebug@basic-vm-bind-uf=
ence-sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-6/igt@xe_eudebug@basic-vm-bind-ufen=
ce-sigint-client.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3889">Intel XE#3889</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@discovery-empty-clients:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-4/igt@xe_eudebug@discovery-empty-cl=
ients.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@multigpu-basic-client-many:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@xe_eudebug@multigpu-basic-c=
lient-many.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2905">Intel XE#2905</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_online@single-step-one:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@xe_eudebug_online@single-ste=
p-one.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2905">Intel XE#2905</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@xe_evict@evict-small-externa=
l-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-1/igt@xe_evict@evict-small-external=
-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/688">Intel XE#688</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-standalone-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@xe_evict_ccs@evict-overcommi=
t-standalone-nofree-reopen.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr=
:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +4 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-1/igt@xe_exec_basic@multigpu-many-=
execqueues-many-vm-null-defer-bind.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +8 other te=
sts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-bind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@xe_exe=
c_basic@multigpu-once-null-defer-bind.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@xe_ex=
ec_basic@multigpu-once-null-defer-bind.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-1/igt@xe_exec_basic@multigpu-once-u=
serptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1392">Intel XE#1392</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@xe_exec_fault_mode@once-bin=
dexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/288">Intel XE#288</a>) +27 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-2/igt@xe_exec_fault_mode@once-bind=
execqueue-userptr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/288">Intel XE#288</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@inject-fault-probe-function-wait_for_lmem_ready:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-4/igt@xe_faul=
t_injection@inject-fault-probe-function-wait_for_lmem_ready.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/s=
hard-adlp-6/igt@xe_fault_injection@inject-fault-probe-function-wait_for_lme=
m_ready.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3970">Intel XE#3970</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) +1 other test dmes=
g-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-b=
mg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6=
/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b=
93c6/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd=
851b93c6/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e2=
2bbd851b93c6/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c4=
52e22bbd851b93c6/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93c=
e0c452e22bbd851b93c6/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789=
a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c8248=
0789a93ce0c452e22bbd851b93c6/shard-bmg-7/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c=
82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19e=
b43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-=
e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2=
692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-=
bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/sh=
ard-bmg-4/igt@xe_module_load@load.html">PASS</a>) -&gt; (<a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139954v9/shard-bmg-7/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-=
7/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v9/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139954v9/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-=
1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v9/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139954v9/shard-bmg-6/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-=
8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v9/shard-bmg-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139954v9/shard-bmg-5/igt@xe_module_load@load.html">SKIP</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-2/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v9/shard-bmg-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@xe_module=
_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/inte=
l-xe/xe-pw-139954v9/shard-bmg-5/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-=
5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@xe_module_load@load.html=
">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v9/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@xe_module=
_load@load.html">PASS</a>) (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2457">Intel XE#2457</a>)</li>
<li>shard-dg2-set2:     (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@xe_mo=
dule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-4=
34/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard=
-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6=
/shard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd85=
1b93c6/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e2=
2bbd851b93c6/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce=
0c452e22bbd851b93c6/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>, <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c8248078=
9a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c8=
2480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@xe_module_load@load.html"=
>PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19=
eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-26=
92-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@xe_module_loa=
d@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-d=
g2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/s=
hard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b=
93c6/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c452e22b=
bd851b93c6/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a93ce0c4=
52e22bbd851b93c6/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c82480789a9=
3ce0c452e22bbd851b93c6/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb43c8248=
0789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-e19eb4=
3c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-2692-=
e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@xe_module_load@l=
oad.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@xe_module_=
load@load.html">PASS</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@xe_module_load@load.html">PASS<=
/a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/sh=
ard-dg2-434/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@xe_module_lo=
ad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-pw-139954v9/shard-dg2-464/igt@xe_module_load@load.html">PASS</a>, <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-4=
64/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@xe_module_load@load.h=
tml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39954v9/shard-dg2-433/igt@xe_module_load@load.html">PASS</a>, <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/s=
hard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@xe_module_l=
oad@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-pw-139954v9/shard-dg2-436/igt@xe_module_load@load.html">PASS</a>, <a =
href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-=
436/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@xe_module_load@load.=
html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
139954v9/shard-dg2-432/igt@xe_module_load@load.html">PASS</a>, <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@xe_module_load@load.html">PAS=
S</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/=
shard-dg2-463/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-139954v9/shard-dg2-466/igt@xe_module_load@load.html">SKIP</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2=
-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-466/igt@xe_module_load@load=
.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw=
-139954v9/shard-dg2-466/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@=
xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@xe_module_load@load.html">PA=
SS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9=
/shard-dg2-435/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@xe_module_load@many-reload.h=
tml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/3970">Intel XE#3970</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload-no-display:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-4/igt@xe_modu=
le_load@reload-no-display.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@xe_module_load@rel=
oad-no-display.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/3970">Intel XE#3970</a>) +15 other tests dmesg-war=
n</li>
</ul>
</li>
<li>
<p>igt@xe_oa@non-zero-reason:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/igt@xe_oa@non-zero-reason.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/25=
41">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/3573">Intel XE#3573</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@xe_oa@non-zero-reason.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/3573">Intel XE#3573</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@xe_pat@pat-index-xe2.html">S=
KIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/977=
">Intel XE#977</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@xe_pat@pat-index-xe2.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/97=
7">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2427">=
Intel XE#2427</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-8/igt@xe_peer2peer@write.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061"=
>Intel XE#1061</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-1/igt@xe_peer2peer@write.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">=
Intel XE#1061</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@write@write-gpua-vram01-gpub-system-p2p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@xe_peer2peer@write@write-gp=
ua-vram01-gpub-system-p2p.html">FAIL</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/1173">Intel XE#1173</a>) +1 other test fail</=
li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-vram:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@xe_pm@d3cold-mmap-vram.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-2/igt@xe_pm@d3cold-mmap-vram.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/22=
84">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/366">Intel XE#366</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@xe_pm@d3cold-mmap-vram.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2=
284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@xe_pm@s3-basic.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/569=
">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@xe_pm@=
s3-basic-exec.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@xe_pm@s3-basic-exec.html">DME=
SG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/569">Intel XE#569</a>) +3 other tests dmesg-warn</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-3/igt@xe_pm@s3-basic-exec.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/584">=
Intel XE#584</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@xe_pm@s3=
-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/igt@xe_pm@s3-multiple-execs.html"=
>DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/569">Intel XE#569</a>) +3 other tests dmesg-warn</li>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-2/igt@xe_pm@s=
3-multiple-execs.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139954v9/shard-adlp-4/igt@xe_pm@s3-multiple-execs.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/569">Intel XE#569</a>) +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@xe_pm@s3-vm-bind-userptr.ht=
ml">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@xe_pm@s4-vm-bind-userptr.ht=
ml">ABORT</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4268">Intel XE#4268</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@xe_pm_=
residency@gt-c6-freeze.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@xe_pm_residency@gt-c=
6-freeze.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3088">Intel XE#3088</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-freeze@gt0:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@xe_pm_re=
sidency@gt-c6-freeze@gt0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@xe_pm_residency@gt-c=
6-freeze@gt0.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/3088">Intel XE#3088</a>) +2 other tests dmesg-warn</=
li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-mem-usage:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-3/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-434/igt@xe_query@multigpu-query-mem=
-usage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>) +1 other test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-8/igt@xe_query@multigpu-query-mem-u=
sage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@xe_query@multigpu-query-mem-=
usage.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_auto_provisioning@exclusive-ranges:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@xe_sriov_auto_provisioning@=
exclusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-7/igt@xe_sriov_auto_provisioning@ex=
clusive-ranges.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4130">Intel XE#4130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-139954v9/shard-lnl-5/igt@xe_sriov_flr@flr-vf1-clear.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-misaligned-binds-2147483648:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-4/igt@xe_vm@l=
arge-userptr-split-misaligned-binds-2147483648.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-3/i=
gt@xe_vm@large-userptr-split-misaligned-binds-2147483648.html">DMESG-WARN</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3868">In=
tel XE#3868</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@xe_wed=
ged@basic-wedged.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@xe_wedged@basic-wedged.htm=
l">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/3858">Intel XE#3858</a>)</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@xe_wedge=
d@basic-wedged.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-139954v9/shard-bmg-8/igt@xe_wedged@basic-wedged.html">D=
MESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/3858">Intel XE#3858</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-lnl-6/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events@pipe-a-edp-1-linear.html">FAIL</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911">Intel=
 XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-139954v9/shard-lnl-4/igt@kms_async_flips@async-flip-with-page-flip-event=
s@pipe-a-edp-1-linear.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-lnl-3/igt@kms_univ=
ersal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl=
-7/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-large-external:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@xe_evict=
@evict-beng-large-external.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/=
shard-bmg-2/igt@xe_evict@evict-beng-large-external.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@xe_exe=
c_threads@threads-userptr-rebind.html">DMESG-WARN</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg=
2-434/igt@xe_exec_threads@threads-userptr-rebind.html">PASS</a> +5 other te=
sts pass</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@xe_liv=
e_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/1999">Intel XE#1999</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard=
-dg2-432/igt@xe_live_ktest@xe_mocs@xe_live_mocs_kernel_kunit.html">PASS</a>=
 +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@xe_sysfs=
_preempt_timeout@preempt_timeout_us-timeout.html">DMESG-WARN</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v9/shard-bmg-6/igt@xe_sysfs_preempt_timeout@preempt_timeout_us-timeout.ht=
ml">PASS</a> +9 other tests pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@core_hotunplug@hotunbind-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-4/igt@core_ho=
tunplug@hotunbind-rebind.html">DMESG-WARN</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4173">Intel XE#4173</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-1/i=
gt@core_hotunplug@hotunbind-rebind.html">DMESG-WARN</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3970">Intel XE#3970</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic@plane-primary-overlay-mutable-zpos:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@kms_atom=
ic@plane-primary-overlay-mutable-zpos.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2385">Intel XE#2385</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg=
-7/igt@kms_atomic@plane-primary-overlay-mutable-zpos.html">INCOMPLETE</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4245">Intel =
XE#4245</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_bw=
@connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/=
shard-dg2-434/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-139954v9/shard-bmg-2/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:=
</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a=
> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Inte=
l XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-139954v9/shard-dg2-464/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl=
-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_cc=
s@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#4=
55</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787=
">Intel XE#787</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl=
-rc-ccs@pipe-d-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-436/igt@=
kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124">Intel XE#3124</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_co=
ntent_protection@atomic-dpms.html">DMESG-FAIL</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-43=
2/igt@kms_content_protection@atomic-dpms.html">INCOMPLETE</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> =
/ <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Inte=
l XE#4132</a>) +1 other test incomplete</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_cont=
ent_protection@atomic-dpms.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/ig=
t@kms_content_protection@atomic-dpms.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE=
#4132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_cont=
ent_protection@content-type-change.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/=
igt@kms_content_protection@content-type-change.html">INCOMPLETE</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#271=
5</a>) +3 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-6/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-5/igt@kms_conte=
nt_protection@legacy.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_co=
ntent_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-463/igt@kms_c=
ontent_protection@legacy.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_co=
ntent_protection@lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-433/igt@kms=
_content_protection@lic-type-1.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132=
</a>) +2 other tests incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_co=
ntent_protection@mei-interface.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-432/igt@=
kms_content_protection@mei-interface.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_cont=
ent_protection@srm.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-7/igt@kms_content_=
protection@srm.html">INCOMPLETE</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-463/igt@kms_co=
ntent_protection@uevent.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1188">Intel XE#1188</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-435/igt@kms_c=
ontent_protection@uevent.html">INCOMPLETE</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2715">Intel XE#2715</a> / <a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4132">Intel XE#4132</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-toggle:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_curs=
or_legacy@cursora-vs-flipb-toggle.html">DMESG-WARN</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-b=
mg-4/igt@kms_cursor_legacy@cursora-vs-flipb-toggle.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_cu=
rsor_legacy@cursorb-vs-flipb-atomic-transitions.html">DMESG-WARN</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#43=
30</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
9954v9/shard-dg2-464/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transiti=
ons.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-busy-flip:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-1/igt@kms_flip=
@2x-busy-flip.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"https://i=
ntel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-4/igt@kms_flip@2x=
-busy-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2316">Intel XE#2316</a>)</li>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_fl=
ip@2x-busy-flip.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-dg2-464/igt@kms_fli=
p@2x-busy-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-fb-recreate:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-lnl-8/igt@kms_flip=
@plain-flip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-lnl-6/igt@kms_flip@=
plain-flip-fb-recreate.html">FAIL</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/3149">Intel XE#3149</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@wf_vblank-ts-check-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_fl=
ip@wf_vblank-ts-check-interruptible.html">DMESG-WARN</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt=
; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard=
-dg2-464/igt@kms_flip@wf_vblank-ts-check-interruptible.html">FAIL</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3=
149</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-2/igt@kms_flip=
_tiling@flip-change-tiling.html">DMESG-WARN</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-6/ig=
t@kms_flip_tiling@flip-change-tiling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2682">Intel XE#2682</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@kms_fron=
tbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/sh=
ard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-pri-indfb-multidraw.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312=
">Intel XE#2312</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954=
v9/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-on=
off.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/651">Intel XE#651</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v9/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2311">Intel XE#2311</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-433/igt@kms_fr=
ontbuffer_tracking@drrs-2p-scndscrn-pri-shrfb-draw-render.html">SKIP</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE=
#651</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
139954v9/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-sh=
rfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/656">Intel XE#656</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-434/igt@kms_fr=
ontbuffer_tracking@fbc-2p-scndscrn-indfb-msflip-blt.html">DMESG-WARN</a> (<=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel X=
E#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-139954v9/shard-dg2-464/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-indfb=
-msflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-shrfb-msflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2312">Intel XE#2312</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-8/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#2=
313</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39954v9/shard-bmg-6/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2312">Intel XE#2312</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-464/igt@kms_fr=
ontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#=
656</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
39954v9/shard-dg2-436/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-i=
ndfb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/653">Intel XE#653</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_fr=
ontbuffer_tracking@psr-2p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1399=
54v9/shard-dg2-464/igt@kms_frontbuffer_tracking@psr-2p-primscrn-pri-shrfb-d=
raw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/656">Intel XE#656</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#23=
12</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-13=
9954v9/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-f=
ullscreen.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/2313">Intel XE#2313</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@brightness-with-hdr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-3/igt@kms_hdr@=
brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3374">Intel XE#3374</a> / <a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-1/i=
gt@kms_hdr@brightness-with-hdr.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/3544">Intel XE#3544</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-panning-bottom-right-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-436/igt@kms_pl=
ane@plane-panning-bottom-right-suspend.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a>) -=
&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/sh=
ard-dg2-464/igt@kms_plane@plane-panning-bottom-right-suspend.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel=
 XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-5-with-pixel-format:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@kms_plan=
e_scaling@plane-downscale-factor-0-5-with-pixel-format.html">DMESG-WARN</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4330">Inte=
l XE#4330</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-139954v9/shard-bmg-8/igt@kms_plane_scaling@plane-downscale-factor-0-5-=
with-pixel-format.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/2763">Intel XE#2763</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-dg2-435/igt@xe_pm@=
s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4330">Intel XE#4330</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-d=
g2-433/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +2 =
other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-bmg-5/igt@xe_pm@s3=
-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4330">Intel XE#4330</a> / <a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-bmg-8/=
igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +3 other test=
s dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6/shard-adlp-9/igt@xe_pm@s=
4-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139954v9/shard-adlp-9/igt@xe_pm@s4=
-vm-bind-unbind-all.html">ABORT</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4054">Intel XE#4054</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4268">Intel XE#4268</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8239 -&gt; IGT_8241</li>
<li>Linux: xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6 -&gt; xe-pw-139=
954v9</li>
</ul>
<p>IGT_8239: f058a041a6b7b7643246a92b7f1ff5d4e22a926f @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  IGT_8241: 983ffca5ff96fd67c937691337f4488e28948aa7 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-2692-e19eb43c82480789a93ce0c452e22bbd851b93c6: e19eb43c82480789a93ce0c=
452e22bbd851b93c6<br />
  xe-pw-139954v9: 139954v9</p>

</body>
</html>

--===============3921914496703804275==--
