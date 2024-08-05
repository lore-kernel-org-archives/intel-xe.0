Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD331C3DA4A
	for <intel-xe@archiver.kernel.org>; Mon,  5 Aug 2024 20:24:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73ECA10E2B3;
	Mon,  5 Aug 2024 20:24:29 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3211010E2B1;
 Mon,  5 Aug 2024 20:24:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4450341113875519861=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_Update_to_GuC_v70=2E29=2E2_as_m?=
 =?utf-8?q?inimum_for_Xe_=28support_LNL=2C_BMG=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "John Harrison" <john.c.harrison@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Aug 2024 20:24:28 -0000
Message-ID: <172288946818.541475.13705860366040569616@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
In-Reply-To: <20240802222129.3976212-1-John.C.Harrison@Intel.com>
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

--===============4450341113875519861==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Update to GuC v70.29.2 as minimum for Xe (support LNL, BMG) (rev2)
URL   : https://patchwork.freedesktop.org/series/136857/
State : failure

== Summary ==

CI Bug Log - changes from xe-1716-9e05740a01c348338498296b934a7652efff6aef_full -> xe-pw-136857v2_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136857v2_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136857v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136857v2_full:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-linear:
    - shard-adlp:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-linear.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-linear.html

  * igt@kms_flip@2x-wf_vblank-ts-check@bd-hdmi-a6-dp4:
    - shard-dg2-set2:     [PASS][3] -> [INCOMPLETE][4] +1 other test incomplete
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_flip@2x-wf_vblank-ts-check@bd-hdmi-a6-dp4.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_flip@2x-wf_vblank-ts-check@bd-hdmi-a6-dp4.html

  * igt@xe_intel_bb@blit-reloc:
    - shard-dg2-set2:     [PASS][5] -> [DMESG-WARN][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-435/igt@xe_intel_bb@blit-reloc.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@xe_intel_bb@blit-reloc.html

  * igt@xe_module_load@reload:
    - shard-adlp:         [PASS][7] -> [ABORT][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-4/igt@xe_module_load@reload.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@xe_module_load@reload.html

  
#### Warnings ####

  * igt@kms_fbcon_fbt@fbc-suspend:
    - shard-lnl:          [FAIL][9] ([Intel XE#2028]) -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - {shard-bmg}:        [FAIL][11] ([Intel XE#2436]) -> [INCOMPLETE][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - {shard-bmg}:        [FAIL][13] -> [INCOMPLETE][14] +1 other test incomplete
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-5/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@srm:
    - {shard-bmg}:        NOTRUN -> [FAIL][15] +1 other test fail
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-6/igt@kms_content_protection@srm.html

  * igt@kms_frontbuffer_tracking@fbc-tiling-4:
    - {shard-bmg}:        [FAIL][16] ([Intel XE#2333]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-dp-2:
    - {shard-bmg}:        [SKIP][18] ([Intel XE#498]) -> [INCOMPLETE][19] +1 other test incomplete
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-dp-2.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-dp-2.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - {shard-bmg}:        NOTRUN -> [SKIP][20] +1 other test skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue:
    - {shard-bmg}:        [PASS][21] -> [DMESG-WARN][22] +5 other tests dmesg-warn
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-6/igt@xe_exec_compute_mode@twice-bindexecqueue.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-6/igt@xe_exec_compute_mode@twice-bindexecqueue.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - {shard-bmg}:        [PASS][23] -> [TIMEOUT][24] +2 other tests timeout
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - {shard-bmg}:        [PASS][25] -> [INCOMPLETE][26] +3 other tests incomplete
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  
Known issues
------------

  Here are the changes found in xe-pw-136857v2_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@crc:
    - shard-dg2-set2:     [PASS][27] -> [INCOMPLETE][28] ([Intel XE#1195]) +1 other test incomplete
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-463/igt@kms_async_flips@crc.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-434/igt@kms_async_flips@crc.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [PASS][29] -> [FAIL][30] ([Intel XE#1426]) +1 other test fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#316])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#1407]) +1 other test skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-180:
    - shard-lnl:          [PASS][33] -> [FAIL][34] ([Intel XE#1659])
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@4-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#316])
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html

  * igt@kms_big_fb@linear-32bpp-rotate-270:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#316]) +4 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-270.html

  * igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:
    - shard-adlp:         [PASS][37] -> [SKIP][38] ([Intel XE#1201]) +3 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html

  * igt@kms_big_fb@x-tiled-64bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [FAIL][39] ([Intel XE#1874])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-64bpp-rotate-90:
    - shard-lnl:          NOTRUN -> [SKIP][40] ([Intel XE#1124])
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][41] -> [FAIL][42] ([Intel XE#1204]) +1 other test fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][43] ([Intel XE#1124] / [Intel XE#1201])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][44] -> [FAIL][45] ([Intel XE#1231]) +1 other test fail
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][46] -> [DMESG-FAIL][47] ([Intel XE#324])
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-16bpp-rotate-180:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-adlp:         NOTRUN -> [SKIP][49] ([Intel XE#1201] / [Intel XE#619])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][50] ([Intel XE#1124])
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#2191])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][53] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#1399]) +2 other tests skip
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#787]) +6 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html

  * igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#787]) +26 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-max:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#306])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-4/igt@kms_chamelium_color@ctm-max.html
    - shard-adlp:         NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#306])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_chamelium_color@ctm-max.html

  * igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:
    - shard-dg2-set2:     NOTRUN -> [SKIP][60] ([Intel XE#373])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-adlp:         NOTRUN -> [SKIP][61] ([Intel XE#1201] / [Intel XE#373]) +5 other tests skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-lnl:          NOTRUN -> [SKIP][62] ([Intel XE#373]) +1 other test skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#373])
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html

  * igt@kms_content_protection@atomic:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#455]) +14 other tests skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#307])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@srm@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [FAIL][66] ([Intel XE#1178]) +1 other test fail
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html

  * igt@kms_cursor_crc@cursor-random-128x42:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#1424])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-7/igt@kms_cursor_crc@cursor-random-128x42.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][68] ([Intel XE#1201] / [Intel XE#309]) +4 other tests skip
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][69] ([Intel XE#309])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-adlp:         NOTRUN -> [SKIP][70] ([Intel XE#1201] / [Intel XE#323])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-adlp:         NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#307]) +1 other test skip
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_dsc@dsc-with-bpc-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][72] ([Intel XE#1201] / [Intel XE#455])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html

  * igt@kms_flip@2x-flip-vs-modeset-vs-hang:
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#310]) +2 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html

  * igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:
    - shard-lnl:          NOTRUN -> [SKIP][74] ([Intel XE#1421])
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:
    - shard-lnl:          [PASS][75] -> [FAIL][76] ([Intel XE#886]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html

  * igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:
    - shard-dg2-set2:     [PASS][77] -> [INCOMPLETE][78] ([Intel XE#1195] / [Intel XE#2049])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     [PASS][79] -> [DMESG-WARN][80] ([Intel XE#1551]) +1 other test dmesg-warn
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1401]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][82] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html

  * igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:
    - shard-adlp:         [PASS][83] -> [FAIL][84] ([Intel XE#1874]) +4 other tests fail
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html

  * igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][85] ([Intel XE#651])
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#651]) +1 other test skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#1201] / [Intel XE#651]) +9 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#656]) +18 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [FAIL][89] ([Intel XE#1861])
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][90] ([Intel XE#1201] / [Intel XE#651]) +2 other tests skip
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#656]) +5 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-adlp:         NOTRUN -> [SKIP][92] ([Intel XE#1201] / [Intel XE#653]) +8 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#653])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#1201] / [Intel XE#653]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html

  * igt@kms_getfb@getfb2-accept-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#1339])
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_getfb@getfb2-accept-ccs.html
    - shard-lnl:          NOTRUN -> [SKIP][96] ([Intel XE#2340])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-3/igt@kms_getfb@getfb2-accept-ccs.html

  * igt@kms_hdmi_inject@inject-audio:
    - shard-adlp:         NOTRUN -> [SKIP][97] ([Intel XE#1201] / [Intel XE#417])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@kms_hdmi_inject@inject-audio.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][98] ([Intel XE#616])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [PASS][99] -> [DMESG-WARN][100] ([Intel XE#2019]) +1 other test dmesg-warn
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [PASS][101] -> [DMESG-WARN][102] ([Intel XE#324]) +3 other tests dmesg-warn
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-6/igt@kms_plane@plane-position-hole.html
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-edp-1:
    - shard-lnl:          [PASS][103] -> [DMESG-WARN][104] ([Intel XE#1705]) +1 other test dmesg-warn
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-3/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-edp-1.html
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-1/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-edp-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][105] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][106] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html

  * igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][107] ([Intel XE#498]) +1 other test skip
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:
    - shard-adlp:         [PASS][108] -> [SKIP][109] ([Intel XE#1201] / [Intel XE#455]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html

  * igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][110] ([Intel XE#1201]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr@fbc-pr-suspend:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#1406])
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-7/igt@kms_psr@fbc-pr-suspend.html

  * igt@kms_psr@fbc-psr2-basic:
    - shard-adlp:         NOTRUN -> [SKIP][112] ([Intel XE#1201] / [Intel XE#929]) +11 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_psr@fbc-psr2-basic.html

  * igt@kms_psr@fbc-psr2-no-drrs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#929])
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-463/igt@kms_psr@fbc-psr2-no-drrs.html

  * igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1127] / [Intel XE#1201])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-adlp:         [PASS][115] -> [DMESG-FAIL][116] ([Intel XE#1727])
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-adlp:         NOTRUN -> [SKIP][117] ([Intel XE#1201] / [Intel XE#330])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-adlp:         [PASS][118] -> [FAIL][119] ([Intel XE#771] / [Intel XE#899])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:
    - shard-adlp:         [PASS][120] -> [FAIL][121] ([Intel XE#899])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:
    - shard-lnl:          [PASS][122] -> [FAIL][123] ([Intel XE#2028]) +2 other tests fail
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html

  * igt@kms_vrr@flip-basic:
    - shard-lnl:          [PASS][124] -> [FAIL][125] ([Intel XE#2443]) +3 other tests fail
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-3/igt@kms_vrr@flip-basic.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-3/igt@kms_vrr@flip-basic.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#756])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@kms_writeback@writeback-pixel-formats.html
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1201] / [Intel XE#756])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][128] ([Intel XE#2226]) +1 other test dmesg-warn
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#1126] / [Intel XE#1201])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_create@create-big-vram:
    - shard-adlp:         NOTRUN -> [SKIP][130] ([Intel XE#1062] / [Intel XE#1201])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@xe_create@create-big-vram.html

  * igt@xe_evict@evict-beng-cm-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#1201] / [Intel XE#261]) +3 other tests skip
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@xe_evict@evict-beng-cm-threads-small.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][132] -> [TIMEOUT][133] ([Intel XE#1473])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-small-external-cm:
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688]) +2 other tests skip
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@xe_evict@evict-small-external-cm.html
    - shard-lnl:          NOTRUN -> [SKIP][135] ([Intel XE#688]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-4/igt@xe_evict@evict-small-external-cm.html

  * igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:
    - shard-adlp:         NOTRUN -> [SKIP][136] ([Intel XE#1201] / [Intel XE#688])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html

  * igt@xe_exec_basic@multigpu-no-exec-basic:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#1201] / [Intel XE#1392]) +5 other tests skip
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-basic.html

  * igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1392]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#1201] / [Intel XE#288]) +14 other tests skip
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#1201] / [Intel XE#288]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind.html

  * igt@xe_gt_freq@freq_reset_multiple:
    - shard-lnl:          [PASS][141] -> [DMESG-WARN][142] ([Intel XE#1620])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html

  * igt@xe_mmap@small-bar:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#1201] / [Intel XE#512])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@xe_mmap@small-bar.html

  * igt@xe_oa@buffer-fill:
    - shard-adlp:         NOTRUN -> [SKIP][144] ([Intel XE#1201] / [Intel XE#2419]) +1 other test skip
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@xe_oa@buffer-fill.html

  * igt@xe_oa@create-destroy-userspace-config:
    - shard-dg2-set2:     NOTRUN -> [SKIP][145] ([Intel XE#1201] / [Intel XE#2419])
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@xe_oa@create-destroy-userspace-config.html

  * igt@xe_oa@rc6-disable:
    - shard-dg2-set2:     NOTRUN -> [SKIP][146] ([Intel XE#2419])
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@xe_oa@rc6-disable.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-adlp:         NOTRUN -> [SKIP][147] ([Intel XE#1201] / [Intel XE#979])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_peer2peer@read:
    - shard-adlp:         NOTRUN -> [SKIP][148] ([Intel XE#1061] / [Intel XE#1201])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@xe_peer2peer@read.html

  * igt@xe_pm@s2idle-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][149] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@xe_pm@s2idle-d3cold-basic-exec.html

  * igt@xe_pm@s2idle-vm-bind-unbind-all:
    - shard-adlp:         [PASS][150] -> [DMESG-WARN][151] ([Intel XE#2226]) +4 other tests dmesg-warn
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-unbind-all.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-dg2-set2:     [PASS][152] -> [DMESG-WARN][153] ([Intel XE#1551] / [Intel XE#569])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@xe_pm@s3-multiple-execs.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pm@s3-vm-bind-unbind-all:
    - shard-dg2-set2:     [PASS][154] -> [DMESG-WARN][155] ([Intel XE#1162] / [Intel XE#1941])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [PASS][156] -> [ABORT][157] ([Intel XE#1794]) +1 other test abort
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_query@multigpu-query-engines:
    - shard-adlp:         NOTRUN -> [SKIP][158] ([Intel XE#1201] / [Intel XE#944]) +1 other test skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-topology:
    - shard-lnl:          NOTRUN -> [SKIP][159] ([Intel XE#944])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@xe_query@multigpu-query-topology.html

  
#### Possible fixes ####

  * igt@kms_atomic_transition@plane-all-modeset-transition:
    - {shard-bmg}:        [FAIL][160] ([Intel XE#1426]) -> [PASS][161]
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition.html
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:
    - {shard-bmg}:        [FAIL][162] -> [PASS][163]
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html

  * igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][164] ([Intel XE#1426]) -> [PASS][165] +3 other tests pass
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition:
    - shard-adlp:         [FAIL][166] ([Intel XE#1426]) -> [PASS][167] +1 other test pass
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][168] ([Intel XE#1659]) -> [PASS][169]
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][170] ([Intel XE#1231]) -> [PASS][171] +1 other test pass
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:
    - shard-adlp:         [DMESG-WARN][172] -> [PASS][173] +2 other tests pass
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:
    - {shard-bmg}:        [DMESG-WARN][174] -> [PASS][175] +7 other tests pass
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-panning:
    - {shard-bmg}:        [DMESG-WARN][176] ([Intel XE#877]) -> [PASS][177]
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [DMESG-FAIL][178] ([Intel XE#324]) -> [PASS][179] +1 other test pass
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:
    - shard-adlp:         [FAIL][180] ([Intel XE#1861]) -> [PASS][181]
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html

  * igt@kms_hdr@bpc-switch-suspend:
    - shard-lnl:          [FAIL][182] ([Intel XE#2028]) -> [PASS][183] +3 other tests pass
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-1/igt@kms_hdr@bpc-switch-suspend.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@kms_hdr@bpc-switch-suspend.html

  * igt@kms_hdr@invalid-hdr:
    - {shard-bmg}:        [SKIP][184] ([Intel XE#1503]) -> [PASS][185]
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-6/igt@kms_hdr@invalid-hdr.html
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-5/igt@kms_hdr@invalid-hdr.html

  * igt@kms_plane@plane-position-covered:
    - shard-lnl:          [DMESG-FAIL][186] ([Intel XE#324]) -> [PASS][187] +1 other test pass
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-2/igt@kms_plane@plane-position-covered.html
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-8/igt@kms_plane@plane-position-covered.html

  * igt@kms_plane@plane-position-covered@pipe-b-plane-2:
    - shard-lnl:          [DMESG-WARN][188] ([Intel XE#324]) -> [PASS][189]
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html

  * igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:
    - shard-adlp:         [FAIL][190] ([Intel XE#1874]) -> [PASS][191] +9 other tests pass
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html

  * igt@kms_pm_backlight@fade-with-dpms:
    - shard-lnl:          [SKIP][192] ([Intel XE#870]) -> [PASS][193] +1 other test pass
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-3/igt@kms_pm_backlight@fade-with-dpms.html
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@kms_pm_backlight@fade-with-dpms.html

  * igt@kms_pm_backlight@fade-with-suspend:
    - shard-lnl:          [INCOMPLETE][194] -> [PASS][195]
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-4/igt@kms_pm_backlight@fade-with-suspend.html

  * igt@kms_pm_dc@dc5-dpms-negative:
    - shard-adlp:         [SKIP][196] ([Intel XE#1131] / [Intel XE#1201]) -> [PASS][197]
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@kms_pm_dc@dc5-dpms-negative.html
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_pm_dc@dc5-dpms-negative.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][198] ([Intel XE#718]) -> [PASS][199]
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_properties@plane-properties-legacy:
    - shard-adlp:         [INCOMPLETE][200] ([Intel XE#1195]) -> [PASS][201]
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@kms_properties@plane-properties-legacy.html
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@kms_properties@plane-properties-legacy.html

  * igt@kms_universal_plane@cursor-fb-leak:
    - shard-lnl:          [FAIL][202] ([Intel XE#899]) -> [PASS][203] +1 other test pass
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2:
    - {shard-bmg}:        [FAIL][204] ([Intel XE#899]) -> [PASS][205]
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html

  * igt@xe_evict@evict-beng-mixed-threads-large:
    - {shard-bmg}:        [TIMEOUT][206] -> [PASS][207] +1 other test pass
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-1/igt@xe_evict@evict-beng-mixed-threads-large.html

  * igt@xe_evict@evict-beng-threads-large:
    - shard-dg2-set2:     [TIMEOUT][208] ([Intel XE#1473]) -> [PASS][209]
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html

  * igt@xe_evict@evict-cm-threads-large:
    - shard-dg2-set2:     [TIMEOUT][210] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][211] +1 other test pass
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html

  * igt@xe_exec_threads@threads-bal-userptr-invalidate:
    - {shard-bmg}:        [INCOMPLETE][212] -> [PASS][213]
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-4/igt@xe_exec_threads@threads-bal-userptr-invalidate.html
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-3/igt@xe_exec_threads@threads-bal-userptr-invalidate.html

  * igt@xe_exec_threads@threads-cm-fd-userptr-rebind:
    - shard-adlp:         [DMESG-WARN][214] ([Intel XE#2226]) -> [PASS][215] +1 other test pass
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [TIMEOUT][216] ([Intel XE#1353] / [Intel XE#1961] / [Intel XE#2026]) -> [PASS][217]
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-8/igt@xe_module_load@many-reload.html
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s3-vm-bind-prefetch:
    - shard-dg2-set2:     [DMESG-WARN][218] ([Intel XE#569]) -> [PASS][219]
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html

  * igt@xe_pm@s4-basic-exec:
    - shard-adlp:         [ABORT][220] ([Intel XE#1358] / [Intel XE#1794]) -> [PASS][221]
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-9/igt@xe_pm@s4-basic-exec.html
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@xe_pm@s4-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-lnl:          [ABORT][222] ([Intel XE#1794]) -> [PASS][223]
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-adlp:         [ABORT][224] ([Intel XE#1794]) -> [PASS][225]
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][226] ([Intel XE#958]) -> [PASS][227]
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_vm@large-userptr-split-binds-2147483648:
    - shard-adlp:         [DMESG-WARN][228] ([Intel XE#1727] / [Intel XE#2226]) -> [PASS][229]
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@xe_vm@large-userptr-split-binds-2147483648.html
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@xe_vm@large-userptr-split-binds-2147483648.html

  
#### Warnings ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:
    - shard-dg2-set2:     [SKIP][230] ([Intel XE#1201] / [Intel XE#801]) -> [SKIP][231] ([Intel XE#801]) +23 other tests skip
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:
    - shard-adlp:         [DMESG-WARN][232] ([Intel XE#1033]) -> [DMESG-WARN][233] ([Intel XE#324])
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html

  * igt@kms_big_fb@4-tiled-64bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][234] ([Intel XE#316]) -> [SKIP][235] ([Intel XE#1201] / [Intel XE#316]) +3 other tests skip
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][236] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][237] ([Intel XE#316]) +2 other tests skip
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [FAIL][238] ([Intel XE#1231]) -> [DMESG-FAIL][239] ([Intel XE#324])
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@yf-tiled-32bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][240] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][241] ([Intel XE#1124]) +5 other tests skip
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][242] ([Intel XE#1124]) -> [SKIP][243] ([Intel XE#1124] / [Intel XE#1201]) +5 other tests skip
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     [SKIP][244] ([Intel XE#1201] / [Intel XE#607]) -> [SKIP][245] ([Intel XE#607])
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html

  * igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][246] ([Intel XE#367]) -> [SKIP][247] ([Intel XE#1201] / [Intel XE#367]) +1 other test skip
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html

  * igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][248] ([Intel XE#1201] / [Intel XE#2191]) -> [SKIP][249] ([Intel XE#2191]) +1 other test skip
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-2-displays-2560x1440p:
    - shard-dg2-set2:     [SKIP][250] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][251] ([Intel XE#367]) +1 other test skip
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][252] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][253] ([Intel XE#455] / [Intel XE#787]) +17 other tests skip
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     [SKIP][254] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][255] ([Intel XE#787]) +62 other tests skip
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:
    - shard-adlp:         [SKIP][256] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][257] ([Intel XE#1201])
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [SKIP][258] ([Intel XE#787]) -> [SKIP][259] ([Intel XE#1201] / [Intel XE#787]) +55 other tests skip
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][260] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][261] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +15 other tests skip
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][262] ([Intel XE#1201] / [Intel XE#314]) -> [SKIP][263] ([Intel XE#314]) +3 other tests skip
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_chamelium_color@ctm-0-50:
    - shard-dg2-set2:     [SKIP][264] ([Intel XE#306]) -> [SKIP][265] ([Intel XE#1201] / [Intel XE#306])
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html

  * igt@kms_chamelium_color@ctm-green-to-red:
    - shard-dg2-set2:     [SKIP][266] ([Intel XE#1201] / [Intel XE#306]) -> [SKIP][267] ([Intel XE#306])
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@kms_chamelium_color@ctm-green-to-red.html
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html

  * igt@kms_chamelium_hpd@dp-hpd-fast:
    - shard-dg2-set2:     [SKIP][268] ([Intel XE#373]) -> [SKIP][269] ([Intel XE#1201] / [Intel XE#373]) +7 other tests skip
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-fast.html
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-fast.html

  * igt@kms_chamelium_hpd@vga-hpd-without-ddc:
    - shard-dg2-set2:     [SKIP][270] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][271] ([Intel XE#373]) +6 other tests skip
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html

  * igt@kms_cursor_crc@cursor-offscreen-512x512:
    - shard-dg2-set2:     [SKIP][272] ([Intel XE#308]) -> [SKIP][273] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html

  * igt@kms_display_modes@mst-extended-mode-negative:
    - shard-dg2-set2:     [SKIP][274] ([Intel XE#1201] / [Intel XE#307]) -> [SKIP][275] ([Intel XE#307])
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-435/igt@kms_display_modes@mst-extended-mode-negative.html
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     [SKIP][276] ([Intel XE#1201] / [Intel XE#701]) -> [SKIP][277] ([Intel XE#701])
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-463/igt@kms_feature_discovery@chamelium.html
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-4x:
    - shard-dg2-set2:     [SKIP][278] ([Intel XE#1138] / [Intel XE#1201]) -> [SKIP][279] ([Intel XE#1138])
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_feature_discovery@display-4x.html
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_feature_discovery@display-4x.html

  * igt@kms_feature_discovery@dp-mst:
    - shard-dg2-set2:     [SKIP][280] ([Intel XE#1137] / [Intel XE#1201]) -> [SKIP][281] ([Intel XE#1137])
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [DMESG-WARN][282] ([Intel XE#1551]) -> [INCOMPLETE][283] ([Intel XE#1195] / [Intel XE#1551] / [Intel XE#2049])
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][284] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][285] ([Intel XE#455]) +15 other tests skip
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:
    - shard-dg2-set2:     [SKIP][286] ([Intel XE#455]) -> [SKIP][287] ([Intel XE#1201] / [Intel XE#455]) +18 other tests skip
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html

  * igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         [SKIP][288] ([Intel XE#1201]) -> [SKIP][289] ([Intel XE#1201] / [Intel XE#651])
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-adlp:         [SKIP][290] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][291] ([Intel XE#1201])
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     [SKIP][292] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][293] ([Intel XE#651]) +25 other tests skip
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:
    - shard-adlp:         [FAIL][294] ([Intel XE#1861]) -> [SKIP][295] ([Intel XE#1201])
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][296] ([Intel XE#651]) -> [SKIP][297] ([Intel XE#1201] / [Intel XE#651]) +17 other tests skip
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-suspend:
    - shard-adlp:         [SKIP][298] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][299] ([Intel XE#1201]) +1 other test skip
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:
    - shard-adlp:         [SKIP][300] ([Intel XE#1201]) -> [SKIP][301] ([Intel XE#1201] / [Intel XE#656])
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:
    - shard-dg2-set2:     [SKIP][302] ([Intel XE#653]) -> [SKIP][303] ([Intel XE#1201] / [Intel XE#653]) +15 other tests skip
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:
    - shard-dg2-set2:     [SKIP][304] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][305] ([Intel XE#653]) +23 other tests skip
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
    - shard-adlp:         [SKIP][306] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][307] ([Intel XE#1201])
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html

  * igt@kms_plane_scaling@2x-scaler-multi-pipe:
    - shard-adlp:         [SKIP][308] ([Intel XE#1201] / [Intel XE#309]) -> [SKIP][309] ([Intel XE#1201])
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-adlp:         [SKIP][310] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][311] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498])
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     [SKIP][312] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) -> [SKIP][313] ([Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][314] ([Intel XE#1201] / [Intel XE#2318]) -> [SKIP][315] ([Intel XE#2318]) +2 other tests skip
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html

  * igt@kms_pm_backlight@fade:
    - shard-dg2-set2:     [SKIP][316] ([Intel XE#1201] / [Intel XE#870]) -> [SKIP][317] ([Intel XE#870])
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@kms_pm_backlight@fade.html
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_pm_backlight@fade.html

  * igt@kms_pm_dc@dc3co-vpb-simulation:
    - shard-lnl:          [SKIP][318] ([Intel XE#736]) -> [SKIP][319] ([Intel XE#1909])
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html

  * igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][320] ([Intel XE#1489]) -> [SKIP][321] ([Intel XE#1201] / [Intel XE#1489])
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:
    - shard-dg2-set2:     [SKIP][322] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][323] ([Intel XE#1489]) +1 other test skip
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-dg2-set2:     [SKIP][324] ([Intel XE#1122] / [Intel XE#1201]) -> [SKIP][325] ([Intel XE#1122])
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr-sprite-plane-onoff:
    - shard-dg2-set2:     [SKIP][326] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][327] ([Intel XE#929]) +9 other tests skip
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][328] ([Intel XE#929]) -> [SKIP][329] ([Intel XE#1201] / [Intel XE#929]) +9 other tests skip
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_psr@psr2-basic.html
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_psr@psr2-basic.html

  * igt@kms_rotation_crc@bad-pixel-format:
    - shard-dg2-set2:     [SKIP][330] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][331] ([Intel XE#327]) +1 other test skip
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-format.html
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][332] ([Intel XE#1127]) -> [SKIP][333] ([Intel XE#1127] / [Intel XE#1201])
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     [SKIP][334] ([Intel XE#1127] / [Intel XE#1201]) -> [SKIP][335] ([Intel XE#1127]) +1 other test skip
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-dg2-set2:     [SKIP][336] ([Intel XE#327]) -> [SKIP][337] ([Intel XE#1201] / [Intel XE#327]) +1 other test skip
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_tiled_display@basic-test-pattern-with-chamelium:
    - shard-dg2-set2:     [SKIP][338] ([Intel XE#1500]) -> [SKIP][339] ([Intel XE#1201] / [Intel XE#1500])
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html

  * igt@kms_vblank@ts-continuation-suspend:
    - shard-dg2-set2:     [DMESG-WARN][340] ([Intel XE#2019] / [Intel XE#2226]) -> [DMESG-WARN][341] ([Intel XE#2019]) +1 other test dmesg-warn
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     [SKIP][342] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][343] ([Intel XE#756]) +1 other test skip
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-dg2-set2:     [SKIP][344] ([Intel XE#1091] / [Intel XE#1201]) -> [SKIP][345] ([Intel XE#1091])
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:
    - shard-dg2-set2:     [SKIP][346] ([Intel XE#1201] / [Intel XE#1280] / [Intel XE#455]) -> [SKIP][347] ([Intel XE#1280] / [Intel XE#455]) +1 other test skip
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-dg2-set2:     [SKIP][348] ([Intel XE#1123]) -> [SKIP][349] ([Intel XE#1123] / [Intel XE#1201])
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][350] ([Intel XE#1473] / [Intel XE#392]) -> [INCOMPLETE][351] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#392])
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-race:
    - shard-dg2-set2:     [SKIP][352] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][353] ([Intel XE#288]) +20 other tests skip
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-userptr-rebind-imm:
    - shard-dg2-set2:     [SKIP][354] ([Intel XE#288]) -> [SKIP][355] ([Intel XE#1201] / [Intel XE#288]) +15 other tests skip
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html

  * igt@xe_oa@missing-sample-flags:
    - shard-dg2-set2:     [SKIP][356] ([Intel XE#1201] / [Intel XE#2419]) -> [SKIP][357] ([Intel XE#2419]) +4 other tests skip
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@xe_oa@missing-sample-flags.html
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@xe_oa@missing-sample-flags.html

  * igt@xe_oa@whitelisted-registers-userspace-config:
    - shard-dg2-set2:     [SKIP][358] ([Intel XE#2419]) -> [SKIP][359] ([Intel XE#1201] / [Intel XE#2419]) +4 other tests skip
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@xe_oa@whitelisted-registers-userspace-config.html

  * igt@xe_pm@d3cold-mmap-system:
    - shard-dg2-set2:     [SKIP][360] ([Intel XE#2284] / [Intel XE#366]) -> [SKIP][361] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366])
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html

  * igt@xe_pm@s4-d3cold-basic-exec:
    - shard-dg2-set2:     [SKIP][362] ([Intel XE#1201] / [Intel XE#2284] / [Intel XE#366]) -> [SKIP][363] ([Intel XE#2284] / [Intel XE#366])
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@xe_pm@s4-d3cold-basic-exec.html
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html

  * igt@xe_pm@vram-d3cold-threshold:
    - shard-dg2-set2:     [SKIP][364] ([Intel XE#1201] / [Intel XE#579]) -> [SKIP][365] ([Intel XE#579])
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html

  * igt@xe_query@multigpu-query-cs-cycles:
    - shard-dg2-set2:     [SKIP][366] ([Intel XE#944]) -> [SKIP][367] ([Intel XE#1201] / [Intel XE#944])
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@xe_query@multigpu-query-cs-cycles.html

  * igt@xe_query@multigpu-query-topology:
    - shard-dg2-set2:     [SKIP][368] ([Intel XE#1201] / [Intel XE#944]) -> [SKIP][369] ([Intel XE#944])
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-463/igt@xe_query@multigpu-query-topology.html
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@xe_query@multigpu-query-topology.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1061]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061
  [Intel XE#1062]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1131]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131
  [Intel XE#1137]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137
  [Intel XE#1138]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280
  [Intel XE#1339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339
  [Intel XE#1353]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1500]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500
  [Intel XE#1503]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1620]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1705]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1909]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909
  [Intel XE#1941]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941
  [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2028]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
  [Intel XE#2244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2244
  [Intel XE#2251]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2251
  [Intel XE#2252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2252
  [Intel XE#2284]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284
  [Intel XE#2311]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311
  [Intel XE#2313]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2320]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2320
  [Intel XE#2322]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2322
  [Intel XE#2325]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2325
  [Intel XE#2327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2327
  [Intel XE#2333]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333
  [Intel XE#2340]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340
  [Intel XE#2382]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2382
  [Intel XE#2419]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419
  [Intel XE#2426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2426
  [Intel XE#2436]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436
  [Intel XE#2443]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#314]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/314
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#324]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/324
  [Intel XE#327]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/327
  [Intel XE#330]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/330
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/417
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#579]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/579
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#736]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/736
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#771]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/771
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#801]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/801
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#877]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/877
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_7956 -> IGT_7957
  * Linux: xe-1716-9e05740a01c348338498296b934a7652efff6aef -> xe-pw-136857v2

  IGT_7956: dc7e77d1a8643f50832c38b4c8f8ddb598c0cf48 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7957: cb9121cf18a2fa8dfa1f663484f3a460b95e1b41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1716-9e05740a01c348338498296b934a7652efff6aef: 9e05740a01c348338498296b934a7652efff6aef
  xe-pw-136857v2: 136857v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/index.html

--===============4450341113875519861==
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
<tr><td><b>Series:</b></td><td>Update to GuC v70.29.2 as minimum for Xe (support LNL, BMG) (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136857/">https://patchwork.freedesktop.org/series/136857/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1716-9e05740a01c348338498296b934a7652efff6aef_full -&gt; xe-pw-136857v2_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136857v2_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136857v2_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136857v2_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-linear:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-linear.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-linear.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-wf_vblank-ts-check@bd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_flip@2x-wf_vblank-ts-check@bd-hdmi-a6-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_flip@2x-wf_vblank-ts-check@bd-hdmi-a6-dp4.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@blit-reloc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-435/igt@xe_intel_bb@blit-reloc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@xe_intel_bb@blit-reloc.html">DMESG-WARN</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-4/igt@xe_module_load@reload.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@xe_module_load@reload.html">ABORT</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_fbcon_fbt@fbc-suspend:<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-1/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-5/igt@kms_fbcon_fbt@fbc-suspend.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-2/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2436">Intel XE#2436</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-8/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-7/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-5/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-6/igt@kms_content_protection@srm.html">FAIL</a> +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-tiling-4:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2333">Intel XE#2333</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-7/igt@kms_frontbuffer_tracking@fbc-tiling-4.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-dp-2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-7/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-rotation@pipe-a-dp-2.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>{shard-bmg}:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-1/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-6/igt@xe_exec_compute_mode@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-6/igt@xe_exec_compute_mode@twice-bindexecqueue.html">DMESG-WARN</a> +5 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-7/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-1/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-3/igt@xe_pm@s2idle-vm-bind-unbind-all.html">INCOMPLETE</a> +3 other tests incomplete</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136857v2_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@crc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-463/igt@kms_async_flips@crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-434/igt@kms_async_flips@crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-8/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-3/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407">Intel XE#1407</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-7/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@kms_big_fb@4-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_big_fb@4-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-32bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_big_fb@linear-32bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-8/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_big_fb@linear-max-hw-stride-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@kms_big_fb@x-tiled-64bpp-rotate-180.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-8/igt@kms_big_fb@y-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-463/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@kms_big_fb@yf-tiled-16bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_big_fb@yf-tiled-addfb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@kms_bw@connected-linear-tiling-1-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-8/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_ccs@bad-rotation-90-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_ccs@crc-sprite-planes-basic-y-tiled-gen12-rc-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +26 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-max:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-4/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_chamelium_color@ctm-max.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_chamelium_edid@dp-edid-stress-resolution-non-4k.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-7/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-466/igt@kms_chamelium_hpd@hdmi-hpd-enable-disable-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_content_protection@atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-7/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@srm@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_content_protection@srm@pipe-a-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-128x42:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-7/igt@kms_cursor_crc@cursor-random-128x42.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-2/igt@kms_cursor_legacy@cursorb-vs-flipa-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-with-bpc-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-466/igt@kms_dsc@dsc-with-bpc-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-modeset-vs-hang:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_flip@2x-flip-vs-modeset-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-8/igt@kms_flip@2x-single-buffer-flip-vs-dpms-off-vs-modeset-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-5/igt@kms_flip@flip-vs-blocking-wf-vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible@d-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible@d-dp4.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-434/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilercccs-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-6/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@kms_flip_tiling@flip-change-tiling@pipe-d-hdmi-a-1-y-to-y.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +4 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-1p-offscren-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-spr-indfb-fullscreen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-mmap-wc.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-8/igt@kms_frontbuffer_tracking@fbcdrrs-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-cur-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_frontbuffer_tracking@psr-1p-primscrn-spr-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb2-accept-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1339">Intel XE#1339</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-3/igt@kms_getfb@getfb2-accept-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2340">Intel XE#2340</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdmi_inject@inject-audio:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@kms_hdmi_inject@inject-audio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/417">Intel XE#417</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-d-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-6/igt@kms_plane@plane-position-hole.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@kms_plane@plane-position-hole.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +3 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-3/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-1/igt@kms_plane_alpha_blend@alpha-7efc@pipe-a-edp-1.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1705">Intel XE#1705</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-d-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-3/igt@kms_plane_scaling@plane-scaler-with-clipping-clamping-pixel-formats@pipe-a-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-6/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_plane_scaling@planes-downscale-factor-0-75-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@kms_psr2_sf@fbc-overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-suspend:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-7/igt@kms_psr@fbc-pr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_psr@fbc-psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-no-drrs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-463/igt@kms_psr@fbc-psr2-no-drrs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-4-tiled-reflect-x-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@kms_rotation_crc@primary-4-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/771">Intel XE#771</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-2/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_universal_plane@cursor-fb-leak@pipe-a-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-7/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-1/igt@kms_vblank@ts-continuation-dpms-suspend@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@flip-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-3/igt@kms_vrr@flip-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-3/igt@kms_vrr@flip-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2443">Intel XE#2443</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@sriov_basic@enable-vfs-autoprobe-off@numvfs-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-466/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_create@create-big-vram:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@xe_create@create-big-vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1062">Intel XE#1062</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-cm-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@xe_evict@evict-beng-cm-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-4/igt@xe_evict@evict-small-external-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@xe_evict_ccs@evict-overcommit-parallel-nofree-reopen.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@xe_exec_basic@multigpu-no-exec-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-3/igt@xe_exec_basic@multigpu-no-exec-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-invalidate-race-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_reset_multiple:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-6/igt@xe_gt_freq@freq_reset_multiple.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-7/igt@xe_gt_freq@freq_reset_multiple.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1620">Intel XE#1620</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@buffer-fill:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@xe_oa@buffer-fill.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@create-destroy-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@xe_oa@create-destroy-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@rc6-disable:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@xe_oa@rc6-disable.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_peer2peer@read:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@xe_peer2peer@read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1061">Intel XE#1061</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@xe_pm@s2idle-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-vm-bind-unbind-all:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-2/igt@xe_pm@s2idle-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@xe_pm@s2idle-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +4 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@xe_pm@s3-multiple-execs.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-466/igt@xe_pm@s3-multiple-execs.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-unbind-all:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-435/igt@xe_pm@s3-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-436/igt@xe_pm@s3-vm-bind-unbind-all.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1941">Intel XE#1941</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-4/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) +1 other test abort</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-5/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-2/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_atomic_transition@plane-all-modeset-transition@pipe-a-hdmi-a-6.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@kms_atomic_transition@plane-toggle-modeset-transition.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-1/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-8/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-9/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_cursor_crc@cursor-onscreen-128x42@pipe-a-hdmi-a-1.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-3/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-1/igt@kms_cursor_legacy@cursorb-vs-flipa-atomic-transitions-varying-size.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-2/igt@kms_flip@2x-flip-vs-panning.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/877">Intel XE#877</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-1/igt@kms_flip@2x-flip-vs-panning.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling@pipe-a-valid-mode.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-msflip-blt.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_hdr@bpc-switch-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-1/igt@kms_hdr@bpc-switch-suspend.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2028">Intel XE#2028</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@kms_hdr@bpc-switch-suspend.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@invalid-hdr:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-6/igt@kms_hdr@invalid-hdr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1503">Intel XE#1503</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-5/igt@kms_hdr@invalid-hdr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-2/igt@kms_plane@plane-position-covered.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-8/igt@kms_plane@plane-position-covered.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-covered@pipe-b-plane-2:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-2/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-8/igt@kms_plane@plane-position-covered@pipe-b-plane-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-6/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@kms_plane_lowres@tiling-y@pipe-d-hdmi-a-1.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-dpms:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-3/igt@kms_pm_backlight@fade-with-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-6/igt@kms_pm_backlight@fade-with-dpms.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade-with-suspend:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-1/igt@kms_pm_backlight@fade-with-suspend.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-4/igt@kms_pm_backlight@fade-with-suspend.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-dpms-negative:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@kms_pm_dc@dc5-dpms-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1131">Intel XE#1131</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_pm_dc@dc5-dpms-negative.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-3/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_properties@plane-properties-legacy:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@kms_properties@plane-properties-legacy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@kms_properties@plane-properties-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-4/igt@kms_universal_plane@cursor-fb-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-3/igt@kms_universal_plane@cursor-fb-leak.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-1/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-8/igt@kms_universal_plane@cursor-fb-leak@pipe-a-dp-2.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-threads-large:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-2/igt@xe_evict@evict-beng-mixed-threads-large.html">TIMEOUT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-1/igt@xe_evict@evict-beng-mixed-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@xe_evict@evict-beng-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@xe_evict@evict-beng-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-cm-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@xe_evict@evict-cm-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-466/igt@xe_evict@evict-cm-threads-large.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-userptr-invalidate:</p>
<ul>
<li>{shard-bmg}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-bmg-4/igt@xe_exec_threads@threads-bal-userptr-invalidate.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-bmg-3/igt@xe_exec_threads@threads-bal-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-cm-fd-userptr-rebind:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@xe_exec_threads@threads-cm-fd-userptr-rebind.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-8/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1353">Intel XE#1353</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961">Intel XE#1961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026">Intel XE#2026</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@xe_pm@s3-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@xe_pm@s3-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-9/igt@xe_pm@s4-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-2/igt@xe_pm@s4-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-2/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-4/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-9/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-7/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-2/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-userptr-split-binds-2147483648:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@xe_vm@large-userptr-split-binds-2147483648.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@xe_vm@large-userptr-split-binds-2147483648.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-6-4-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/801">Intel XE#801</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-8/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-c-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-64bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_big_fb@4-tiled-64bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-4/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-180-hflip-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-32bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-32bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-463/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_big_fb@yf-tiled-addfb-size-offset-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-463/igt@kms_bw@connected-linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_bw@connected-linear-tiling-4-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs-cc@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-rc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +62 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-4/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +55 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_ccs@random-ccs-data-yf-tiled-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-435/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-0-50:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_chamelium_color@ctm-0-50.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-green-to-red:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_chamelium_color@ctm-green-to-red.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@dp-hpd-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_chamelium_hpd@dp-hpd-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd-without-ddc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_chamelium_hpd@vga-hpd-without-ddc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-466/igt@kms_cursor_crc@cursor-offscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@mst-extended-mode-negative:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-435/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_display_modes@mst-extended-mode-negative.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-463/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-4x:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_feature_discovery@display-4x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1138">Intel XE#1138</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@dp-mst:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-466/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_feature_discovery@dp-mst.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1137">Intel XE#1137</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_flip@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-32bpp-ytilegen12rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_frontbuffer_tracking@fbcdrrs-2p-primscrn-pri-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-suspend:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-6/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +23 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-8/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-rgb565-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@2x-scaler-multi-pipe:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-6/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-9/igt@kms_plane_scaling@2x-scaler-multi-pipe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-adlp-1/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-adlp-4/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@fade:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_pm_backlight@fade.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc3co-vpb-simulation:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-lnl-8/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/736">Intel XE#736</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-lnl-1/igt@kms_pm_dc@dc3co-vpb-simulation.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1909">Intel XE#1909</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_psr2_sf@fbc-cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_psr2_sf@primary-plane-update-sf-dmg-area-big-fb.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr-sprite-plane-onoff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_psr@fbc-psr-sprite-plane-onoff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_psr@psr2-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-pixel-format:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-436/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_rotation_crc@bad-pixel-format.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-436/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_tiled_display@basic-test-pattern-with-chamelium:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-466/igt@kms_tiled_display@basic-test-pattern-with-chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1500">Intel XE#1500</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-463/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@kms_vblank@ts-continuation-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-463/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-466/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-463/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@xe_compute_preempt@compute-threadgroup-preempt@engine-drm_xe_engine_class_compute.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1280">Intel XE#1280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-434/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-466/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-463/igt@xe_evict@evict-mixed-threads-large.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-invalidate-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-436/igt@xe_exec_fault_mode@twice-userptr-rebind-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@missing-sample-flags:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-434/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@xe_oa@missing-sample-flags.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@whitelisted-registers-userspace-config:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@xe_oa@whitelisted-registers-userspace-config.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2419">Intel XE#2419</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mmap-system:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-435/igt@xe_pm@d3cold-mmap-system.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-433/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@xe_pm@s4-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284">Intel XE#2284</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@vram-d3cold-threshold:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-466/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@xe_pm@vram-d3cold-threshold.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/579">Intel XE#579</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-cs-cycles:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-432/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-433/igt@xe_query@multigpu-query-cs-cycles.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-topology:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1716-9e05740a01c348338498296b934a7652efff6aef/shard-dg2-463/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136857v2/shard-dg2-432/igt@xe_query@multigpu-query-topology.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7956 -&gt; IGT_7957</li>
<li>Linux: xe-1716-9e05740a01c348338498296b934a7652efff6aef -&gt; xe-pw-136857v2</li>
</ul>
<p>IGT_7956: dc7e77d1a8643f50832c38b4c8f8ddb598c0cf48 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7957: cb9121cf18a2fa8dfa1f663484f3a460b95e1b41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1716-9e05740a01c348338498296b934a7652efff6aef: 9e05740a01c348338498296b934a7652efff6aef<br />
  xe-pw-136857v2: 136857v2</p>

</body>
</html>

--===============4450341113875519861==--
