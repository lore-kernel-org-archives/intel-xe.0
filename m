Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C321C3DA70
	for <intel-xe@archiver.kernel.org>; Tue, 23 Jul 2024 00:32:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6E5F410E1E4;
	Tue, 23 Jul 2024 00:32:16 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61A3E10E1E4;
 Tue, 23 Jul 2024 00:32:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3418343609317710488=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EFULL=3A_failure_for_drm/xe=3A_Decalre_xe_variable_i?=
 =?utf-8?q?n_xe=5Ffile=5Fclose?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 23 Jul 2024 00:32:12 -0000
Message-ID: <172169473238.358501.333684870413291612@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240722203318.1608626-1-matthew.brost@intel.com>
In-Reply-To: <20240722203318.1608626-1-matthew.brost@intel.com>
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

--===============3418343609317710488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Decalre xe variable in xe_file_close
URL   : https://patchwork.freedesktop.org/series/136358/
State : failure

== Summary ==

CI Bug Log - changes from xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0_full -> xe-pw-136358v1_full
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-136358v1_full absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-136358v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-136358v1_full:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_exec_basic@twice-bindexecqueue:
    - shard-adlp:         [PASS][1] -> [TIMEOUT][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-8/igt@xe_exec_basic@twice-bindexecqueue.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_exec_basic@twice-bindexecqueue.html

  * igt@xe_exec_fault_mode@many-execqueues-userptr:
    - shard-lnl:          [PASS][3] -> [ABORT][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-userptr.html

  
Known issues
------------

  Here are the changes found in xe-pw-136358v1_full that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:
    - shard-adlp:         [PASS][5] -> [DMESG-WARN][6] ([Intel XE#324]) +1 other test dmesg-warn
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:
    - shard-adlp:         [PASS][7] -> [DMESG-WARN][8] ([Intel XE#2338])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html

  * igt@kms_async_flips@invalid-async-flip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][9] ([Intel XE#873])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html

  * igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:
    - shard-lnl:          [PASS][10] -> [FAIL][11] ([Intel XE#1426]) +1 other test fail
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html

  * igt@kms_big_fb@4-tiled-addfb-size-overflow:
    - shard-adlp:         NOTRUN -> [SKIP][12] ([Intel XE#1201] / [Intel XE#610])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-lnl:          [PASS][13] -> [FAIL][14] ([Intel XE#1659])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@linear-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#316])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-16bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][16] ([Intel XE#1201] / [Intel XE#316]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][17] ([Intel XE#1201] / [Intel XE#316]) +2 other tests skip
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-adlp:         [PASS][18] -> [FAIL][19] ([Intel XE#1231]) +1 other test fail
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [PASS][20] -> [FAIL][21] ([Intel XE#1204])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [PASS][22] -> [FAIL][23] ([Intel XE#1874])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:
    - shard-adlp:         NOTRUN -> [FAIL][24] ([Intel XE#1231]) +2 other tests fail
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#1124] / [Intel XE#1201]) +9 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][26] ([Intel XE#1124] / [Intel XE#1201]) +6 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:
    - shard-dg2-set2:     NOTRUN -> [SKIP][27] ([Intel XE#1124])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:
    - shard-lnl:          NOTRUN -> [SKIP][28] ([Intel XE#1124]) +3 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html

  * igt@kms_bw@linear-tiling-2-displays-3840x2160p:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#367])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-2160x1440p:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#1201] / [Intel XE#367]) +2 other tests skip
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-4-displays-1920x1080p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][32] ([Intel XE#367])
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][33] ([Intel XE#1201] / [Intel XE#787]) +69 other tests skip
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][34] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +23 other tests skip
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][35] ([Intel XE#1201] / [Intel XE#787]) +41 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][36] ([Intel XE#1201] / [Intel XE#1252])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][37] ([Intel XE#1201] / [Intel XE#1252])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][38] ([Intel XE#1399]) +4 other tests skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#455] / [Intel XE#787]) +1 other test skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#787]) +6 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][41] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +19 other tests skip
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html

  * igt@kms_cdclk@mode-transition:
    - shard-lnl:          NOTRUN -> [SKIP][42] ([Intel XE#314] / [Intel XE#599])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_cdclk@mode-transition.html
    - shard-adlp:         NOTRUN -> [SKIP][43] ([Intel XE#1201] / [Intel XE#314] / [Intel XE#455]) +1 other test skip
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-8/igt@kms_cdclk@mode-transition.html

  * igt@kms_cdclk@mode-transition-all-outputs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#1201] / [Intel XE#314])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html

  * igt@kms_cdclk@mode-transition@pipe-b-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][45] ([Intel XE#314]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html

  * igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][46] ([Intel XE#1201] / [Intel XE#314]) +3 other tests skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-8/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html

  * igt@kms_cdclk@mode-transition@pipe-c-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][47] ([Intel XE#314]) +3 other tests skip
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html

  * igt@kms_cdclk@plane-scaling:
    - shard-adlp:         NOTRUN -> [SKIP][48] ([Intel XE#1152] / [Intel XE#1201] / [Intel XE#455])
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@kms_cdclk@plane-scaling.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][49] ([Intel XE#1152] / [Intel XE#1201]) +3 other tests skip
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#1152] / [Intel XE#1201]) +2 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1.html

  * igt@kms_chamelium_color@ctm-red-to-blue:
    - shard-dg2-set2:     NOTRUN -> [SKIP][51] ([Intel XE#1201] / [Intel XE#306]) +1 other test skip
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_chamelium_color@ctm-red-to-blue.html

  * igt@kms_chamelium_edid@dp-edid-resolution-list:
    - shard-adlp:         NOTRUN -> [SKIP][52] ([Intel XE#1201] / [Intel XE#373]) +9 other tests skip
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html

  * igt@kms_chamelium_edid@vga-edid-read:
    - shard-lnl:          NOTRUN -> [SKIP][53] ([Intel XE#373]) +1 other test skip
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_chamelium_edid@vga-edid-read.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-dg2-set2:     NOTRUN -> [SKIP][54] ([Intel XE#373])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_hpd@vga-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][55] ([Intel XE#1201] / [Intel XE#373]) +9 other tests skip
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html

  * igt@kms_content_protection@dp-mst-type-0:
    - shard-dg2-set2:     NOTRUN -> [SKIP][56] ([Intel XE#1201] / [Intel XE#307]) +1 other test skip
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html

  * igt@kms_content_protection@legacy:
    - shard-adlp:         NOTRUN -> [SKIP][57] ([Intel XE#1201] / [Intel XE#455]) +21 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@kms_content_protection@legacy.html

  * igt@kms_content_protection@lic-type-0:
    - shard-dg2-set2:     NOTRUN -> [FAIL][58] ([Intel XE#1204]) +1 other test fail
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_content_protection@lic-type-0.html

  * igt@kms_cursor_crc@cursor-onscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][59] ([Intel XE#1201] / [Intel XE#308])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-adlp:         NOTRUN -> [SKIP][60] ([Intel XE#1201] / [Intel XE#308]) +1 other test skip
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][61] ([Intel XE#1424]) +1 other test skip
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-3/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x512:
    - shard-dg2-set2:     NOTRUN -> [SKIP][62] ([Intel XE#308])
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html

  * igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][63] ([Intel XE#1201] / [Intel XE#323]) +1 other test skip
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][64] ([Intel XE#1201] / [Intel XE#323])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html

  * igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:
    - shard-adlp:         NOTRUN -> [SKIP][65] ([Intel XE#1201] / [Intel XE#309])
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html

  * igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:
    - shard-lnl:          NOTRUN -> [SKIP][66] ([Intel XE#309]) +2 other tests skip
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:
    - shard-lnl:          NOTRUN -> [SKIP][67] ([Intel XE#323])
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html

  * igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:
    - shard-lnl:          [PASS][68] -> [FAIL][69] ([Intel XE#1541])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html

  * igt@kms_dirtyfb@psr-dirtyfb-ioctl:
    - shard-dg2-set2:     NOTRUN -> [SKIP][70] ([Intel XE#455])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html

  * igt@kms_feature_discovery@chamelium:
    - shard-dg2-set2:     NOTRUN -> [SKIP][71] ([Intel XE#1201] / [Intel XE#701])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@kms_feature_discovery@chamelium.html

  * igt@kms_feature_discovery@display-2x:
    - shard-lnl:          NOTRUN -> [SKIP][72] ([Intel XE#702])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_feature_discovery@display-2x.html
    - shard-adlp:         NOTRUN -> [SKIP][73] ([Intel XE#1201] / [Intel XE#702])
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_feature_discovery@display-2x.html

  * igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][74] ([Intel XE#2019]) +1 other test dmesg-warn
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html

  * igt@kms_flip@2x-modeset-vs-vblank-race:
    - shard-lnl:          NOTRUN -> [SKIP][75] ([Intel XE#1421]) +1 other test skip
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html

  * igt@kms_flip@2x-nonexisting-fb-interruptible:
    - shard-adlp:         NOTRUN -> [SKIP][76] ([Intel XE#1201] / [Intel XE#310]) +5 other tests skip
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html

  * igt@kms_flip@flip-vs-panning-vs-hang:
    - shard-adlp:         [PASS][77] -> [SKIP][78] ([Intel XE#1201])
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-2/igt@kms_flip@flip-vs-panning-vs-hang.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_flip@flip-vs-panning-vs-hang.html

  * igt@kms_flip@flip-vs-suspend@a-hdmi-a6:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][79] ([Intel XE#1551]) +1 other test dmesg-warn
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][81] ([Intel XE#1401]) +1 other test skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         NOTRUN -> [DMESG-FAIL][82] ([Intel XE#324]) +1 other test dmesg-fail
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#1201] / [Intel XE#455]) +12 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][84] -> [DMESG-FAIL][85] ([Intel XE#324]) +1 other test dmesg-fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - shard-lnl:          NOTRUN -> [SKIP][86] ([Intel XE#352])
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-4/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:
    - shard-lnl:          NOTRUN -> [SKIP][87] ([Intel XE#651]) +4 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@drrs-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][88] ([Intel XE#1201] / [Intel XE#651]) +28 other tests skip
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         [PASS][89] -> [FAIL][90] ([Intel XE#1861]) +2 other tests fail
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:
    - shard-adlp:         NOTRUN -> [SKIP][91] ([Intel XE#1201] / [Intel XE#656]) +29 other tests skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][92] ([Intel XE#651]) +4 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][93] ([Intel XE#1201] / [Intel XE#651]) +13 other tests skip
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][94] ([Intel XE#653]) +3 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][95] ([Intel XE#1201] / [Intel XE#653]) +10 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-adlp:         NOTRUN -> [SKIP][96] ([Intel XE#1151] / [Intel XE#1201])
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#1158] / [Intel XE#1201])
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:
    - shard-lnl:          NOTRUN -> [SKIP][98] ([Intel XE#656]) +9 other tests skip
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@psr-suspend:
    - shard-dg2-set2:     NOTRUN -> [SKIP][99] ([Intel XE#1201] / [Intel XE#653]) +25 other tests skip
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-suspend.html

  * igt@kms_getfb@getfb-reject-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#1201] / [Intel XE#605])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html

  * igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [FAIL][101] ([Intel XE#616]) +13 other tests fail
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html

  * igt@kms_invalid_mode@bad-vtotal:
    - shard-adlp:         [PASS][102] -> [SKIP][103] ([Intel XE#1201] / [Intel XE#455])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-4/igt@kms_invalid_mode@bad-vtotal.html
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_invalid_mode@bad-vtotal.html

  * igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [PASS][104] -> [DMESG-WARN][105] ([Intel XE#1162])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html

  * igt@kms_plane@plane-position-hole:
    - shard-lnl:          [PASS][106] -> [DMESG-FAIL][107] ([Intel XE#324])
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-1/igt@kms_plane@plane-position-hole.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_plane@plane-position-hole.html

  * igt@kms_plane_cursor@primary:
    - shard-adlp:         NOTRUN -> [FAIL][108] ([Intel XE#1874]) +5 other tests fail
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_plane_cursor@primary.html

  * igt@kms_plane_multiple@tiling-yf:
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#599])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html

  * igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [PASS][110] -> [FAIL][111] ([Intel XE#361])
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][112] ([Intel XE#1201]) +5 other tests skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#1201] / [Intel XE#2318] / [Intel XE#455]) +1 other test skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html

  * igt@kms_pm_dc@dc9-dpms:
    - shard-adlp:         NOTRUN -> [SKIP][114] ([Intel XE#1201] / [Intel XE#734])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html

  * igt@kms_pm_rpm@dpms-non-lpsp:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#1201] / [Intel XE#836]) +1 other test skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][116] ([Intel XE#1489])
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html

  * igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:
    - shard-dg2-set2:     NOTRUN -> [SKIP][117] ([Intel XE#1201] / [Intel XE#1489]) +3 other tests skip
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html

  * igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:
    - shard-adlp:         NOTRUN -> [SKIP][118] ([Intel XE#1201]) +4 other tests skip
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html

  * igt@kms_psr2_su@page_flip-p010:
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1128])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-3/igt@kms_psr2_su@page_flip-p010.html

  * igt@kms_psr2_su@page_flip-xrgb8888:
    - shard-adlp:         NOTRUN -> [SKIP][120] ([Intel XE#1122] / [Intel XE#1201])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-8/igt@kms_psr2_su@page_flip-xrgb8888.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#1122] / [Intel XE#1201])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html

  * igt@kms_psr@fbc-psr2-primary-blt:
    - shard-dg2-set2:     NOTRUN -> [SKIP][122] ([Intel XE#1201] / [Intel XE#929]) +18 other tests skip
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-blt.html

  * igt@kms_psr@psr-primary-render:
    - shard-dg2-set2:     NOTRUN -> [SKIP][123] ([Intel XE#929])
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_psr@psr-primary-render.html

  * igt@kms_psr@psr2-primary-blt:
    - shard-adlp:         NOTRUN -> [SKIP][124] ([Intel XE#1201] / [Intel XE#929]) +12 other tests skip
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_psr@psr2-primary-blt.html

  * igt@kms_rotation_crc@bad-tiling:
    - shard-dg2-set2:     NOTRUN -> [SKIP][125] ([Intel XE#1201] / [Intel XE#327]) +2 other tests skip
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-lnl:          NOTRUN -> [SKIP][126] ([Intel XE#1127])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][127] ([Intel XE#327])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_tv_load_detect@load-detect:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#1201] / [Intel XE#330])
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:
    - shard-dg2-set2:     [PASS][129] -> [FAIL][130] ([Intel XE#899])
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:
    - shard-lnl:          [PASS][131] -> [FAIL][132] ([Intel XE#899])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html

  * igt@kms_vblank@ts-continuation-dpms-suspend:
    - shard-dg2-set2:     [PASS][133] -> [DMESG-WARN][134] ([Intel XE#1551]) +1 other test dmesg-warn
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html

  * igt@kms_writeback@writeback-pixel-formats:
    - shard-dg2-set2:     NOTRUN -> [SKIP][135] ([Intel XE#1201] / [Intel XE#756]) +1 other test skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - shard-lnl:          NOTRUN -> [SKIP][136] ([Intel XE#1091])
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_ccs@ctrl-surf-copy:
    - shard-adlp:         NOTRUN -> [SKIP][137] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#488])
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_compute@ccs-mode-compute-kernel:
    - shard-dg2-set2:     NOTRUN -> [FAIL][138] ([Intel XE#1050]) +1 other test fail
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#1201] / [Intel XE#1447])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@xe_compute@ccs-mode-compute-kernel.html

  * igt@xe_copy_basic@mem-copy-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][140] ([Intel XE#1123] / [Intel XE#1201])
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0x369:
    - shard-adlp:         NOTRUN -> [SKIP][141] ([Intel XE#1126] / [Intel XE#1201])
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_copy_basic@mem-set-linear-0x369.html

  * igt@xe_copy_basic@mem-set-linear-0xfffe:
    - shard-dg2-set2:     NOTRUN -> [SKIP][142] ([Intel XE#1126])
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html

  * igt@xe_evict@evict-beng-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][143] -> [INCOMPLETE][144] ([Intel XE#1195] / [Intel XE#1473] / [Intel XE#402])
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html

  * igt@xe_evict@evict-beng-threads-large-multi-vm:
    - shard-lnl:          NOTRUN -> [SKIP][145] ([Intel XE#688]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@xe_evict@evict-beng-threads-large-multi-vm.html

  * igt@xe_evict@evict-large-multi-vm-cm:
    - shard-adlp:         NOTRUN -> [SKIP][146] ([Intel XE#1201] / [Intel XE#261]) +4 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@xe_evict@evict-large-multi-vm-cm.html
    - shard-dg2-set2:     NOTRUN -> [FAIL][147] ([Intel XE#1600])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html

  * igt@xe_evict@evict-mixed-many-threads-small:
    - shard-dg2-set2:     [PASS][148] -> [TIMEOUT][149] ([Intel XE#1473])
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html

  * igt@xe_evict@evict-threads-small:
    - shard-adlp:         NOTRUN -> [SKIP][150] ([Intel XE#1201] / [Intel XE#261] / [Intel XE#688])
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@xe_evict@evict-threads-small.html

  * igt@xe_exec_balancer@no-exec-parallel-userptr:
    - shard-adlp:         NOTRUN -> [DMESG-WARN][151] ([Intel XE#2226])
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_exec_balancer@no-exec-parallel-userptr.html

  * igt@xe_exec_basic@many-userptr-invalidate-race:
    - shard-adlp:         [PASS][152] -> [INCOMPLETE][153] ([Intel XE#1195]) +1 other test incomplete
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-8/igt@xe_exec_basic@many-userptr-invalidate-race.html
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_exec_basic@many-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:
    - shard-lnl:          NOTRUN -> [SKIP][154] ([Intel XE#1392]) +4 other tests skip
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html

  * igt@xe_exec_basic@multigpu-once-basic-defer-bind:
    - shard-adlp:         NOTRUN -> [SKIP][155] ([Intel XE#1201] / [Intel XE#1392]) +5 other tests skip
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#1201] / [Intel XE#288]) +24 other tests skip
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html

  * igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#1201] / [Intel XE#288]) +16 other tests skip
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html

  * igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:
    - shard-dg2-set2:     NOTRUN -> [SKIP][158] ([Intel XE#288]) +3 other tests skip
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html

  * igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race:
    - shard-adlp:         [PASS][159] -> [DMESG-WARN][160] ([Intel XE#1727] / [Intel XE#2226])
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html

  * igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][161] ([Intel XE#1201] / [Intel XE#2229] / [Intel XE#455])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - shard-adlp:         NOTRUN -> [SKIP][162] ([Intel XE#1201] / [Intel XE#2229])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_noexec_ping_pong:
    - shard-adlp:         NOTRUN -> [SKIP][163] ([Intel XE#1201] / [Intel XE#379])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_noexec_ping_pong.html

  * igt@xe_pat@display-vs-wb-transient:
    - shard-adlp:         NOTRUN -> [SKIP][164] ([Intel XE#1201] / [Intel XE#1337])
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@xe_pat@display-vs-wb-transient.html

  * igt@xe_pat@pat-index-xehpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][165] ([Intel XE#1201] / [Intel XE#979])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html

  * igt@xe_pm@s3-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][166] ([Intel XE#1195] / [Intel XE#1358] / [Intel XE#1551] / [Intel XE#569])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@xe_pm@s3-basic-exec.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#1201] / [Intel XE#366]) +2 other tests skip
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html
    - shard-adlp:         NOTRUN -> [SKIP][168] ([Intel XE#1201] / [Intel XE#366]) +1 other test skip
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-dg2-set2:     [PASS][169] -> [DMESG-WARN][170] ([Intel XE#1551] / [Intel XE#569])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_pm@s3-vm-bind-userptr:
    - shard-dg2-set2:     NOTRUN -> [DMESG-WARN][171] ([Intel XE#1551] / [Intel XE#569]) +1 other test dmesg-warn
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html

  * igt@xe_pm@s4-exec-after:
    - shard-dg2-set2:     [PASS][172] -> [DMESG-WARN][173] ([Intel XE#2019])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-466/igt@xe_pm@s4-exec-after.html
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@xe_pm@s4-exec-after.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-adlp:         [PASS][174] -> [ABORT][175] ([Intel XE#1794])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-unbind-all:
    - shard-lnl:          [PASS][176] -> [ABORT][177] ([Intel XE#1794])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html

  * igt@xe_query@multigpu-query-engines:
    - shard-dg2-set2:     NOTRUN -> [SKIP][178] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@xe_query@multigpu-query-engines.html

  * igt@xe_query@multigpu-query-gt-list:
    - shard-lnl:          NOTRUN -> [SKIP][179] ([Intel XE#944]) +2 other tests skip
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-7/igt@xe_query@multigpu-query-gt-list.html

  * igt@xe_query@multigpu-query-uc-fw-version-huc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][180] ([Intel XE#944])
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html
    - shard-adlp:         NOTRUN -> [SKIP][181] ([Intel XE#1201] / [Intel XE#944]) +2 other tests skip
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html

  * igt@xe_vm@large-split-misaligned-binds-1073741824:
    - shard-adlp:         [PASS][182] -> [DMESG-WARN][183] ([Intel XE#2226]) +6 other tests dmesg-warn
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-6/igt@xe_vm@large-split-misaligned-binds-1073741824.html
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_vm@large-split-misaligned-binds-1073741824.html

  * igt@xe_wedged@wedged-at-any-timeout:
    - shard-lnl:          NOTRUN -> [DMESG-WARN][184] ([Intel XE#1760])
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@xe_wedged@wedged-at-any-timeout.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:
    - shard-adlp:         [DMESG-WARN][185] ([Intel XE#1033]) -> [PASS][186]
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html

  * igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:
    - shard-lnl:          [FAIL][187] ([Intel XE#1659]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][189] ([Intel XE#1231]) -> [PASS][190]
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-0:
    - shard-adlp:         [SKIP][191] ([Intel XE#1201]) -> [PASS][192] +2 other tests pass
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:
    - shard-adlp:         [FAIL][193] ([Intel XE#1874]) -> [PASS][194] +2 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:
    - shard-dg2-set2:     [INCOMPLETE][195] -> [PASS][196]
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html

  * igt@kms_flip@flip-vs-blocking-wf-vblank:
    - shard-lnl:          [FAIL][197] ([Intel XE#886]) -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible:
    - shard-dg2-set2:     [FAIL][199] ([Intel XE#301]) -> [PASS][200]
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible.html

  * igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:
    - shard-dg2-set2:     [FAIL][201] -> [PASS][202]
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][203] ([Intel XE#324]) -> [PASS][204] +2 other tests pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html

  * {igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1}:
    - shard-lnl:          [DMESG-WARN][205] -> [PASS][206]
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html

  * {igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3}:
    - shard-lnl:          [DMESG-WARN][207] ([Intel XE#324]) -> [PASS][208] +8 other tests pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html

  * igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:
    - shard-adlp:         [SKIP][209] ([Intel XE#1201] / [Intel XE#455]) -> [PASS][210] +1 other test pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html

  * igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:
    - shard-dg2-set2:     [INCOMPLETE][211] ([Intel XE#1195]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html

  * igt@kms_pm_backlight@bad-brightness:
    - shard-lnl:          [SKIP][213] ([Intel XE#870]) -> [PASS][214] +1 other test pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-6/igt@kms_pm_backlight@bad-brightness.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-1/igt@kms_pm_backlight@bad-brightness.html

  * igt@kms_pm_dc@dc5-psr:
    - shard-lnl:          [FAIL][215] ([Intel XE#718]) -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:
    - shard-lnl:          [FAIL][217] ([Intel XE#899]) -> [PASS][218]
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html

  * igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     [FAIL][219] ([Intel XE#899]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html

  * igt@xe_evict@evict-mixed-threads-large:
    - shard-dg2-set2:     [TIMEOUT][221] ([Intel XE#1473] / [Intel XE#392]) -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html

  * igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:
    - shard-adlp:         [DMESG-WARN][223] ([Intel XE#2226]) -> [PASS][224] +5 other tests pass
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html

  * igt@xe_exec_compute_mode@twice-userptr-invalidate-race:
    - shard-lnl:          [FAIL][225] ([Intel XE#1069]) -> [PASS][226]
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-5/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html

  * igt@xe_exec_reset@close-fd:
    - shard-lnl:          [ABORT][227] ([Intel XE#2271] / [Intel XE#2309]) -> [PASS][228]
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-3/igt@xe_exec_reset@close-fd.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-4/igt@xe_exec_reset@close-fd.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [TIMEOUT][229] ([Intel XE#2105] / [Intel XE#2345]) -> [PASS][230]
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_reset@virtual-close-fd:
    - shard-adlp:         [ABORT][231] ([Intel XE#2271]) -> [PASS][232]
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-4/igt@xe_exec_reset@virtual-close-fd.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@xe_exec_reset@virtual-close-fd.html

  * igt@xe_exec_threads@threads-bal-fd-userptr:
    - shard-dg2-set2:     [ABORT][233] -> [PASS][234]
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-435/igt@xe_exec_threads@threads-bal-fd-userptr.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@xe_exec_threads@threads-bal-fd-userptr.html

  * igt@xe_exec_threads@threads-bal-mixed-fd-basic:
    - shard-lnl:          [ABORT][235] -> [PASS][236]
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-1/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html

  * igt@xe_gt_freq@freq_fixed_exec:
    - shard-dg2-set2:     [FAIL][237] ([Intel XE#2262]) -> [PASS][238]
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-434/igt@xe_gt_freq@freq_fixed_exec.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@xe_gt_freq@freq_fixed_exec.html

  * igt@xe_live_ktest@xe_migrate:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#1192] / [Intel XE#1201]) -> [PASS][240]
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@many-reload:
    - shard-adlp:         [TIMEOUT][241] ([Intel XE#1961] / [Intel XE#2026]) -> [PASS][242]
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@xe_module_load@many-reload.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@xe_module_load@many-reload.html

  * igt@xe_pm@s4-d3hot-basic-exec:
    - shard-adlp:         [ABORT][243] ([Intel XE#1358]) -> [PASS][244]
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html

  * igt@xe_pm@s4-vm-bind-prefetch:
    - shard-dg2-set2:     [DMESG-WARN][245] ([Intel XE#2019]) -> [PASS][246] +1 other test pass
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-463/igt@xe_pm@s4-vm-bind-prefetch.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@xe_pm@s4-vm-bind-prefetch.html

  * igt@xe_pm@s4-vm-bind-userptr:
    - shard-lnl:          [ABORT][247] ([Intel XE#1794]) -> [PASS][248]
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html

  * igt@xe_pm_residency@toggle-gt-c6:
    - shard-lnl:          [FAIL][249] ([Intel XE#958]) -> [PASS][250]
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html

  * igt@xe_vm@munmap-style-unbind-either-side-partial-hammer:
    - shard-dg2-set2:     [ABORT][251] ([Intel XE#2271]) -> [PASS][252]
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-436/igt@xe_vm@munmap-style-unbind-either-side-partial-hammer.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@xe_vm@munmap-style-unbind-either-side-partial-hammer.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-90:
    - shard-adlp:         [SKIP][253] ([Intel XE#1201]) -> [SKIP][254] ([Intel XE#1124] / [Intel XE#1201])
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-90:
    - shard-dg2-set2:     [SKIP][255] ([Intel XE#1201] / [Intel XE#316]) -> [SKIP][256] ([Intel XE#316])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html

  * igt@kms_big_fb@linear-64bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][257] ([Intel XE#316]) -> [SKIP][258] ([Intel XE#1201] / [Intel XE#316])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-270.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-addfb-size-overflow:
    - shard-adlp:         [SKIP][259] ([Intel XE#1201]) -> [DMESG-WARN][260] ([Intel XE#1727] / [Intel XE#2226])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_big_fb@x-tiled-addfb-size-overflow.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_big_fb@x-tiled-addfb-size-overflow.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [FAIL][261] ([Intel XE#1231]) -> [DMESG-FAIL][262] ([Intel XE#324])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_big_fb@yf-tiled-64bpp-rotate-180:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#1124]) -> [SKIP][264] ([Intel XE#1124] / [Intel XE#1201]) +4 other tests skip
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-180:
    - shard-adlp:         [SKIP][265] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][266] ([Intel XE#1201])
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html

  * igt@kms_big_fb@yf-tiled-8bpp-rotate-270:
    - shard-dg2-set2:     [SKIP][267] ([Intel XE#1124] / [Intel XE#1201]) -> [SKIP][268] ([Intel XE#1124]) +3 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html

  * igt@kms_bw@linear-tiling-1-displays-1920x1080p:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#367]) -> [SKIP][270] ([Intel XE#1201] / [Intel XE#367])
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-2-displays-2160x1440p:
    - shard-dg2-set2:     [SKIP][271] ([Intel XE#1201] / [Intel XE#367]) -> [SKIP][272] ([Intel XE#367]) +1 other test skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:
    - shard-adlp:         [SKIP][273] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][274] ([Intel XE#1201])
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:
    - shard-dg2-set2:     [SKIP][275] ([Intel XE#1201] / [Intel XE#1252]) -> [SKIP][276] ([Intel XE#1252])
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:
    - shard-adlp:         [SKIP][277] ([Intel XE#1201]) -> [SKIP][278] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][279] ([Intel XE#1201] / [Intel XE#787]) -> [SKIP][280] ([Intel XE#787]) +34 other tests skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html

  * igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][281] ([Intel XE#787]) -> [SKIP][282] ([Intel XE#1201] / [Intel XE#787]) +48 other tests skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][283] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) -> [SKIP][284] ([Intel XE#455] / [Intel XE#787]) +9 other tests skip
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][286] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#787]) +13 other tests skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html

  * igt@kms_chamelium_color@degamma:
    - shard-dg2-set2:     [SKIP][287] ([Intel XE#306]) -> [SKIP][288] ([Intel XE#1201] / [Intel XE#306])
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_chamelium_color@degamma.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@kms_chamelium_color@degamma.html

  * igt@kms_chamelium_frames@dp-crc-fast:
    - shard-dg2-set2:     [SKIP][289] ([Intel XE#373]) -> [SKIP][290] ([Intel XE#1201] / [Intel XE#373]) +2 other tests skip
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-fast.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@kms_chamelium_frames@dp-crc-fast.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     [SKIP][291] ([Intel XE#1201] / [Intel XE#373]) -> [SKIP][292] ([Intel XE#373]) +4 other tests skip
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@dp-mst-type-1:
    - shard-dg2-set2:     [SKIP][293] ([Intel XE#307]) -> [SKIP][294] ([Intel XE#1201] / [Intel XE#307])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html

  * igt@kms_content_protection@mei-interface:
    - shard-dg2-set2:     [SKIP][295] ([Intel XE#1201]) -> [SKIP][296] ([Intel XE#1201] / [Intel XE#455])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-466/igt@kms_content_protection@mei-interface.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@kms_content_protection@mei-interface.html
    - shard-adlp:         [SKIP][297] ([Intel XE#1201]) -> [SKIP][298] ([Intel XE#1201] / [Intel XE#455])
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-8/igt@kms_content_protection@mei-interface.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-8/igt@kms_content_protection@mei-interface.html

  * igt@kms_cursor_crc@cursor-onscreen-512x512:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][300] ([Intel XE#308])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x170:
    - shard-adlp:         [SKIP][301] ([Intel XE#1201] / [Intel XE#308]) -> [SKIP][302] ([Intel XE#1201])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html

  * igt@kms_cursor_crc@cursor-rapid-movement-max-size:
    - shard-dg2-set2:     [SKIP][303] ([Intel XE#1201] / [Intel XE#455]) -> [SKIP][304] ([Intel XE#455]) +12 other tests skip
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-dg2-set2:     [SKIP][305] ([Intel XE#308]) -> [SKIP][306] ([Intel XE#1201] / [Intel XE#308])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_flip@2x-flip-vs-suspend-interruptible:
    - shard-dg2-set2:     [INCOMPLETE][307] ([Intel XE#2019]) -> [DMESG-WARN][308] ([Intel XE#2019])
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:
    - shard-adlp:         [SKIP][309] ([Intel XE#1201] / [Intel XE#656]) -> [SKIP][310] ([Intel XE#1201]) +2 other tests skip
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:
    - shard-dg2-set2:     [SKIP][311] ([Intel XE#651]) -> [SKIP][312] ([Intel XE#1201] / [Intel XE#651]) +14 other tests skip
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html

  * igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:
    - shard-adlp:         [FAIL][313] ([Intel XE#1861]) -> [SKIP][314] ([Intel XE#1201])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][316] ([Intel XE#651]) +10 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
    - shard-adlp:         [SKIP][317] ([Intel XE#1201]) -> [SKIP][318] ([Intel XE#1201] / [Intel XE#651])
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:
    - shard-adlp:         [SKIP][319] ([Intel XE#1201] / [Intel XE#651]) -> [SKIP][320] ([Intel XE#1201])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:
    - shard-adlp:         [SKIP][321] ([Intel XE#1201]) -> [SKIP][322] ([Intel XE#1201] / [Intel XE#653]) +1 other test skip
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:
    - shard-adlp:         [SKIP][323] ([Intel XE#1201]) -> [SKIP][324] ([Intel XE#1201] / [Intel XE#656]) +2 other tests skip
   [323]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html
   [324]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:
    - shard-dg2-set2:     [SKIP][325] ([Intel XE#653]) -> [SKIP][326] ([Intel XE#1201] / [Intel XE#653]) +10 other tests skip
   [325]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html
   [326]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:
    - shard-dg2-set2:     [SKIP][327] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][328] ([Intel XE#653]) +14 other tests skip
   [327]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html
   [328]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:
    - shard-dg2-set2:     [SKIP][329] ([Intel XE#1201] / [Intel XE#658]) -> [SKIP][330] ([Intel XE#658])
   [329]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html
   [330]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:
    - shard-adlp:         [SKIP][331] ([Intel XE#1201] / [Intel XE#653]) -> [SKIP][332] ([Intel XE#1201])
   [331]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html
   [332]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html

  * igt@kms_plane_multiple@tiling-y:
    - shard-dg2-set2:     [SKIP][333] ([Intel XE#455]) -> [SKIP][334] ([Intel XE#1201] / [Intel XE#455]) +9 other tests skip
   [333]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html
   [334]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:
    - shard-dg2-set2:     [SKIP][335] ([Intel XE#455] / [Intel XE#498]) -> [SKIP][336] ([Intel XE#1201] / [Intel XE#455] / [Intel XE#498]) +1 other test skip
   [335]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html
   [336]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html

  * igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:
    - shard-dg2-set2:     [SKIP][337] ([Intel XE#498]) -> [SKIP][338] ([Intel XE#1201] / [Intel XE#498]) +2 other tests skip
   [337]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html
   [338]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html

  * igt@kms_pm_dc@dc6-psr:
    - shard-dg2-set2:     [SKIP][339] ([Intel XE#1129]) -> [SKIP][340] ([Intel XE#1129] / [Intel XE#1201])
   [339]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html
   [340]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html

  * igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:
    - shard-dg2-set2:     [SKIP][341] ([Intel XE#1201] / [Intel XE#1489]) -> [SKIP][342] ([Intel XE#1489]) +1 other test skip
   [341]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-464/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html
   [342]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-dg2-set2:     [SKIP][343] ([Intel XE#1489]) -> [SKIP][344] ([Intel XE#1201] / [Intel XE#1489]) +1 other test skip
   [343]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html
   [344]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     [SKIP][345] ([Intel XE#929]) -> [SKIP][346] ([Intel XE#1201] / [Intel XE#929]) +4 other tests skip
   [345]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html
   [346]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@psr2-primary-render:
    - shard-dg2-set2:     [SKIP][347] ([Intel XE#1201] / [Intel XE#929]) -> [SKIP][348] ([Intel XE#929]) +8 other tests skip
   [347]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-436/igt@kms_psr@psr2-primary-render.html
   [348]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@multiplane-rotation-cropping-top:
    - shard-adlp:         [SKIP][349] ([Intel XE#1201]) -> [FAIL][350] ([Intel XE#1874]) +1 other test fail
   [349]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html
   [350]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:
    - shard-dg2-set2:     [SKIP][351] ([Intel XE#1201] / [Intel XE#327]) -> [SKIP][352] ([Intel XE#327]) +2 other tests skip
   [351]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html
   [352]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][353] ([Intel XE#1127]) -> [SKIP][354] ([Intel XE#1127] / [Intel XE#1201])
   [353]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html
   [354]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:
    - shard-adlp:         [SKIP][355] ([Intel XE#1201]) -> [SKIP][356] ([Intel XE#1201] / [Intel XE#327])
   [355]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html
   [356]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html

  * igt@kms_writeback@writeback-check-output-xrgb2101010:
    - shard-dg2-set2:     [SKIP][357] ([Intel XE#756]) -> [SKIP][358] ([Intel XE#1201] / [Intel XE#756])
   [357]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html
   [358]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html

  * igt@kms_writeback@writeback-fb-id-xrgb2101010:
    - shard-dg2-set2:     [SKIP][359] ([Intel XE#1201] / [Intel XE#756]) -> [SKIP][360] ([Intel XE#756])
   [359]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html
   [360]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-dg2-set2:     [SKIP][361] ([Intel XE#1126] / [Intel XE#1201]) -> [SKIP][362] ([Intel XE#1126])
   [361]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html
   [362]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
    - shard-dg2-set2:     [SKIP][363] ([Intel XE#288]) -> [SKIP][364] ([Intel XE#1201] / [Intel XE#288]) +13 other tests skip
   [363]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html
   [364]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_fault_mode@once-basic:
    - shard-dg2-set2:     [SKIP][365] ([Intel XE#1201] / [Intel XE#288]) -> [SKIP][366] ([Intel XE#288]) +7 other tests skip
   [365]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-435/igt@xe_exec_fault_mode@once-basic.html
   [366]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@xe_exec_fault_mode@once-basic.html

  * igt@xe_mmap@small-bar:
    - shard-dg2-set2:     [SKIP][367] ([Intel XE#1201] / [Intel XE#512]) -> [SKIP][368] ([Intel XE#512])
   [367]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-435/igt@xe_mmap@small-bar.html
   [368]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@xe_mmap@small-bar.html

  * igt@xe_module_load@force-load:
    - shard-dg2-set2:     [SKIP][369] ([Intel XE#1201] / [Intel XE#378]) -> [SKIP][370] ([Intel XE#378]) +1 other test skip
   [369]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-463/igt@xe_module_load@force-load.html
   [370]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@xe_module_load@force-load.html

  * igt@xe_pm@d3cold-multiple-execs:
    - shard-dg2-set2:     [SKIP][371] ([Intel XE#366]) -> [SKIP][372] ([Intel XE#1201] / [Intel XE#366])
   [371]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html
   [372]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html

  * igt@xe_pm@s3-d3hot-basic-exec:
    - shard-adlp:         [DMESG-WARN][373] ([Intel XE#1191] / [Intel XE#1727] / [Intel XE#2226]) -> [DMESG-FAIL][374] ([Intel XE#1191] / [Intel XE#1727])
   [373]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@xe_pm@s3-d3hot-basic-exec.html
   [374]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_pm@s3-d3hot-basic-exec.html

  * igt@xe_query@multigpu-query-invalid-size:
    - shard-dg2-set2:     [SKIP][375] ([Intel XE#944]) -> [SKIP][376] ([Intel XE#1201] / [Intel XE#944])
   [375]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@xe_query@multigpu-query-invalid-size.html
   [376]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@xe_query@multigpu-query-invalid-size.html

  * igt@xe_wedged@basic-wedged:
    - shard-dg2-set2:     [SKIP][377] ([Intel XE#1130] / [Intel XE#1201]) -> [DMESG-WARN][378] ([Intel XE#1760])
   [377]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-464/igt@xe_wedged@basic-wedged.html
   [378]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@xe_wedged@basic-wedged.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1033]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033
  [Intel XE#1050]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050
  [Intel XE#1069]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069
  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1122]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122
  [Intel XE#1123]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1128]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128
  [Intel XE#1129]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1152]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1162]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162
  [Intel XE#1191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#1195]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195
  [Intel XE#1201]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201
  [Intel XE#1204]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204
  [Intel XE#1231]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231
  [Intel XE#1252]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252
  [Intel XE#1337]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337
  [Intel XE#1358]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1399]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1426]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426
  [Intel XE#1447]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447
  [Intel XE#1473]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541
  [Intel XE#1551]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551
  [Intel XE#1600]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600
  [Intel XE#1659]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760
  [Intel XE#1794]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794
  [Intel XE#1861]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#1961]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961
  [Intel XE#2019]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019
  [Intel XE#2026]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026
  [Intel XE#2105]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105
  [Intel XE#2168]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2168
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2207]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2207
  [Intel XE#2226]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2262]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262
  [Intel XE#2271]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271
  [Intel XE#2309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2309
  [Intel XE#2318]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318
  [Intel XE#2338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338
  [Intel XE#2339]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2339
  [Intel XE#2345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2345
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
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
  [Intel XE#352]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/352
  [Intel XE#361]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/361
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/392
  [Intel XE#402]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/402
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#498]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/498
  [Intel XE#512]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/512
  [Intel XE#569]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/569
  [Intel XE#599]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/599
  [Intel XE#605]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/605
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#658]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/658
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#701]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/701
  [Intel XE#702]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/702
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#734]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/734
  [Intel XE#756]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/756
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#870]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/870
  [Intel XE#873]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/873
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#899]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/899
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [Intel XE#958]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/958
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_7933 -> IGT_7935
  * Linux: xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0 -> xe-pw-136358v1

  IGT_7933: 7933
  IGT_7935: a85286b8cdfc8d2c902128946e90f8b17cecaa89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0: ea064de9c72e649eca5659c6ef24019faa7019b0
  xe-pw-136358v1: 136358v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/index.html

--===============3418343609317710488==
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
<tr><td><b>Series:</b></td><td>drm/xe: Decalre xe variable in xe_file_close</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136358/">https://patchwork.freedesktop.org/series/136358/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0_full -&gt; xe-pw-136358v1_full</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-136358v1_full absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-136358v1_full, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-136358v1_full:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_exec_basic@twice-bindexecqueue:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-8/igt@xe_exec_basic@twice-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_exec_basic@twice-bindexecqueue.html">TIMEOUT</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-3/igt@xe_exec_fault_mode@many-execqueues-userptr.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-4/igt@xe_exec_fault_mode@many-execqueues-userptr.html">ABORT</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-136358v1_full that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-y.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-d-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2338">Intel XE#2338</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@invalid-async-flip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_async_flips@invalid-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/873">Intel XE#873</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-6/igt@kms_atomic_transition@plane-toggle-modeset-transition@pipe-a-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1426">Intel XE#1426</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@kms_big_fb@4-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-6/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_big_fb@linear-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_big_fb@x-tiled-16bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-8/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-6/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@kms_big_fb@yf-tiled-8bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-max-hw-stride-32bpp-rotate-180-hflip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-hflip-async-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-6/igt@kms_bw@linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-2160x1440p:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_bw@linear-tiling-3-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-4-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_bw@linear-tiling-4-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-mc-ccs@pipe-a-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +69 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +23 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_ccs@crc-primary-rotation-180-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-3/igt@kms_ccs@crc-sprite-planes-basic-yf-tiled-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1399">Intel XE#1399</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-rc-ccs-cc@pipe-d-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_ccs@random-ccs-data-y-tiled-gen12-rc-ccs-cc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +19 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-8/igt@kms_cdclk@mode-transition.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition-all-outputs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@kms_cdclk@mode-transition-all-outputs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_cdclk@mode-transition@pipe-b-edp-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-8/igt@kms_cdclk@mode-transition@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-c-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_cdclk@mode-transition@pipe-c-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/314">Intel XE#314</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@kms_cdclk@plane-scaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@kms_cdclk@plane-scaling@pipe-b-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@kms_cdclk@plane-scaling@pipe-b-hdmi-a-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1152">Intel XE#1152</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-red-to-blue:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_chamelium_color@ctm-red-to-blue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-resolution-list:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@kms_chamelium_edid@dp-edid-resolution-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@vga-edid-read:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_chamelium_edid@vga-edid-read.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@vga-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@kms_chamelium_hpd@vga-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_content_protection@dp-mst-type-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@kms_content_protection@legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +21 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_content_protection@lic-type-0.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1204">Intel XE#1204</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_cursor_crc@cursor-onscreen-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-3/igt@kms_cursor_crc@cursor-random-32x10.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424">Intel XE#1424</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x512:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>) +1 other test skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_cursor_legacy@basic-busy-flip-before-cursor-varying-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipa-toggle:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_cursor_legacy@cursorb-vs-flipa-toggle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursorb-vs-flipb-legacy:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-6/igt@kms_cursor_legacy@cursorb-vs-flipb-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-5/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/323">Intel XE#323</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-4/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_cursor_legacy@short-flip-after-cursor-atomic-transitions.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1541">Intel XE#1541</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dirtyfb@psr-dirtyfb-ioctl:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_dirtyfb@psr-dirtyfb-ioctl.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@chamelium:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@kms_feature_discovery@chamelium.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/701">Intel XE#701</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_feature_discovery@display-2x:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_feature_discovery@display-2x.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/702">Intel XE#702</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@kms_flip@2x-flip-vs-suspend@ab-hdmi-a6-dp4.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-modeset-vs-vblank-race:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-6/igt@kms_flip@2x-modeset-vs-vblank-race.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421">Intel XE#1421</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-nonexisting-fb-interruptible:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_flip@2x-nonexisting-fb-interruptible.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/310">Intel XE#310</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-2/igt@kms_flip@flip-vs-panning-vs-hang.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_flip@flip-vs-panning-vs-hang.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_flip@flip-vs-suspend@a-hdmi-a6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_flip_scaled_crc@flip-32bpp-4tile-to-32bpp-4tiledg2rcccs-upscaling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-6/igt@kms_flip_scaled_crc@flip-64bpp-4tile-to-32bpp-4tiledg2rcccs-downscaling@pipe-a-default-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-8/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-4/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/352">Intel XE#352</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-3/igt@kms_frontbuffer_tracking@drrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@kms_frontbuffer_tracking@drrs-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +28 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-8/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-shrfb-pgflip-blt.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +29 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-shrfb-pgflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcpsr-rgb101010-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_frontbuffer_tracking@plane-fbc-rte.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158">Intel XE#1158</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-1/igt@kms_frontbuffer_tracking@psr-2p-primscrn-spr-indfb-draw-mmap-wc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-suspend:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_frontbuffer_tracking@psr-suspend.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +25 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_getfb@getfb-reject-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_getfb@getfb-reject-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/605">Intel XE#605</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_hdr@static-toggle-suspend@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +13 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_invalid_mode@bad-vtotal:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-4/igt@kms_invalid_mode@bad-vtotal.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_invalid_mode@bad-vtotal.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-463/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_pipe_crc_basic@suspend-read-crc@pipe-c-hdmi-a-6.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1162">Intel XE#1162</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane@plane-position-hole:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-1/igt@kms_plane@plane-position-hole.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_plane@plane-position-hole.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@primary:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_plane_cursor@primary.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +5 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-yf:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-6/igt@kms_plane_multiple@tiling-yf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/599">Intel XE#599</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-435/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@kms_plane_scaling@intel-max-src-size@pipe-a-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/361">Intel XE#361</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-20x20@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_plane_scaling@planes-downscale-factor-0-25-upscale-factor-0-25.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2318">Intel XE#2318</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc9-dpms:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_pm_dc@dc9-dpms.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/734">Intel XE#734</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-non-lpsp:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@kms_pm_rpm@dpms-non-lpsp.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_psr2_sf@overlay-plane-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@kms_psr2_sf@overlay-primary-update-sf-dmg-area.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-p010:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-3/igt@kms_psr2_su@page_flip-p010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1128">Intel XE#1128</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_su@page_flip-xrgb8888:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-8/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_psr2_su@page_flip-xrgb8888.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1122">Intel XE#1122</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-psr2-primary-blt:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@kms_psr@fbc-psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +18 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-render:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_psr@psr-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_psr@psr2-primary-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@bad-tiling:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@kms_rotation_crc@bad-tiling.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-3/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_tv_load_detect@load-detect:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_tv_load_detect@load-detect.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/330">Intel XE#330</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-b-dp-4.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-b-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vblank@ts-continuation-dpms-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-434/igt@kms_vblank@ts-continuation-dpms-suspend.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@kms_vblank@ts-continuation-dpms-suspend.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-pixel-formats:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_writeback@writeback-pixel-formats.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@xe_ccs@ctrl-surf-copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_compute@ccs-mode-compute-kernel:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@xe_compute@ccs-mode-compute-kernel.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1050">Intel XE#1050</a>) +1 other test fail</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@xe_compute@ccs-mode-compute-kernel.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1447">Intel XE#1447</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-copy-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@xe_copy_basic@mem-copy-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1123">Intel XE#1123</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x369:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_copy_basic@mem-set-linear-0x369.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0xfffe:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0xfffe.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@xe_evict@evict-beng-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@xe_evict@evict-beng-mixed-many-threads-small.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/402">Intel XE#402</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-threads-large-multi-vm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@xe_evict@evict-beng-threads-large-multi-vm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-multi-vm-cm:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@xe_evict@evict-large-multi-vm-cm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a>) +4 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@xe_evict@evict-large-multi-vm-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1600">Intel XE#1600</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-many-threads-small:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@xe_evict@evict-mixed-many-threads-small.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@xe_evict@evict-mixed-many-threads-small.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-threads-small:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@xe_evict@evict-threads-small.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_balancer@no-exec-parallel-userptr:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_exec_balancer@no-exec-parallel-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@many-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-8/igt@xe_exec_basic@many-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_exec_basic@many-userptr-invalidate-race.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-basic-defer-bind:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@xe_exec_basic@multigpu-once-basic-defer-bind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@xe_exec_fault_mode@many-execqueues-bindexecqueue-userptr-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@xe_exec_fault_mode@once-bindexecqueue-userptr-invalidate-prefetch.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_exec_threads@threads-bal-fd-userptr-invalidate-race.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@xe_live_ktest@xe_bo@xe_bo_evict_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_noexec_ping_pong.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@display-vs-wb-transient:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@xe_pat@display-vs-wb-transient.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1337">Intel XE#1337</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@xe_pm@s3-basic-exec.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +2 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@xe_pm@s3-d3cold-basic-exec.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-434/igt@xe_pm@s3-d3hot-basic-exec.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-vm-bind-userptr:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@xe_pm@s3-vm-bind-userptr.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1551">Intel XE#1551</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/569">Intel XE#569</a>) +1 other test dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-exec-after:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-466/igt@xe_pm@s4-exec-after.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@xe_pm@s4-exec-after.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-8/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_pm@s4-vm-bind-prefetch.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-unbind-all:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-5/igt@xe_pm@s4-vm-bind-unbind-all.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@xe_pm@s4-vm-bind-unbind-all.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-engines:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@xe_query@multigpu-query-engines.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-gt-list:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-7/igt@xe_query@multigpu-query-gt-list.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-uc-fw-version-huc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@xe_query@multigpu-query-uc-fw-version-huc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-misaligned-binds-1073741824:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-6/igt@xe_vm@large-split-misaligned-binds-1073741824.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_vm@large-split-misaligned-binds-1073741824.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) +6 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@wedged-at-any-timeout:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@xe_wedged@wedged-at-any-timeout.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-2/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1033">Intel XE#1033</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_async_flips@async-flip-with-page-flip-events@pipe-b-hdmi-a-1-x.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-3/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1659">Intel XE#1659</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@kms_big_fb@4-tiled-max-hw-stride-64bpp-rotate-180-hflip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-2/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-0-async-flip.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_big_fb@y-tiled-16bpp-rotate-0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0-hflip.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">INCOMPLETE</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible@cd-hdmi-a6-dp4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-blocking-wf-vblank:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-3/igt@kms_flip@flip-vs-blocking-wf-vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-7/igt@kms_flip@flip-vs-blocking-wf-vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-434/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_flip@flip-vs-expired-vblank-interruptible@a-hdmi-a6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-32bpp-xtile-downscaling.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3}:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-4/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-8/igt@kms_plane@plane-position-hole-dpms@pipe-b-plane-3.html">PASS</a> +8 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@kms_plane_scaling@plane-scaler-unity-scaling-with-modifiers.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1195">Intel XE#1195</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_plane_scaling@planes-downscale-factor-0-5-unity-scaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@bad-brightness:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-6/igt@kms_pm_backlight@bad-brightness.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/870">Intel XE#870</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-1/igt@kms_pm_backlight@bad-brightness.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc5-psr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-4/igt@kms_pm_dc@dc5-psr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/718">Intel XE#718</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-7/igt@kms_pm_dc@dc5-psr.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-6/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-1/igt@kms_universal_plane@cursor-fb-leak@pipe-c-edp-1.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-464/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/899">Intel XE#899</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_universal_plane@cursor-fb-leak@pipe-d-hdmi-a-6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-large:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-433/igt@xe_evict@evict-mixed-threads-large.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1473">Intel XE#1473</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/392">Intel XE#392</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@xe_evict@evict-mixed-threads-large.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@xe_exec_compute_mode@many-execqueues-bindexecqueue-userptr-invalidate.html">PASS</a> +5 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate-race:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-2/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1069">Intel XE#1069</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-5/igt@xe_exec_compute_mode@twice-userptr-invalidate-race.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@close-fd:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-3/igt@xe_exec_reset@close-fd.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271">Intel XE#2271</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2309">Intel XE#2309</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-4/igt@xe_exec_reset@close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-463/igt@xe_exec_reset@parallel-gt-reset.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2105">Intel XE#2105</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2345">Intel XE#2345</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@virtual-close-fd:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-4/igt@xe_exec_reset@virtual-close-fd.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271">Intel XE#2271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@xe_exec_reset@virtual-close-fd.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-fd-userptr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-435/igt@xe_exec_threads@threads-bal-fd-userptr.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@xe_exec_threads@threads-bal-fd-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-bal-mixed-fd-basic:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-1/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-2/igt@xe_exec_threads@threads-bal-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_gt_freq@freq_fixed_exec:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-434/igt@xe_gt_freq@freq_fixed_exec.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2262">Intel XE#2262</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@xe_gt_freq@freq_fixed_exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-435/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192">Intel XE#1192</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@xe_live_ktest@xe_migrate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_module_load@many-reload:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@xe_module_load@many-reload.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1961">Intel XE#1961</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2026">Intel XE#2026</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@xe_module_load@many-reload.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-9/igt@xe_pm@s4-d3hot-basic-exec.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1358">Intel XE#1358</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@xe_pm@s4-d3hot-basic-exec.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-prefetch:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-463/igt@xe_pm@s4-vm-bind-prefetch.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@xe_pm@s4-vm-bind-prefetch.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s4-vm-bind-userptr:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-2/igt@xe_pm@s4-vm-bind-userptr.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1794">Intel XE#1794</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-3/igt@xe_pm@s4-vm-bind-userptr.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@toggle-gt-c6:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-lnl-3/igt@xe_pm_residency@toggle-gt-c6.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/958">Intel XE#958</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-lnl-5/igt@xe_pm_residency@toggle-gt-c6.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@munmap-style-unbind-either-side-partial-hammer:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-436/igt@xe_vm@munmap-style-unbind-either-side-partial-hammer.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2271">Intel XE#2271</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@xe_vm@munmap-style-unbind-either-side-partial-hammer.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_big_fb@4-tiled-16bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-435/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_big_fb@4-tiled-32bpp-rotate-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@linear-64bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@kms_big_fb@linear-64bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/316">Intel XE#316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_big_fb@x-tiled-addfb-size-overflow.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1231">Intel XE#1231</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/324">Intel XE#324</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-64bpp-rotate-180:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@kms_big_fb@yf-tiled-64bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-180:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-4/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_big_fb@yf-tiled-8bpp-rotate-180.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-8bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-435/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_big_fb@yf-tiled-8bpp-rotate-270.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-1920x1080p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_bw@linear-tiling-1-displays-1920x1080p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-2-displays-2160x1440p:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-436/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_bw@linear-tiling-2-displays-2160x1440p.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-6/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-434/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_ccs@bad-rotation-90-4-tiled-xe2-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1252">Intel XE#1252</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-466/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_ccs@crc-primary-basic-4-tiled-mtl-rc-ccs@pipe-b-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +34 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@kms_ccs@missing-ccs-buffer-4-tiled-mtl-rc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +48 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-466/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_ccs@random-ccs-data-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@kms_ccs@random-ccs-data-y-tiled-gen12-mc-ccs@pipe-d-dp-4.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@degamma:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@kms_chamelium_color@degamma.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@dp-crc-fast:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-464/igt@kms_chamelium_frames@dp-crc-fast.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_chamelium_hpd@hdmi-hpd.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_content_protection@dp-mst-type-1.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@mei-interface:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-466/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-8/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-8/igt@kms_content_protection@mei-interface.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-onscreen-512x512:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-464/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_cursor_crc@cursor-onscreen-512x512.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x170:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-4/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_cursor_crc@cursor-rapid-movement-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-max-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-433/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_cursor_crc@cursor-rapid-movement-max-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@kms_cursor_crc@cursor-sliding-512x170.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_flip@2x-flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2019">Intel XE#2019</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-shrfb-msflip-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1861">Intel XE#1861</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbc-1p-primscrn-pri-shrfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +10 other tests skip</li>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_frontbuffer_tracking@fbcdrrs-indfb-scaledprimary.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-1p-offscren-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +10 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-433/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-slowdraw.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-434/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_frontbuffer_tracking@fbcpsr-tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/658">Intel XE#658</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@kms_frontbuffer_tracking@psr-1p-primscrn-pri-indfb-draw-blt.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@tiling-y:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_plane_multiple@tiling-y.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +9 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-435/igt@kms_plane_scaling@plane-downscale-factor-0-25-with-modifiers@pipe-a-hdmi-a-6.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/498">Intel XE#498</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-psr:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-466/igt@kms_pm_dc@dc6-psr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1129">Intel XE#1129</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-464/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_psr2_sf@cursor-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-436/igt@kms_psr2_sf@fbc-overlay-plane-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_psr@fbc-pr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-436/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_psr@psr2-primary-render.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@multiplane-rotation-cropping-top:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-4/igt@kms_rotation_crc@multiplane-rotation-cropping-top.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_rotation_crc@primary-y-tiled-reflect-x-90.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127">Intel XE#1127</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@sprite-rotation-90-pos-100-0:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-6/igt@kms_rotation_crc@sprite-rotation-90-pos-100-0.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/327">Intel XE#327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-check-output-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@kms_writeback@writeback-check-output-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_writeback@writeback-fb-id-xrgb2101010:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-463/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@kms_writeback@writeback-fb-id-xrgb2101010.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/756">Intel XE#756</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-433/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@xe_copy_basic@mem-set-linear-0x3fff.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-433/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@once-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-435/igt@xe_exec_fault_mode@once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@xe_exec_fault_mode@once-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +7 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@small-bar:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-435/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@xe_mmap@small-bar.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/512">Intel XE#512</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@force-load:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-463/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-432/igt@xe_module_load@force-load.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-multiple-execs:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@xe_pm@d3cold-multiple-execs.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3hot-basic-exec:</p>
<ul>
<li>shard-adlp:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-adlp-1/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2226">Intel XE#2226</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-adlp-9/igt@xe_pm@s3-d3hot-basic-exec.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1191">Intel XE#1191</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-size:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-432/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-434/igt@xe_query@multigpu-query-invalid-size.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_wedged@basic-wedged:</p>
<ul>
<li>shard-dg2-set2:     <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0/shard-dg2-464/igt@xe_wedged@basic-wedged.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1201">Intel XE#1201</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136358v1/shard-dg2-463/igt@xe_wedged@basic-wedged.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1760">Intel XE#1760</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7933 -&gt; IGT_7935</li>
<li>Linux: xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0 -&gt; xe-pw-136358v1</li>
</ul>
<p>IGT_7933: 7933<br />
  IGT_7935: a85286b8cdfc8d2c902128946e90f8b17cecaa89 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1646-ea064de9c72e649eca5659c6ef24019faa7019b0: ea064de9c72e649eca5659c6ef24019faa7019b0<br />
  xe-pw-136358v1: 136358v1</p>

</body>
</html>

--===============3418343609317710488==--
