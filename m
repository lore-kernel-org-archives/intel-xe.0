Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A008C8302F
	for <intel-xe@archiver.kernel.org>; Tue,  1 Jul 2025 03:38:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 04ABF10E4E8;
	Tue,  1 Jul 2025 03:38:00 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 06BB810E4E8;
 Tue,  1 Jul 2025 03:37:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4638389015813119306=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_Xe=2ECI=2EFull=3A_failure_for_drm/xe=3A_Normalize_defaul?=
 =?utf-8?q?t_param_values?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 01 Jul 2025 03:37:58 -0000
Message-ID: <175134107801.122443.14231061057869613294@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250626-guc-log-level-v3-1-c3ed8b452e91@intel.com>
In-Reply-To: <20250626-guc-log-level-v3-1-c3ed8b452e91@intel.com>
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

--===============4638389015813119306==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Normalize default param values
URL   : https://patchwork.freedesktop.org/series/150845/
State : failure

== Summary ==

CI Bug Log - changes from xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e_FULL -> xe-pw-150845v1_FULL
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-150845v1_FULL absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-150845v1_FULL, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-150845v1_FULL:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_flip@2x-absolute-wf_vblank@bc-dp2-hdmi-a3:
    - shard-bmg:          [PASS][1] -> [FAIL][2] +2 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-1/igt@kms_flip@2x-absolute-wf_vblank@bc-dp2-hdmi-a3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-4/igt@kms_flip@2x-absolute-wf_vblank@bc-dp2-hdmi-a3.html

  
New tests
---------

  New tests have been introduced between xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e_FULL and xe-pw-150845v1_FULL:

### New IGT tests (62) ###

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-3-4-rc-ccs-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-3-4-rc-ccs-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-3-4-rc-ccs-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-3-4-rc-ccs-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-3-4-rc-ccs-y210:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-3-4-rc-ccs-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-4-rc-ccs-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-4-rc-ccs-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-4-rc-ccs-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.12] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-4-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-4-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-4-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-4-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-4-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-4-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-4-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-4-y210:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-4-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-linear-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [0.13] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-linear-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-linear-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-linear-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-linear-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-linear-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-linear-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-linear-y210:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-linear-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-x-rgb565:
    - Statuses : 1 pass(s)
    - Exec time: [0.11] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-x-xrgb16161616f:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-x-xrgb2101010:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-x-xrgb8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-x-xv30:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-x-xv36:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-x-xyuv8888:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-x-y210:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi-a-6-x-yuyv:
    - Statuses : 1 pass(s)
    - Exec time: [0.03] s

  * igt@kms_color@ctm-blue-to-red@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.72] s

  * igt@kms_color@ctm-blue-to-red@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.55] s

  * igt@kms_color@ctm-blue-to-red@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@ctm-blue-to-red@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-red-to-blue@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.70] s

  * igt@kms_color@ctm-red-to-blue@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-red-to-blue@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.54] s

  * igt@kms_color@ctm-red-to-blue@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@degamma@pipe-a-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.56] s

  * igt@kms_color@degamma@pipe-a-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.74] s

  * igt@kms_color@degamma@pipe-b-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.53] s

  * igt@kms_color@degamma@pipe-b-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@degamma@pipe-c-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_color@degamma@pipe-c-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_color@degamma@pipe-d-dp-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@degamma@pipe-d-hdmi-a-2:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_color@legacy-gamma@pipe-a-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.76] s

  * igt@kms_color@legacy-gamma@pipe-b-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_color@legacy-gamma@pipe-c-dp-4:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_color@legacy-gamma@pipe-c-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.49] s

  * igt@kms_color@legacy-gamma@pipe-d-hdmi-a-6:
    - Statuses : 1 pass(s)
    - Exec time: [0.51] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.50] s

  * igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.43] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [1.09] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.97] s

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-3:
    - Statuses : 1 pass(s)
    - Exec time: [0.98] s

  

Known issues
------------

  Here are the changes found in xe-pw-150845v1_FULL that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1:
    - shard-lnl:          [PASS][3] -> [FAIL][4] ([Intel XE#911]) +3 other tests fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-2/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html

  * igt@kms_big_fb@4-tiled-16bpp-rotate-0:
    - shard-adlp:         NOTRUN -> [SKIP][5] ([Intel XE#1124]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-9/igt@kms_big_fb@4-tiled-16bpp-rotate-0.html

  * igt@kms_big_fb@4-tiled-32bpp-rotate-270:
    - shard-dg2-set2:     NOTRUN -> [SKIP][6] ([Intel XE#316]) +4 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-rotate-270.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-0:
    - shard-adlp:         [PASS][7] -> [DMESG-FAIL][8] ([Intel XE#4543]) +9 other tests dmesg-fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-8/igt@kms_big_fb@x-tiled-8bpp-rotate-0.html

  * igt@kms_big_fb@x-tiled-8bpp-rotate-90:
    - shard-adlp:         NOTRUN -> [SKIP][9] ([Intel XE#316])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
    - shard-lnl:          NOTRUN -> [SKIP][10] ([Intel XE#1407])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html
    - shard-bmg:          NOTRUN -> [SKIP][11] ([Intel XE#2327])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_big_fb@x-tiled-8bpp-rotate-90.html

  * igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:
    - shard-adlp:         [PASS][12] -> [SKIP][13] ([Intel XE#4947])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-6/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html

  * igt@kms_big_fb@y-tiled-16bpp-rotate-180:
    - shard-bmg:          NOTRUN -> [SKIP][14] ([Intel XE#1124]) +2 other tests skip
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-8/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][15] ([Intel XE#1124]) +6 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html
    - shard-lnl:          NOTRUN -> [SKIP][16] ([Intel XE#1124]) +1 other test skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-7/igt@kms_big_fb@y-tiled-16bpp-rotate-180.html

  * igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][17] ([Intel XE#607])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-size-offset-overflow.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:
    - shard-adlp:         [PASS][18] -> [FAIL][19] ([Intel XE#1874])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-1/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-9/igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html

  * igt@kms_big_fb@yf-tiled-addfb:
    - shard-dg2-set2:     NOTRUN -> [SKIP][20] ([Intel XE#619])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.html

  * igt@kms_big_fb@yf-tiled-addfb-size-overflow:
    - shard-dg2-set2:     NOTRUN -> [SKIP][21] ([Intel XE#610])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-size-overflow.html

  * igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:
    - shard-bmg:          [PASS][22] -> [SKIP][23] ([Intel XE#2314] / [Intel XE#2894])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-7/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html

  * igt@kms_bw@linear-tiling-3-displays-3840x2160p:
    - shard-dg2-set2:     NOTRUN -> [SKIP][24] ([Intel XE#367]) +2 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_bw@linear-tiling-3-displays-3840x2160p.html

  * igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [SKIP][25] ([Intel XE#787]) +181 other tests skip
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6.html

  * igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:
    - shard-bmg:          NOTRUN -> [SKIP][26] ([Intel XE#2887]) +4 other tests skip
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-4/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html
    - shard-adlp:         NOTRUN -> [SKIP][27] ([Intel XE#455] / [Intel XE#787]) +3 other tests skip
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][28] ([Intel XE#2907])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-lnl:          NOTRUN -> [SKIP][29] ([Intel XE#2887]) +2 other tests skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:
    - shard-adlp:         NOTRUN -> [SKIP][30] ([Intel XE#3442])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][31] ([Intel XE#3442])
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][32] ([Intel XE#2669] / [Intel XE#3433]) +3 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:
    - shard-dg2-set2:     [PASS][33] -> [INCOMPLETE][34] ([Intel XE#3862]) +1 other test incomplete
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-464/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-463/igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html

  * igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [SKIP][35] ([Intel XE#2652] / [Intel XE#787]) +11 other tests skip
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2.html

  * igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][36] ([Intel XE#455] / [Intel XE#787]) +37 other tests skip
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html

  * igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:
    - shard-adlp:         NOTRUN -> [SKIP][37] ([Intel XE#787]) +5 other tests skip
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:
    - shard-dg2-set2:     NOTRUN -> [INCOMPLETE][38] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124])
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6.html

  * igt@kms_cdclk@mode-transition@pipe-d-dp-4:
    - shard-dg2-set2:     NOTRUN -> [SKIP][39] ([Intel XE#4417]) +3 other tests skip
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/igt@kms_cdclk@mode-transition@pipe-d-dp-4.html

  * igt@kms_cdclk@plane-scaling@pipe-b-dp-2:
    - shard-dg2-set2:     NOTRUN -> [SKIP][40] ([Intel XE#4416]) +3 other tests skip
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pipe-b-dp-2.html

  * igt@kms_chamelium_color@ctm-blue-to-red:
    - shard-lnl:          NOTRUN -> [SKIP][41] ([Intel XE#306])
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-3/igt@kms_chamelium_color@ctm-blue-to-red.html
    - shard-adlp:         NOTRUN -> [SKIP][42] ([Intel XE#306])
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_chamelium_color@ctm-blue-to-red.html
    - shard-bmg:          NOTRUN -> [SKIP][43] ([Intel XE#2325])
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-to-red.html

  * igt@kms_chamelium_color@gamma:
    - shard-dg2-set2:     NOTRUN -> [SKIP][44] ([Intel XE#306])
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@kms_chamelium_color@gamma.html

  * igt@kms_chamelium_edid@dp-edid-change-during-hibernate:
    - shard-bmg:          NOTRUN -> [SKIP][45] ([Intel XE#2252]) +2 other tests skip
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - shard-lnl:          NOTRUN -> [SKIP][46] ([Intel XE#373]) +1 other test skip
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-7/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html
    - shard-adlp:         NOTRUN -> [SKIP][47] ([Intel XE#373])
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-8/igt@kms_chamelium_edid@dp-edid-change-during-hibernate.html

  * igt@kms_chamelium_hpd@hdmi-hpd:
    - shard-dg2-set2:     NOTRUN -> [SKIP][48] ([Intel XE#373]) +6 other tests skip
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.html

  * igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][49] ([Intel XE#1178])
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@kms_content_protection@atomic-dpms@pipe-a-dp-2.html

  * igt@kms_content_protection@content-type-change:
    - shard-adlp:         NOTRUN -> [SKIP][50] ([Intel XE#455]) +3 other tests skip
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@kms_content_protection@content-type-change.html
    - shard-bmg:          NOTRUN -> [SKIP][51] ([Intel XE#2341])
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-4/igt@kms_content_protection@content-type-change.html
    - shard-lnl:          NOTRUN -> [SKIP][52] ([Intel XE#3278])
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-6/igt@kms_content_protection@content-type-change.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-bmg:          NOTRUN -> [SKIP][53] ([Intel XE#2390])
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_content_protection@dp-mst-lic-type-1.html
    - shard-lnl:          NOTRUN -> [SKIP][54] ([Intel XE#307])
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@lic-type-0@pipe-a-dp-2:
    - shard-bmg:          NOTRUN -> [FAIL][55] ([Intel XE#1178]) +2 other tests fail
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-2/igt@kms_content_protection@lic-type-0@pipe-a-dp-2.html

  * igt@kms_content_protection@uevent@pipe-a-dp-2:
    - shard-dg2-set2:     NOTRUN -> [FAIL][56] ([Intel XE#1188])
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@kms_content_protection@uevent@pipe-a-dp-2.html

  * igt@kms_cursor_crc@cursor-offscreen-512x170:
    - shard-dg2-set2:     NOTRUN -> [SKIP][57] ([Intel XE#308]) +2 other tests skip
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offscreen-512x170.html

  * igt@kms_cursor_crc@cursor-random-32x10:
    - shard-lnl:          NOTRUN -> [SKIP][58] ([Intel XE#1424])
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-7/igt@kms_cursor_crc@cursor-random-32x10.html
    - shard-bmg:          NOTRUN -> [SKIP][59] ([Intel XE#2320])
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_cursor_crc@cursor-random-32x10.html

  * igt@kms_cursor_crc@cursor-sliding-512x170:
    - shard-lnl:          NOTRUN -> [SKIP][60] ([Intel XE#2321])
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding-512x170.html
    - shard-bmg:          NOTRUN -> [SKIP][61] ([Intel XE#2321])
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding-512x170.html

  * igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:
    - shard-bmg:          [PASS][62] -> [SKIP][63] ([Intel XE#2291]) +5 other tests skip
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-3/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy.html

  * igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:
    - shard-adlp:         NOTRUN -> [SKIP][64] ([Intel XE#309]) +1 other test skip
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html
    - shard-lnl:          NOTRUN -> [SKIP][65] ([Intel XE#309]) +1 other test skip
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size.html

  * igt@kms_display_modes@extended-mode-basic:
    - shard-bmg:          [PASS][66] -> [SKIP][67] ([Intel XE#4302])
   [66]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-3/igt@kms_display_modes@extended-mode-basic.html
   [67]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-5/igt@kms_display_modes@extended-mode-basic.html

  * igt@kms_dp_link_training@uhbr-sst:
    - shard-dg2-set2:     NOTRUN -> [SKIP][68] ([Intel XE#4356])
   [68]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@kms_dp_link_training@uhbr-sst.html

  * igt@kms_dp_linktrain_fallback@dp-fallback:
    - shard-adlp:         NOTRUN -> [SKIP][69] ([Intel XE#4947])
   [69]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_dp_linktrain_fallback@dp-fallback.html

  * igt@kms_flip@2x-flip-vs-panning-vs-hang:
    - shard-bmg:          NOTRUN -> [SKIP][70] ([Intel XE#2316])
   [70]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-vs-hang.html

  * igt@kms_flip@2x-flip-vs-rmfb:
    - shard-lnl:          NOTRUN -> [SKIP][71] ([Intel XE#1421])
   [71]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-6/igt@kms_flip@2x-flip-vs-rmfb.html
    - shard-adlp:         NOTRUN -> [SKIP][72] ([Intel XE#310])
   [72]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-rmfb.html

  * igt@kms_flip@2x-plain-flip-interruptible:
    - shard-bmg:          [PASS][73] -> [SKIP][74] ([Intel XE#2316]) +4 other tests skip
   [73]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-2/igt@kms_flip@2x-plain-flip-interruptible.html
   [74]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-5/igt@kms_flip@2x-plain-flip-interruptible.html

  * igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2:
    - shard-bmg:          [PASS][75] -> [FAIL][76] ([Intel XE#3098] / [Intel XE#5338]) +1 other test fail
   [75]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-4/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2.html
   [76]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-4/igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2.html

  * igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:
    - shard-adlp:         [PASS][77] -> [DMESG-WARN][78] ([Intel XE#4543]) +14 other tests dmesg-warn
   [77]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-4/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html
   [78]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-4/igt@kms_flip@plain-flip-interruptible@b-hdmi-a1.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-lnl:          NOTRUN -> [SKIP][79] ([Intel XE#1401] / [Intel XE#1745]) +1 other test skip
   [79]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode:
    - shard-lnl:          NOTRUN -> [SKIP][80] ([Intel XE#1401]) +1 other test skip
   [80]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:
    - shard-bmg:          NOTRUN -> [SKIP][81] ([Intel XE#2293] / [Intel XE#2380]) +2 other tests skip
   [81]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling.html

  * igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode:
    - shard-bmg:          NOTRUN -> [SKIP][82] ([Intel XE#2293]) +2 other tests skip
   [82]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode:
    - shard-dg2-set2:     NOTRUN -> [SKIP][83] ([Intel XE#455]) +15 other tests skip
   [83]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html

  * igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode:
    - shard-adlp:         [PASS][84] -> [DMESG-FAIL][85] ([Intel XE#4543] / [Intel XE#4921]) +1 other test dmesg-fail
   [84]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-3/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html
   [85]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:
    - shard-dg2-set2:     NOTRUN -> [SKIP][86] ([Intel XE#651]) +28 other tests skip
   [86]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-433/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][87] ([Intel XE#656]) +5 other tests skip
   [87]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:
    - shard-bmg:          NOTRUN -> [SKIP][88] ([Intel XE#4141])
   [88]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][89] ([Intel XE#2311]) +5 other tests skip
   [89]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:
    - shard-adlp:         NOTRUN -> [SKIP][90] ([Intel XE#651])
   [90]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html
    - shard-lnl:          NOTRUN -> [SKIP][91] ([Intel XE#651]) +1 other test skip
   [91]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:
    - shard-bmg:          NOTRUN -> [SKIP][92] ([Intel XE#2313]) +8 other tests skip
   [92]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc.html

  * igt@kms_frontbuffer_tracking@plane-fbc-rte:
    - shard-dg2-set2:     NOTRUN -> [SKIP][93] ([Intel XE#1158])
   [93]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_frontbuffer_tracking@plane-fbc-rte.html

  * igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:
    - shard-adlp:         NOTRUN -> [SKIP][94] ([Intel XE#653]) +4 other tests skip
   [94]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:
    - shard-lnl:          NOTRUN -> [SKIP][95] ([Intel XE#656]) +8 other tests skip
   [95]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html
    - shard-bmg:          NOTRUN -> [SKIP][96] ([Intel XE#2312]) +4 other tests skip
   [96]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@psr-slowdraw:
    - shard-dg2-set2:     NOTRUN -> [SKIP][97] ([Intel XE#653]) +24 other tests skip
   [97]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-slowdraw.html

  * igt@kms_joiner@basic-big-joiner:
    - shard-adlp:         NOTRUN -> [SKIP][98] ([Intel XE#346])
   [98]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@kms_joiner@basic-big-joiner.html
    - shard-bmg:          NOTRUN -> [SKIP][99] ([Intel XE#346])
   [99]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@kms_joiner@basic-big-joiner.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][100] ([Intel XE#346])
   [100]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@kms_joiner@basic-big-joiner.html
    - shard-lnl:          NOTRUN -> [SKIP][101] ([Intel XE#346])
   [101]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-4/igt@kms_joiner@basic-big-joiner.html

  * igt@kms_pm_backlight@brightness-with-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][102] ([Intel XE#2938])
   [102]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@kms_pm_backlight@brightness-with-dpms.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-dg2-set2:     NOTRUN -> [SKIP][103] ([Intel XE#908])
   [103]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:
    - shard-adlp:         NOTRUN -> [SKIP][104] ([Intel XE#836])
   [104]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html
    - shard-lnl:          NOTRUN -> [SKIP][105] ([Intel XE#1439] / [Intel XE#3141])
   [105]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait.html

  * igt@kms_properties@crtc-properties-atomic:
    - shard-adlp:         [PASS][106] -> [SKIP][107] ([Intel XE#4950]) +8 other tests skip
   [106]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_properties@crtc-properties-atomic.html
   [107]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_properties@crtc-properties-atomic.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:
    - shard-adlp:         NOTRUN -> [SKIP][108] ([Intel XE#1489]) +1 other test skip
   [108]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html
    - shard-lnl:          NOTRUN -> [SKIP][109] ([Intel XE#2893] / [Intel XE#4608])
   [109]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:
    - shard-dg2-set2:     NOTRUN -> [SKIP][110] ([Intel XE#1489]) +3 other tests skip
   [110]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf.html

  * igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:
    - shard-lnl:          NOTRUN -> [SKIP][111] ([Intel XE#4608]) +3 other tests skip
   [111]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1.html

  * igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:
    - shard-bmg:          NOTRUN -> [SKIP][112] ([Intel XE#1489]) +1 other test skip
   [112]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf.html

  * igt@kms_psr@fbc-pr-cursor-plane-move:
    - shard-dg2-set2:     NOTRUN -> [SKIP][113] ([Intel XE#2850] / [Intel XE#929]) +14 other tests skip
   [113]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane-move.html

  * igt@kms_psr@fbc-pr-cursor-render:
    - shard-lnl:          NOTRUN -> [SKIP][114] ([Intel XE#1406])
   [114]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-5/igt@kms_psr@fbc-pr-cursor-render.html

  * igt@kms_psr@psr-sprite-plane-onoff:
    - shard-adlp:         NOTRUN -> [SKIP][115] ([Intel XE#2850] / [Intel XE#929]) +3 other tests skip
   [115]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@kms_psr@psr-sprite-plane-onoff.html
    - shard-bmg:          NOTRUN -> [SKIP][116] ([Intel XE#2234] / [Intel XE#2850]) +4 other tests skip
   [116]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-4/igt@kms_psr@psr-sprite-plane-onoff.html

  * igt@kms_psr@psr2-primary-render:
    - shard-bmg:          NOTRUN -> [SKIP][117] ([Intel XE#2234])
   [117]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_psr@psr2-primary-render.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-bmg:          NOTRUN -> [SKIP][118] ([Intel XE#2330])
   [118]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
    - shard-lnl:          NOTRUN -> [SKIP][119] ([Intel XE#1127])
   [119]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-dg2-set2:     NOTRUN -> [SKIP][120] ([Intel XE#1127])
   [120]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-433/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:
    - shard-dg2-set2:     NOTRUN -> [SKIP][121] ([Intel XE#3414])
   [121]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90.html

  * igt@kms_setmode@invalid-clone-single-crtc:
    - shard-bmg:          [PASS][122] -> [SKIP][123] ([Intel XE#1435])
   [122]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-1/igt@kms_setmode@invalid-clone-single-crtc.html
   [123]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@kms_setmode@invalid-clone-single-crtc.html

  * igt@kms_vrr@cmrr@pipe-a-edp-1:
    - shard-lnl:          [PASS][124] -> [FAIL][125] ([Intel XE#4459]) +1 other test fail
   [124]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-6/igt@kms_vrr@cmrr@pipe-a-edp-1.html
   [125]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.html

  * igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:
    - shard-dg2-set2:     NOTRUN -> [SKIP][126] ([Intel XE#1091] / [Intel XE#2849])
   [126]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all.html

  * igt@xe_copy_basic@mem-set-linear-0x3fff:
    - shard-adlp:         NOTRUN -> [SKIP][127] ([Intel XE#1126])
   [127]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear-0x3fff.html

  * igt@xe_eu_stall@invalid-event-report-count:
    - shard-dg2-set2:     NOTRUN -> [SKIP][128] ([Intel XE#5308]) +1 other test skip
   [128]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-435/igt@xe_eu_stall@invalid-event-report-count.html

  * igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:
    - shard-dg2-set2:     NOTRUN -> [SKIP][129] ([Intel XE#4837]) +12 other tests skip
   [129]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
    - shard-lnl:          NOTRUN -> [SKIP][130] ([Intel XE#4837])
   [130]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-6/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html
    - shard-adlp:         NOTRUN -> [SKIP][131] ([Intel XE#4837])
   [131]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-ufence-delay-ack.html

  * igt@xe_eudebug_sriov@deny-sriov:
    - shard-dg2-set2:     NOTRUN -> [SKIP][132] ([Intel XE#4518])
   [132]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@xe_eudebug_sriov@deny-sriov.html

  * igt@xe_evict@evict-large-external-cm:
    - shard-lnl:          NOTRUN -> [SKIP][133] ([Intel XE#688])
   [133]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-6/igt@xe_evict@evict-large-external-cm.html
    - shard-adlp:         NOTRUN -> [SKIP][134] ([Intel XE#261] / [Intel XE#688])
   [134]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@xe_evict@evict-large-external-cm.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:
    - shard-bmg:          NOTRUN -> [SKIP][135] ([Intel XE#2322]) +2 other tests skip
   [135]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind.html

  * igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:
    - shard-dg2-set2:     [PASS][136] -> [SKIP][137] ([Intel XE#1392]) +2 other tests skip
   [136]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-435/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html
   [137]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:
    - shard-lnl:          NOTRUN -> [SKIP][138] ([Intel XE#1392]) +1 other test skip
   [138]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html
    - shard-adlp:         NOTRUN -> [SKIP][139] ([Intel XE#1392])
   [139]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-3/igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap.html

  * igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:
    - shard-dg2-set2:     NOTRUN -> [SKIP][140] ([Intel XE#1392]) +2 other tests skip
   [140]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:
    - shard-dg2-set2:     NOTRUN -> [SKIP][141] ([Intel XE#288]) +21 other tests skip
   [141]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm.html

  * igt@xe_exec_fault_mode@many-userptr-invalidate-race:
    - shard-adlp:         NOTRUN -> [SKIP][142] ([Intel XE#288]) +4 other tests skip
   [142]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-9/igt@xe_exec_fault_mode@many-userptr-invalidate-race.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch:
    - shard-adlp:         NOTRUN -> [SKIP][143] ([Intel XE#4945]) +1 other test skip
   [143]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:
    - shard-dg2-set2:     NOTRUN -> [SKIP][144] ([Intel XE#2360])
   [144]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence.html

  * igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:
    - shard-bmg:          NOTRUN -> [SKIP][145] ([Intel XE#4837]) +3 other tests skip
   [145]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-1/igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy.html

  * igt@xe_exec_system_allocator@process-many-large-mmap-huge-nomemset:
    - shard-bmg:          NOTRUN -> [SKIP][146] ([Intel XE#4943]) +6 other tests skip
   [146]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-3/igt@xe_exec_system_allocator@process-many-large-mmap-huge-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset:
    - shard-lnl:          [PASS][147] -> [FAIL][148] ([Intel XE#5018])
   [147]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-5/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html
   [148]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset:
    - shard-dg2-set2:     NOTRUN -> [SKIP][149] ([Intel XE#4915]) +213 other tests skip
   [149]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge:
    - shard-lnl:          NOTRUN -> [SKIP][150] ([Intel XE#4943]) +4 other tests skip
   [150]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge.html

  * igt@xe_exec_system_allocator@twice-mmap:
    - shard-adlp:         NOTRUN -> [SKIP][151] ([Intel XE#4915]) +41 other tests skip
   [151]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-9/igt@xe_exec_system_allocator@twice-mmap.html

  * igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:
    - shard-dg2-set2:     NOTRUN -> [ABORT][152] ([Intel XE#4917])
   [152]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
    - shard-lnl:          NOTRUN -> [ABORT][153] ([Intel XE#4917])
   [153]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
    - shard-adlp:         NOTRUN -> [ABORT][154] ([Intel XE#4917])
   [154]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-2/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html
    - shard-bmg:          NOTRUN -> [ABORT][155] ([Intel XE#4917])
   [155]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - shard-dg2-set2:     NOTRUN -> [SKIP][156] ([Intel XE#2229])
   [156]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  * igt@xe_noexec_ping_pong:
    - shard-adlp:         NOTRUN -> [SKIP][157] ([Intel XE#379])
   [157]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-4/igt@xe_noexec_ping_pong.html
    - shard-lnl:          NOTRUN -> [SKIP][158] ([Intel XE#379])
   [158]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-6/igt@xe_noexec_ping_pong.html

  * igt@xe_oa@invalid-oa-exponent:
    - shard-adlp:         NOTRUN -> [SKIP][159] ([Intel XE#2541] / [Intel XE#3573]) +1 other test skip
   [159]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@xe_oa@invalid-oa-exponent.html

  * igt@xe_oa@mi-rpc:
    - shard-dg2-set2:     NOTRUN -> [SKIP][160] ([Intel XE#2541] / [Intel XE#3573]) +4 other tests skip
   [160]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@xe_oa@mi-rpc.html

  * igt@xe_oa@syncs-ufence-wait-cfg:
    - shard-dg2-set2:     NOTRUN -> [SKIP][161] ([Intel XE#2541] / [Intel XE#3573] / [Intel XE#4501])
   [161]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/igt@xe_oa@syncs-ufence-wait-cfg.html

  * igt@xe_pm@d3cold-mocs:
    - shard-dg2-set2:     NOTRUN -> [SKIP][162] ([Intel XE#2284])
   [162]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@xe_pm@d3cold-mocs.html

  * igt@xe_pm@s2idle-basic:
    - shard-adlp:         [PASS][163] -> [DMESG-WARN][164] ([Intel XE#2953] / [Intel XE#4173])
   [163]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@xe_pm@s2idle-basic.html
   [164]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-8/igt@xe_pm@s2idle-basic.html

  * igt@xe_pm@s3-d3cold-basic-exec:
    - shard-adlp:         NOTRUN -> [SKIP][165] ([Intel XE#2284] / [Intel XE#366])
   [165]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-3/igt@xe_pm@s3-d3cold-basic-exec.html
    - shard-bmg:          NOTRUN -> [SKIP][166] ([Intel XE#2284])
   [166]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@xe_pm@s3-d3cold-basic-exec.html
    - shard-dg2-set2:     NOTRUN -> [SKIP][167] ([Intel XE#2284] / [Intel XE#366])
   [167]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.html
    - shard-lnl:          NOTRUN -> [SKIP][168] ([Intel XE#2284] / [Intel XE#366])
   [168]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-4/igt@xe_pm@s3-d3cold-basic-exec.html

  * igt@xe_pm@s3-multiple-execs:
    - shard-lnl:          NOTRUN -> [SKIP][169] ([Intel XE#584])
   [169]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-3/igt@xe_pm@s3-multiple-execs.html

  * igt@xe_pxp@pxp-stale-queue-post-termination-irq:
    - shard-dg2-set2:     NOTRUN -> [SKIP][170] ([Intel XE#4733])
   [170]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@xe_pxp@pxp-stale-queue-post-termination-irq.html

  * igt@xe_query@multigpu-query-oa-units:
    - shard-dg2-set2:     NOTRUN -> [SKIP][171] ([Intel XE#944]) +1 other test skip
   [171]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-433/igt@xe_query@multigpu-query-oa-units.html

  * igt@xe_query@multigpu-query-pxp-status:
    - shard-lnl:          NOTRUN -> [SKIP][172] ([Intel XE#944])
   [172]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-1/igt@xe_query@multigpu-query-pxp-status.html
    - shard-adlp:         NOTRUN -> [SKIP][173] ([Intel XE#944])
   [173]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-9/igt@xe_query@multigpu-query-pxp-status.html
    - shard-bmg:          NOTRUN -> [SKIP][174] ([Intel XE#944])
   [174]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-5/igt@xe_query@multigpu-query-pxp-status.html

  * igt@xe_render_copy@render-stress-2-copies:
    - shard-dg2-set2:     NOTRUN -> [SKIP][175] ([Intel XE#4814])
   [175]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-435/igt@xe_render_copy@render-stress-2-copies.html

  * igt@xe_spin_batch@spin-mem-copy:
    - shard-dg2-set2:     NOTRUN -> [SKIP][176] ([Intel XE#4821])
   [176]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-435/igt@xe_spin_batch@spin-mem-copy.html

  * igt@xe_vm@large-misaligned-binds-2147483648:
    - shard-adlp:         [PASS][177] -> [SKIP][178] ([Intel XE#4945]) +9 other tests skip
   [177]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-6/igt@xe_vm@large-misaligned-binds-2147483648.html
   [178]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@xe_vm@large-misaligned-binds-2147483648.html

  
#### Possible fixes ####

  * igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1:
    - shard-lnl:          [FAIL][179] ([Intel XE#911]) -> [PASS][180] +3 other tests pass
   [179]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-1/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html
   [180]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html

  * igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:
    - shard-adlp:         [DMESG-FAIL][181] ([Intel XE#4543]) -> [PASS][182] +11 other tests pass
   [181]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-4/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html
   [182]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:
    - shard-bmg:          [SKIP][183] ([Intel XE#2314] / [Intel XE#2894]) -> [PASS][184] +1 other test pass
   [183]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-5/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html
   [184]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][185] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [PASS][186] +1 other test pass
   [185]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-435/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html
   [186]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:
    - shard-dg2-set2:     [INCOMPLETE][187] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4522]) -> [PASS][188]
   [187]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html
   [188]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html

  * igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:
    - shard-bmg:          [SKIP][189] ([Intel XE#2291]) -> [PASS][190] +5 other tests pass
   [189]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-5/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html
   [190]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-3/igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html

  * igt@kms_cursor_legacy@flip-vs-cursor-legacy:
    - shard-bmg:          [FAIL][191] ([Intel XE#4633]) -> [PASS][192]
   [191]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html
   [192]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-5/igt@kms_cursor_legacy@flip-vs-cursor-legacy.html

  * igt@kms_flip@2x-plain-flip-fb-recreate:
    - shard-bmg:          [SKIP][193] ([Intel XE#2316]) -> [PASS][194] +9 other tests pass
   [193]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-5/igt@kms_flip@2x-plain-flip-fb-recreate.html
   [194]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_flip@2x-plain-flip-fb-recreate.html

  * igt@kms_flip@flip-vs-expired-vblank@c-edp1:
    - shard-lnl:          [FAIL][195] ([Intel XE#301] / [Intel XE#3149]) -> [PASS][196] +1 other test pass
   [195]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-8/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html
   [196]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html

  * igt@kms_flip@flip-vs-suspend:
    - shard-dg2-set2:     [SKIP][197] ([Intel XE#4208] / [i915#2575]) -> [PASS][198] +1 other test pass
   [197]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_flip@flip-vs-suspend.html
   [198]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@kms_flip@flip-vs-suspend.html

  * igt@kms_flip@flip-vs-suspend-interruptible:
    - shard-adlp:         [DMESG-WARN][199] ([Intel XE#4543]) -> [PASS][200] +20 other tests pass
   [199]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_flip@flip-vs-suspend-interruptible.html
   [200]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-4/igt@kms_flip@flip-vs-suspend-interruptible.html
    - shard-bmg:          [INCOMPLETE][201] ([Intel XE#2049] / [Intel XE#2597]) -> [PASS][202] +1 other test pass
   [201]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-3/igt@kms_flip@flip-vs-suspend-interruptible.html
   [202]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html

  * igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:
    - shard-adlp:         [DMESG-FAIL][203] ([Intel XE#4543] / [Intel XE#4921]) -> [PASS][204] +1 other test pass
   [203]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html
   [204]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html

  * igt@kms_joiner@invalid-modeset-force-big-joiner:
    - shard-bmg:          [SKIP][205] ([Intel XE#3012]) -> [PASS][206] +1 other test pass
   [205]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-5/igt@kms_joiner@invalid-modeset-force-big-joiner.html
   [206]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-3/igt@kms_joiner@invalid-modeset-force-big-joiner.html

  * igt@kms_plane_cursor@viewport:
    - shard-dg2-set2:     [FAIL][207] ([Intel XE#616]) -> [PASS][208] +1 other test pass
   [207]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_plane_cursor@viewport.html
   [208]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/igt@kms_plane_cursor@viewport.html

  * igt@kms_plane_multiple@2x-tiling-4:
    - shard-bmg:          [SKIP][209] ([Intel XE#4596]) -> [PASS][210] +2 other tests pass
   [209]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-5/igt@kms_plane_multiple@2x-tiling-4.html
   [210]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-4.html

  * igt@kms_pm_dc@dc6-dpms:
    - shard-lnl:          [FAIL][211] ([Intel XE#718]) -> [PASS][212] +1 other test pass
   [211]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-3/igt@kms_pm_dc@dc6-dpms.html
   [212]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:
    - shard-adlp:         [DMESG-WARN][213] ([Intel XE#2953] / [Intel XE#4173]) -> [PASS][214] +2 other tests pass
   [213]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html
   [214]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-180.html

  * igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:
    - shard-lnl:          [FAIL][215] ([Intel XE#2142]) -> [PASS][216] +1 other test pass
   [215]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-2/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html
   [216]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html

  * igt@xe_exec_basic@multigpu-once-null-defer-mmap:
    - shard-dg2-set2:     [SKIP][217] ([Intel XE#1392]) -> [PASS][218] +2 other tests pass
   [217]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-432/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html
   [218]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html

  * igt@xe_exec_reset@parallel-gt-reset:
    - shard-dg2-set2:     [DMESG-WARN][219] ([Intel XE#3876]) -> [PASS][220]
   [219]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-435/igt@xe_exec_reset@parallel-gt-reset.html
   [220]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/igt@xe_exec_reset@parallel-gt-reset.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map:
    - shard-lnl:          [FAIL][221] -> [PASS][222]
   [221]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-4/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html
   [222]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset:
    - shard-lnl:          [FAIL][223] ([Intel XE#4937] / [Intel XE#5018]) -> [PASS][224]
   [223]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-2/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html
   [224]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html

  * igt@xe_vm@large-misaligned-binds-2097152:
    - shard-dg2-set2:     [SKIP][225] ([Intel XE#4208]) -> [PASS][226] +7 other tests pass
   [225]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@xe_vm@large-misaligned-binds-2097152.html
   [226]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-435/igt@xe_vm@large-misaligned-binds-2097152.html

  
#### Warnings ####

  * igt@kms_big_fb@4-tiled-16bpp-rotate-270:
    - shard-adlp:         [SKIP][227] ([Intel XE#1124]) -> [SKIP][228] ([Intel XE#2351] / [Intel XE#4947])
   [227]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html
   [228]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_big_fb@4-tiled-16bpp-rotate-270.html

  * igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:
    - shard-adlp:         [SKIP][229] ([Intel XE#1124]) -> [SKIP][230] ([Intel XE#4947])
   [229]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-2/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html
   [230]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html

  * igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:
    - shard-adlp:         [SKIP][231] ([Intel XE#2191]) -> [SKIP][232] ([Intel XE#4950])
   [231]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html
   [232]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html

  * igt@kms_bw@linear-tiling-1-displays-2560x1440p:
    - shard-adlp:         [SKIP][233] ([Intel XE#367]) -> [SKIP][234] ([Intel XE#4950])
   [233]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-4/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html
   [234]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_bw@linear-tiling-1-displays-2560x1440p.html

  * igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         [SKIP][235] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][236] ([Intel XE#4947])
   [235]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-2/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html
   [236]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:
    - shard-adlp:         [SKIP][237] ([Intel XE#455] / [Intel XE#787]) -> [SKIP][238] ([Intel XE#2351] / [Intel XE#4947])
   [237]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-3/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html
   [238]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html

  * igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:
    - shard-dg2-set2:     [SKIP][239] ([Intel XE#4208]) -> [SKIP][240] ([Intel XE#455] / [Intel XE#787])
   [239]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html
   [240]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html

  * igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:
    - shard-dg2-set2:     [INCOMPLETE][241] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#4212] / [Intel XE#4345] / [Intel XE#4522]) -> [INCOMPLETE][242] ([Intel XE#1727] / [Intel XE#3113] / [Intel XE#3124] / [Intel XE#4345])
   [241]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-433/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html
   [242]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs.html

  * igt@kms_chamelium_frames@hdmi-aspect-ratio:
    - shard-dg2-set2:     [SKIP][243] ([Intel XE#4208] / [i915#2575]) -> [SKIP][244] ([Intel XE#373])
   [243]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_chamelium_frames@hdmi-aspect-ratio.html
   [244]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/igt@kms_chamelium_frames@hdmi-aspect-ratio.html

  * igt@kms_chamelium_frames@hdmi-crc-multiple:
    - shard-adlp:         [SKIP][245] ([Intel XE#373]) -> [SKIP][246] ([Intel XE#4950]) +1 other test skip
   [245]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-8/igt@kms_chamelium_frames@hdmi-crc-multiple.html
   [246]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_chamelium_frames@hdmi-crc-multiple.html

  * igt@kms_content_protection@atomic:
    - shard-adlp:         [SKIP][247] ([Intel XE#455]) -> [SKIP][248] ([Intel XE#4950]) +1 other test skip
   [247]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_content_protection@atomic.html
   [248]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_content_protection@atomic.html

  * igt@kms_content_protection@atomic-dpms:
    - shard-bmg:          [FAIL][249] ([Intel XE#1178]) -> [SKIP][250] ([Intel XE#2341])
   [249]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-2/igt@kms_content_protection@atomic-dpms.html
   [250]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@kms_content_protection@atomic-dpms.html

  * igt@kms_content_protection@dp-mst-lic-type-1:
    - shard-dg2-set2:     [SKIP][251] ([Intel XE#4208] / [i915#2575]) -> [SKIP][252] ([Intel XE#307])
   [251]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_content_protection@dp-mst-lic-type-1.html
   [252]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html

  * igt@kms_content_protection@legacy:
    - shard-bmg:          [SKIP][253] ([Intel XE#2341]) -> [FAIL][254] ([Intel XE#1178]) +2 other tests fail
   [253]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-5/igt@kms_content_protection@legacy.html
   [254]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_content_protection@legacy.html

  * igt@kms_cursor_crc@cursor-rapid-movement-512x512:
    - shard-adlp:         [SKIP][255] ([Intel XE#308]) -> [SKIP][256] ([Intel XE#4950])
   [255]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html
   [256]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html

  * igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size:
    - shard-adlp:         [SKIP][257] ([Intel XE#323]) -> [SKIP][258] ([Intel XE#4950])
   [257]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-6/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html
   [258]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.html

  * igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:
    - shard-bmg:          [FAIL][259] ([Intel XE#886]) -> [SKIP][260] ([Intel XE#2316])
   [259]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-4/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html
   [260]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html

  * igt@kms_flip@2x-flip-vs-suspend:
    - shard-adlp:         [SKIP][261] ([Intel XE#310]) -> [SKIP][262] ([Intel XE#4950])
   [261]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_flip@2x-flip-vs-suspend.html
   [262]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_flip@2x-flip-vs-suspend.html

  * igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:
    - shard-dg2-set2:     [SKIP][263] ([Intel XE#4208]) -> [SKIP][264] ([Intel XE#455])
   [263]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html
   [264]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:
    - shard-bmg:          [SKIP][265] ([Intel XE#2312]) -> [SKIP][266] ([Intel XE#2311]) +16 other tests skip
   [265]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html
   [266]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:
    - shard-bmg:          [SKIP][267] ([Intel XE#2311]) -> [SKIP][268] ([Intel XE#2312]) +14 other tests skip
   [267]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-4/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html
   [268]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html

  * igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:
    - shard-dg2-set2:     [SKIP][269] ([Intel XE#4208]) -> [SKIP][270] ([Intel XE#651]) +1 other test skip
   [269]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html
   [270]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:
    - shard-bmg:          [SKIP][271] ([Intel XE#2312]) -> [SKIP][272] ([Intel XE#4141]) +13 other tests skip
   [271]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html
   [272]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html

  * igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:
    - shard-bmg:          [SKIP][273] ([Intel XE#4141]) -> [SKIP][274] ([Intel XE#2312]) +11 other tests skip
   [273]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-2/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html
   [274]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html

  * igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:
    - shard-adlp:         [SKIP][275] ([Intel XE#651]) -> [SKIP][276] ([Intel XE#4947]) +1 other test skip
   [275]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html
   [276]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][277] ([Intel XE#2313]) -> [SKIP][278] ([Intel XE#2312]) +20 other tests skip
   [277]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html
   [278]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:
    - shard-adlp:         [SKIP][279] ([Intel XE#656]) -> [SKIP][280] ([Intel XE#4947]) +1 other test skip
   [279]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-8/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html
   [280]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:
    - shard-adlp:         [SKIP][281] ([Intel XE#653]) -> [SKIP][282] ([Intel XE#4947]) +1 other test skip
   [281]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-4/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html
   [282]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html

  * igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:
    - shard-adlp:         [SKIP][283] ([Intel XE#1151]) -> [SKIP][284] ([Intel XE#4947])
   [283]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-2/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html
   [284]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html

  * igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:
    - shard-dg2-set2:     [SKIP][285] ([Intel XE#4208]) -> [SKIP][286] ([Intel XE#653]) +1 other test skip
   [285]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html
   [286]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html

  * igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:
    - shard-bmg:          [SKIP][287] ([Intel XE#2312]) -> [SKIP][288] ([Intel XE#2313]) +16 other tests skip
   [287]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-6/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html
   [288]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html

  * igt@kms_plane_multiple@2x-tiling-y:
    - shard-bmg:          [SKIP][289] ([Intel XE#5021]) -> [SKIP][290] ([Intel XE#4596])
   [289]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-7/igt@kms_plane_multiple@2x-tiling-y.html
   [290]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@kms_plane_multiple@2x-tiling-y.html

  * igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:
    - shard-adlp:         [SKIP][291] ([Intel XE#836]) -> [SKIP][292] ([Intel XE#4962])
   [291]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html
   [292]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_pm_rpm@dpms-mode-unset-non-lpsp.html

  * igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:
    - shard-adlp:         [SKIP][293] ([Intel XE#1489]) -> [SKIP][294] ([Intel XE#4947])
   [293]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-6/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html
   [294]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html

  * igt@kms_psr@pr-primary-blt:
    - shard-adlp:         [SKIP][295] ([Intel XE#2850] / [Intel XE#929]) -> [SKIP][296] ([Intel XE#4947])
   [295]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-4/igt@kms_psr@pr-primary-blt.html
   [296]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_psr@pr-primary-blt.html

  * igt@kms_psr@psr2-basic:
    - shard-dg2-set2:     [SKIP][297] ([Intel XE#4208]) -> [SKIP][298] ([Intel XE#2850] / [Intel XE#929]) +1 other test skip
   [297]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_psr@psr2-basic.html
   [298]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@kms_psr@psr2-basic.html

  * igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:
    - shard-dg2-set2:     [SKIP][299] ([Intel XE#4208] / [i915#2575]) -> [SKIP][300] ([Intel XE#1127])
   [299]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html
   [300]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html

  * igt@xe_ccs@ctrl-surf-copy:
    - shard-adlp:         [SKIP][301] ([Intel XE#455] / [Intel XE#488]) -> [SKIP][302] ([Intel XE#4945])
   [301]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-3/igt@xe_ccs@ctrl-surf-copy.html
   [302]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_eudebug@basic-vm-bind-discovery:
    - shard-adlp:         [SKIP][303] ([Intel XE#4837]) -> [SKIP][304] ([Intel XE#4945])
   [303]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@xe_eudebug@basic-vm-bind-discovery.html
   [304]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@xe_eudebug@basic-vm-bind-discovery.html

  * igt@xe_evict@evict-small-external:
    - shard-adlp:         [SKIP][305] ([Intel XE#261] / [Intel XE#688]) -> [SKIP][306] ([Intel XE#4945])
   [305]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-8/igt@xe_evict@evict-small-external.html
   [306]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@xe_evict@evict-small-external.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:
    - shard-adlp:         [SKIP][307] ([Intel XE#1392]) -> [SKIP][308] ([Intel XE#4945]) +1 other test skip
   [307]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-2/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html
   [308]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html

  * igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:
    - shard-dg2-set2:     [SKIP][309] ([Intel XE#4208]) -> [SKIP][310] ([Intel XE#288])
   [309]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html
   [310]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html

  * igt@xe_exec_fault_mode@many-bindexecqueue-rebind:
    - shard-adlp:         [SKIP][311] ([Intel XE#288]) -> [SKIP][312] ([Intel XE#4945])
   [311]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-4/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html
   [312]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html

  * igt@xe_exec_mix_modes@exec-simple-batch-store-lr:
    - shard-dg2-set2:     [SKIP][313] ([Intel XE#4208]) -> [SKIP][314] ([Intel XE#2360])
   [313]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html
   [314]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html

  * igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge:
    - shard-dg2-set2:     [SKIP][315] ([Intel XE#4208]) -> [SKIP][316] ([Intel XE#4915]) +12 other tests skip
   [315]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge.html
   [316]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge.html

  * igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset:
    - shard-adlp:         [SKIP][317] ([Intel XE#4915]) -> [SKIP][318] ([Intel XE#4945]) +13 other tests skip
   [317]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset.html
   [318]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset.html

  * igt@xe_oa@oa-unit-concurrent-oa-buffer-read:
    - shard-dg2-set2:     [SKIP][319] ([Intel XE#4208]) -> [SKIP][320] ([Intel XE#2541] / [Intel XE#3573])
   [319]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html
   [320]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html

  * igt@xe_pxp@pxp-stale-bo-exec-post-suspend:
    - shard-adlp:         [SKIP][321] ([Intel XE#4733]) -> [SKIP][322] ([Intel XE#4945])
   [321]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-4/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html
   [322]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@xe_pxp@pxp-stale-bo-exec-post-suspend.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#1124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124
  [Intel XE#1126]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1126
  [Intel XE#1127]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1127
  [Intel XE#1151]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1151
  [Intel XE#1158]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1158
  [Intel XE#1178]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1178
  [Intel XE#1188]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1188
  [Intel XE#1392]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392
  [Intel XE#1401]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401
  [Intel XE#1406]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1406
  [Intel XE#1407]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1407
  [Intel XE#1421]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1421
  [Intel XE#1424]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1424
  [Intel XE#1435]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1435
  [Intel XE#1439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1439
  [Intel XE#1489]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1489
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#1745]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745
  [Intel XE#1874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1874
  [Intel XE#2049]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2049
  [Intel XE#2142]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2142
  [Intel XE#2191]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2191
  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2234]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2234
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
  [Intel XE#2351]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2351
  [Intel XE#2360]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360
  [Intel XE#2380]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380
  [Intel XE#2390]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2390
  [Intel XE#2541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541
  [Intel XE#2597]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597
  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#2652]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2652
  [Intel XE#2669]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2669
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#2850]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2850
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2887]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2887
  [Intel XE#2893]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2893
  [Intel XE#2894]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894
  [Intel XE#2907]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2907
  [Intel XE#2938]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2938
  [Intel XE#2953]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2953
  [Intel XE#301]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/301
  [Intel XE#3012]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3012
  [Intel XE#306]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/306
  [Intel XE#307]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/307
  [Intel XE#308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/308
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#3098]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3098
  [Intel XE#310]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/310
  [Intel XE#3113]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113
  [Intel XE#3124]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124
  [Intel XE#3141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3141
  [Intel XE#3149]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3149
  [Intel XE#316]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/316
  [Intel XE#323]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/323
  [Intel XE#3278]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3278
  [Intel XE#3414]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3414
  [Intel XE#3433]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3433
  [Intel XE#3442]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3442
  [Intel XE#346]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/346
  [Intel XE#3573]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573
  [Intel XE#366]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/366
  [Intel XE#367]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/367
  [Intel XE#373]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/373
  [Intel XE#379]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/379
  [Intel XE#3862]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862
  [Intel XE#3876]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3876
  [Intel XE#4141]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141
  [Intel XE#4173]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173
  [Intel XE#4208]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208
  [Intel XE#4212]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4212
  [Intel XE#4302]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4302
  [Intel XE#4345]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4345
  [Intel XE#4356]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4356
  [Intel XE#4416]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4416
  [Intel XE#4417]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4417
  [Intel XE#4459]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4459
  [Intel XE#4501]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4501
  [Intel XE#4518]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4518
  [Intel XE#4522]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4522
  [Intel XE#4543]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#4596]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4596
  [Intel XE#4608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4608
  [Intel XE#4633]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4633
  [Intel XE#4733]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4733
  [Intel XE#4814]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4814
  [Intel XE#4821]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4821
  [Intel XE#4837]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4837
  [Intel XE#488]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/488
  [Intel XE#4915]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915
  [Intel XE#4917]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4917
  [Intel XE#4921]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921
  [Intel XE#4937]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937
  [Intel XE#4943]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4943
  [Intel XE#4945]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945
  [Intel XE#4947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947
  [Intel XE#4950]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950
  [Intel XE#4962]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4962
  [Intel XE#5018]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5018
  [Intel XE#5021]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5021
  [Intel XE#5300]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5300
  [Intel XE#5308]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5308
  [Intel XE#5338]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338
  [Intel XE#584]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/584
  [Intel XE#607]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/607
  [Intel XE#610]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/610
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#619]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/619
  [Intel XE#651]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/651
  [Intel XE#653]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/653
  [Intel XE#656]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/656
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#718]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/718
  [Intel XE#787]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/787
  [Intel XE#836]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/836
  [Intel XE#886]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/886
  [Intel XE#908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/908
  [Intel XE#911]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/911
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#944]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/944
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575


Build changes
-------------

  * IGT: IGT_8429 -> IGT_8430
  * Linux: xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e -> xe-pw-150845v1

  IGT_8429: 8429
  IGT_8430: 4351ec818f4bd363ad0594a008d11ba3963e1f05 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e: d4161d829aaed27ce21671cc3c7acbef8ae55a4e
  xe-pw-150845v1: 150845v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/index.html

--===============4638389015813119306==
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
<tr><td><b>Series:</b></td><td>drm/xe: Normalize default param values</td><=
/tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/150845/">https://patchwork.freedesktop.org/series/150845/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-150845v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-150845v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3316-d4161d829aaed27ce21671cc3c7acbef8=
ae55a4e_FULL -&gt; xe-pw-150845v1_FULL</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-150845v1_FULL absolutely need =
to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br=
 />
  introduced in xe-pw-150845v1_FULL, please notify your bug team (I915-ci-i=
nfra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in C=
I.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-1508=
45v1_FULL:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@kms_flip@2x-absolute-wf_vblank@bc-dp2-hdmi-a3:<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-1/igt@kms_flip=
@2x-absolute-wf_vblank@bc-dp2-hdmi-a3.html">PASS</a> -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-4/igt@kms_fli=
p@2x-absolute-wf_vblank@bc-dp2-hdmi-a3.html">FAIL</a> +2 other tests fail</=
li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-3316-d4161d829aaed27ce21671cc3=
c7acbef8ae55a4e_FULL and xe-pw-150845v1_FULL:</p>
<h3>New IGT tests (62)</h3>
<ul>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-3-4-rc-ccs-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-3-4-rc-ccs-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-3-4-rc-ccs-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-3-4-rc-ccs-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-3-4-rc-ccs-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-3-4-rc-ccs-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-4-rc-ccs-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-4-rc-ccs-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-4-rc-ccs-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.12] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-4-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-4-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-4-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-4-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-4-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-4-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-4-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-4-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-4-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-linear-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.13] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-linear-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-linear-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-linear-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-linear-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-linear-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-linear-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-linear-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-linear-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-x-rgb565:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.11] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-x-xrgb16161616f:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-x-xrgb2101010:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-x-xrgb8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-x-xv30:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-x-xv36:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-x-xyuv8888:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-x-y210:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_async_flips@basic-modeset-with-all-modifiers-formats@pipe-a-hdmi=
-a-6-x-yuyv:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.03] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.72] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.55] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-blue-to-red@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.70] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.54] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@ctm-red-to-blue@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.56] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-a-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.74] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.53] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-b-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-c-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-dp-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@degamma@pipe-d-hdmi-a-2:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-a-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.76] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-b-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-dp-4:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-c-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.49] s</li>
</ul>
</li>
<li>
<p>igt@kms_color@legacy-gamma@pipe-d-hdmi-a-6:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.51] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.50] s</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-alpha-transparent@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.43] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [1.09] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.97] s</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-d-hdmi-a-3:</p>
<ul>
<li>Statuses : 1 pass(s)</li>
<li>Exec time: [0.98] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-150845v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1=
:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-2/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear@pipe-c-edp-1.html">PASS</a>=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/=
shard-lnl-3/igt@kms_async_flips@async-flip-with-page-flip-events-linear@pip=
e-c-edp-1.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/911">Intel XE#911</a>) +3 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-9/igt@kms_big_fb@4-tiled-16bpp-rot=
ate-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@4-tiled-32bpp-rotate-270:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_big_fb@4-tiled-32bpp-ro=
tate-270.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/316">Intel XE#316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_big=
_fb@x-tiled-8bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"https://intel-gfx=
-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-8/igt@kms_big_fb@x-tiled=
-8bpp-rotate-0.html">DMESG-FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +9 other tests dmesg-fail=
</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-8bpp-rotate-90:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-3/igt@kms_big_fb@x-tiled-8bpp-rota=
te-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/316">Intel XE#316</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@kms_big_fb@x-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/1407">Intel XE#1407</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_big_fb@x-tiled-8bpp-rotat=
e-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2327">Intel XE#2327</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip:<=
/p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-6/igt@kms_big=
_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-async-flip.html">PASS</a> =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/s=
hard-adlp-1/igt@kms_big_fb@x-tiled-max-hw-stride-32bpp-rotate-180-hflip-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-16bpp-rotate-180:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-8/igt@kms_big_fb@y-tiled-16bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +2 other tests skip</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/igt@kms_big_fb@y-tiled-16bpp-ro=
tate-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/1124">Intel XE#1124</a>) +6 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-7/igt@kms_big_fb@y-tiled-16bpp-rota=
te-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/1124">Intel XE#1124</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-addfb-size-offset-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@kms_big_fb@y-tiled-addfb-si=
ze-offset-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/607">Intel XE#607</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-1/igt@kms_big=
_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-9/igt@kms=
_big_fb@y-tiled-max-hw-stride-64bpp-rotate-0.html">FAIL</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/1874">Intel XE#1874</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_big_fb@yf-tiled-addfb.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/619">Intel XE#619</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-addfb-size-overflow:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-433/igt@kms_big_fb@yf-tiled-addfb-s=
ize-overflow.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/610">Intel XE#610</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-3840x2160p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-7/igt@kms_bw@c=
onnected-linear-tiling-2-displays-3840x2160p.html">PASS</a> -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/ig=
t@kms_bw@connected-linear-tiling-2-displays-3840x2160p.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2=
314</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/28=
94">Intel XE#2894</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-3-displays-3840x2160p:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_bw@linear-tiling-3-disp=
lays-3840x2160p.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/367">Intel XE#367</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-aux-stride-y-tiled-gen12-mc-ccs@pipe-c-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@kms_ccs@bad-aux-stride-y-ti=
led-gen12-mc-ccs@pipe-c-hdmi-a-6.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +181 other test=
s skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-y-tiled-gen12-mc-ccs:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-4/igt@kms_ccs@bad-pixel-format-y-ti=
led-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/2887">Intel XE#2887</a>) +4 other tests skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@kms_ccs@bad-pixel-format-y-t=
iled-gen12-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +3 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@kms_ccs@crc-primary-rotatio=
n-180-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2907">Intel XE#2907</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-6/igt@kms_ccs@crc-primary-rotation-=
180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2887">Intel XE#2887</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_ccs@crc-primary-suspend-=
4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-435/igt@kms_ccs@crc-primary-suspend=
-4-tiled-bmg-ccs.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/3442">Intel XE#3442</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-bmg-ccs@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-5/igt@kms_ccs@crc-primary-suspend-4=
-tiled-bmg-ccs@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/2669">Intel XE#2669</a> / <a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/3433">Intel XE#3433</a>) +3 o=
ther tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-464/igt@kms_cc=
s@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">PASS</a> -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-463/igt@km=
s_ccs@crc-primary-suspend-4-tiled-dg2-mc-ccs.html">INCOMPLETE</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3862">Intel XE#3862=
</a>) +1 other test incomplete</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-suspend-4-tiled-lnl-ccs@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-2/igt@kms_ccs@crc-primary-suspend-4=
-tiled-lnl-ccs@pipe-a-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2652">Intel XE#2652</a> / <a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +11 oth=
er tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-sprite-planes-basic-4-tiled-mtl-rc-ccs@pipe-d-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@kms_ccs@crc-sprite-planes-b=
asic-4-tiled-mtl-rc-ccs@pipe-d-dp-2.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"=
https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) =
+37 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@missing-ccs-buffer-yf-tiled-ccs@pipe-b-hdmi-a-1:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-2/igt@kms_ccs@missing-ccs-buffer-y=
f-tiled-ccs@pipe-b-hdmi-a-1.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/787">Intel XE#787</a>) +5 other tests skip<=
/li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-d-hdmi-a-6:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-463/igt@kms_ccs@random-ccs-data-4-t=
iled-dg2-rc-ccs@pipe-d-hdmi-a-6.html">INCOMPLETE</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE#3113=
</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3124"=
>Intel XE#3124</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@mode-transition@pipe-d-dp-4:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/igt@kms_cdclk@mode-transition@p=
ipe-d-dp-4.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4417">Intel XE#4417</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cdclk@plane-scaling@pipe-b-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@kms_cdclk@plane-scaling@pip=
e-b-dp-2.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/4416">Intel XE#4416</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@ctm-blue-to-red:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-3/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/306">Intel XE#306</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_chamelium_color@ctm-blue=
-to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/306">Intel XE#306</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-2/igt@kms_chamelium_color@ctm-blue-=
to-red.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2325">Intel XE#2325</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_color@gamma:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@kms_chamelium_color@gamma.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/306">Intel XE#306</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_edid@dp-edid-change-during-hibernate:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-2/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2252">Intel XE#2252</a>) +2 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-7/igt@kms_chamelium_edid@dp-edid-ch=
ange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/373">Intel XE#373</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-8/igt@kms_chamelium_edid@dp-edid-c=
hange-during-hibernate.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/373">Intel XE#373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_hpd@hdmi-hpd:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/igt@kms_chamelium_hpd@hdmi-hpd.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/373">Intel XE#373</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@kms_content_protection@atom=
ic-dpms@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1178">Intel XE#1178</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@content-type-change:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@kms_content_protection@conte=
nt-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-4/igt@kms_content_protection@conten=
t-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-6/igt@kms_content_protection@conten=
t-type-change.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/3278">Intel XE#3278</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/2390">Intel XE#2390</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@kms_content_protection@dp-mst=
-lic-type-1.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/307">Intel XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@lic-type-0@pipe-a-dp-2:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-2/igt@kms_content_protection@lic-ty=
pe-0@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@uevent@pipe-a-dp-2:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@kms_content_protection@ueve=
nt@pipe-a-dp-2.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/1188">Intel XE#1188</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-offscreen-512x170:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@kms_cursor_crc@cursor-offsc=
reen-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/308">Intel XE#308</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-random-32x10:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-7/igt@kms_cursor_crc@cursor-random-=
32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/1424">Intel XE#1424</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_cursor_crc@cursor-random-=
32x10.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2320">Intel XE#2320</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-sliding-512x170:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-3/igt@kms_cursor_crc@cursor-sliding=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-2/igt@kms_cursor_crc@cursor-sliding=
-512x170.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/k=
ernel/issues/2321">Intel XE#2321</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-long-cursor-vs-flip-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-3/igt@kms_curs=
or_legacy@2x-long-cursor-vs-flip-legacy.html">PASS</a> -&gt; <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@kms_c=
ursor_legacy@2x-long-cursor-vs-flip-legacy.html">SKIP</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) +5 =
other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@cursora-vs-flipb-atomic-transitions-varying-size:<=
/p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-4/igt@kms_cursor_legacy@cursora-vs=
-flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other =
test skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@kms_cursor_legacy@cursora-vs-=
flipb-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a>) +1 other t=
est skip</li>
</ul>
</li>
<li>
<p>igt@kms_display_modes@extended-mode-basic:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-3/igt@kms_disp=
lay_modes@extended-mode-basic.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-5/igt@kms_display_mod=
es@extended-mode-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4302">Intel XE#4302</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_link_training@uhbr-sst:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@kms_dp_link_training@uhbr-s=
st.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/4356">Intel XE#4356</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dp_linktrain_fallback@dp-fallback:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_dp_linktrain_fallback@dp=
-fallback.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-panning-vs-hang:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@kms_flip@2x-flip-vs-panning-v=
s-hang.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/2316">Intel XE#2316</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-rmfb:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-6/igt@kms_flip@2x-flip-vs-rmfb.html=
">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
1421">Intel XE#1421</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@kms_flip@2x-flip-vs-rmfb.htm=
l">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/310">Intel XE#310</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-2/igt@kms_flip=
@2x-plain-flip-interruptible.html">PASS</a> -&gt; <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-5/igt@kms_flip@2x-plai=
n-flip-interruptible.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-wf_vblank-interruptible@a-dp2:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-4/igt@kms_flip=
@flip-vs-wf_vblank-interruptible@a-dp2.html">PASS</a> -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-4/igt@kms_fl=
ip@flip-vs-wf_vblank-interruptible@a-dp2.html">FAIL</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/3098">Intel XE#3098</a> / <a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5338">Intel XE#5=
338</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_flip@plain-flip-interruptible@b-hdmi-a1:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-4/igt@kms_fli=
p@plain-flip-interruptible@b-hdmi-a1.html">PASS</a> -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-4/igt@kms_fli=
p@plain-flip-interruptible@b-hdmi-a1.html">DMESG-WARN</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) +14=
 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE#1401</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1745">Intel XE#1745=
</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling@pi=
pe-a-default-mode:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-1/igt@kms_flip_scaled_crc@flip-32bp=
p-yftile-to-64bpp-yftile-downscaling@pipe-a-default-mode.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1401">Intel XE=
#1401</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-upscaling.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#2293</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2380">Intel XE#2380=
</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-ytileccs-to-64bpp-ytile-upscaling@pip=
e-a-valid-mode:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-3/igt@kms_flip_scaled_crc@flip-32bp=
p-ytileccs-to-64bpp-ytile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2293">Intel XE#22=
93</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-yftile-to-16bpp-yftile-upscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_flip_scaled_crc@flip-64=
bpp-yftile-to-16bpp-yftile-upscaling@pipe-a-valid-mode.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#45=
5</a>) +15 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe=
-a-valid-mode:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-3/igt@kms_fli=
p_scaled_crc@flip-64bpp-ytile-to-16bpp-ytile-downscaling@pipe-a-valid-mode.=
html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-150845v1/shard-adlp-4/igt@kms_flip_scaled_crc@flip-64bpp-ytile-to-16bp=
p-ytile-downscaling@pipe-a-valid-mode.html">DMESG-FAIL</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4921">Intel X=
E#4921</a>) +1 other test dmesg-fail</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-onoff:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-433/igt@kms_frontbuffer_tracking@dr=
rs-2p-primscrn-cur-indfb-onoff.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +28 other tests s=
kip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_frontbuffer_tracking@drr=
s-2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +5 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-shrfb-scaledprimary:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-8/igt@kms_frontbuffer_tracking@fbc-=
shrfb-scaledprimary.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4141">Intel XE#4141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-1p-primscrn-pri-shrfb-draw-mmap-wc:=
</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_frontbuffer_tracking@fbcd=
rrs-1p-primscrn-pri-shrfb-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311</a>) +5 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-rgb101010-draw-render:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-2/igt@kms_frontbuffer_tracking@fbc=
drrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-5/igt@kms_frontbuffer_tracking@fbcd=
rrs-rgb101010-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-mmap-wc:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-2/igt@kms_frontbuffer_tracking@fbcp=
sr-rgb565-draw-mmap-wc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/2313">Intel XE#2313</a>) +8 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@plane-fbc-rte:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_frontbuffer_tracking@pl=
ane-fbc-rte.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/1158">Intel XE#1158</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-1p-primscrn-shrfb-plflip-blt:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@kms_frontbuffer_tracking@psr=
-1p-primscrn-shrfb-plflip-blt.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) +4 other tests ski=
p</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-scndscrn-pri-indfb-draw-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-2/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#656</a>) +8 other tests=
 skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-5/igt@kms_frontbuffer_tracking@psr-=
2p-scndscrn-pri-indfb-draw-render.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312</a>) +4 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-slowdraw:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_frontbuffer_tracking@ps=
r-slowdraw.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/653">Intel XE#653</a>) +24 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@basic-big-joiner:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@kms_joiner@basic-big-joiner.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/346">Intel XE#346</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/346">Intel XE#346</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@kms_joiner@basic-big-joiner=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/346">Intel XE#346</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-4/igt@kms_joiner@basic-big-joiner.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/346">Intel XE#346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_backlight@brightness-with-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@kms_pm_backlight@brightness=
-with-dpms.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/2938">Intel XE#2938</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_pm_dc@dc6-dpms.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/908"=
>Intel XE#908</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@modeset-non-lpsp-stress-no-wait:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-8/igt@kms_pm_rpm@modeset-non-lpsp-=
stress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/836">Intel XE#836</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-7/igt@kms_pm_rpm@modeset-non-lpsp-s=
tress-no-wait.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/1439">Intel XE#1439</a> / <a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/3141">Intel XE#3141</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_properties@crtc-properties-atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_pro=
perties@crtc-properties-atomic.html">PASS</a> -&gt; <a href=3D"https://inte=
l-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_propertie=
s@crtc-properties-atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +8 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-move-continuous-exceed-sf:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-4/igt@kms_psr2_sf@fbc-psr2-overlay=
-plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other test=
 skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-move-continuous-exceed-sf.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/2893">Intel XE#2893</a> / <a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-continuous-sf:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@kms_psr2_sf@fbc-psr2-overla=
y-plane-update-continuous-sf.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +3 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-psr2-overlay-plane-update-sf-dmg-area@pipe-a-edp-1:<=
/p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-4/igt@kms_psr2_sf@fbc-psr2-overlay-=
plane-update-sf-dmg-area@pipe-a-edp-1.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4608">Intel XE#4608</a>) +3 other=
 tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@psr2-overlay-plane-move-continuous-exceed-fully-sf:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-8/igt@kms_psr2_sf@psr2-overlay-plan=
e-move-continuous-exceed-fully-sf.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) +1 other tes=
t skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-plane-move:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@kms_psr@fbc-pr-cursor-plane=
-move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/929">Intel XE#929</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@fbc-pr-cursor-render:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-5/igt@kms_psr@fbc-pr-cursor-render.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/1406">Intel XE#1406</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-sprite-plane-onoff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@kms_psr@psr-sprite-plane-ono=
ff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +3 other tests skip</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-4/igt@kms_psr@psr-sprite-plane-onof=
f.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/2234">Intel XE#2234</a> / <a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-primary-render:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_psr@psr2-primary-render.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2234">Intel XE#2234</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2330">Intel XE#2330</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@kms_rotation_crc@primary-y-ti=
led-reflect-x-0.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-433/igt@kms_rotation_crc@primary-y-=
tiled-reflect-x-180.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/1127">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-yf-tiled-reflect-x-90:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@kms_rotation_crc@primary-yf=
-tiled-reflect-x-90.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/3414">Intel XE#3414</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_setmode@invalid-clone-single-crtc:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-1/igt@kms_setm=
ode@invalid-clone-single-crtc.html">PASS</a> -&gt; <a href=3D"https://intel=
-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@kms_setmode@inv=
alid-clone-single-crtc.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/1435">Intel XE#1435</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@cmrr@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-6/igt@kms_vrr@=
cmrr@pipe-a-edp-1.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.o=
rg/tree/intel-xe/xe-pw-150845v1/shard-lnl-7/igt@kms_vrr@cmrr@pipe-a-edp-1.h=
tml">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/4459">Intel XE#4459</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@sriov_basic@enable-vfs-bind-unbind-each-numvfs-all:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@sriov_basic@enable-vfs-bind=
-unbind-each-numvfs-all.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_copy_basic@mem-set-linear-0x3fff:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-4/igt@xe_copy_basic@mem-set-linear=
-0x3fff.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/1126">Intel XE#1126</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eu_stall@invalid-event-report-count:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-435/igt@xe_eu_stall@invalid-event-r=
eport-count.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/5308">Intel XE#5308</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-ufence-delay-ack:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@xe_eudebug@basic-vm-bind-uf=
ence-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/4837">Intel XE#4837</a>) +12 other tests skip</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-6/igt@xe_eudebug@basic-vm-bind-ufen=
ce-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4837">Intel XE#4837</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-4/igt@xe_eudebug@basic-vm-bind-ufe=
nce-delay-ack.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/4837">Intel XE#4837</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug_sriov@deny-sriov:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@xe_eudebug_sriov@deny-sriov=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4518">Intel XE#4518</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-large-external-cm:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-6/igt@xe_evict@evict-large-external=
-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/688">Intel XE#688</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@xe_evict@evict-large-externa=
l-cm.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/261">Intel XE#261</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/688">Intel XE#688</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-rebind:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-5/igt@xe_exec_basic@multigpu-many-e=
xecqueues-many-vm-rebind.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2322">Intel XE#2322</a>) +2 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-basic-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-435/igt@xe_exe=
c_basic@multigpu-no-exec-basic-defer-mmap.html">PASS</a> -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@x=
e_exec_basic@multigpu-no-exec-basic-defer-mmap.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>)=
 +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-no-exec-null-defer-mmap:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@xe_exec_basic@multigpu-no-exe=
c-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org=
/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +1 other test skip</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-3/igt@xe_exec_basic@multigpu-no-ex=
ec-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/1392">Intel XE#1392</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-bindexecqueue-userptr-invalidate-race:</=
p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@xe_exec_basic@multigpu-once=
-bindexecqueue-userptr-invalidate-race.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) +2 othe=
r tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-userptr-rebind-imm:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@xe_exec_fault_mode@many-bin=
dexecqueue-userptr-rebind-imm.html">SKIP</a> (<a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +21 other tests sk=
ip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-userptr-invalidate-race:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-9/igt@xe_exec_fault_mode@many-user=
ptr-invalidate-race.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/288">Intel XE#288</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-prefetch:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@xe_exec_fault_mode@twice-bin=
dexecqueue-prefetch.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-dma-fence:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-463/igt@xe_exec_mix_modes@exec-simp=
le-batch-store-dma-fence.html">SKIP</a> (<a href=3D"https://gitlab.freedesk=
top.org/drm/xe/kernel/issues/2360">Intel XE#2360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_sip_eudebug@breakpoint-waitsip-heavy:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-1/igt@xe_exec_sip_eudebug@breakpoin=
t-waitsip-heavy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/4837">Intel XE#4837</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-large-mmap-huge-nomemset:</p>
<ul>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-3/igt@xe_exec_system_allocator@proc=
ess-many-large-mmap-huge-nomemset.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +6 other tes=
ts skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-execqueues-new=
-bo-map-nomemset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-5/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-execqueues-new-bo-map-nomemse=
t.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe=
/xe-pw-150845v1/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-=
many-large-execqueues-new-bo-map-nomemset.html">FAIL</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/5018">Intel XE#5018</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-shared-nomemset=
:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/igt@xe_exec_system_allocator@th=
reads-shared-vm-many-mmap-shared-nomemset.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Intel XE#4915</a>) +213=
 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-stride-mmap-huge:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@xe_exec_system_allocator@thre=
ads-shared-vm-many-stride-mmap-huge.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4943">Intel XE#4943</a>) +4 other t=
ests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@twice-mmap:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-9/igt@xe_exec_system_allocator@twi=
ce-mmap.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4915">Intel XE#4915</a>) +41 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_fault_injection@probe-fail-guc-xe_guc_ct_send_recv:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@xe_fault_injection@probe-fa=
il-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-7/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-2/igt@xe_fault_injection@probe-fai=
l-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@xe_fault_injection@probe-fail=
-guc-xe_guc_ct_send_recv.html">ABORT</a> (<a href=3D"https://gitlab.freedes=
ktop.org/drm/xe/kernel/issues/4917">Intel XE#4917</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@xe_live_ktest@xe_migrate@xe=
_validate_ccs_kunit.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_noexec_ping_pong:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-4/igt@xe_noexec_ping_pong.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/379"=
>Intel XE#379</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-6/igt@xe_noexec_ping_pong.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/379">=
Intel XE#379</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_oa@invalid-oa-exponent:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@xe_oa@invalid-oa-exponent.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/3573">Intel XE#3573</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@mi-rpc:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/igt@xe_oa@mi-rpc.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Inte=
l XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/3573">Intel XE#3573</a>) +4 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_oa@syncs-ufence-wait-cfg:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/igt@xe_oa@syncs-ufence-wait-cfg=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/2541">Intel XE#2541</a> / <a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/3573">Intel XE#3573</a> / <a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4501">Intel XE#4501</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@d3cold-mocs:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-436/igt@xe_pm@d3cold-mocs.html">SKI=
P</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2284"=
>Intel XE#2284</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s2idle-basic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@xe_pm@s=
2idle-basic.html">PASS</a> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-pw-150845v1/shard-adlp-8/igt@xe_pm@s2idle-basic.html">DMESG-W=
ARN</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/295=
3">Intel XE#2953</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/4173">Intel XE#4173</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-d3cold-basic-exec:</p>
<ul>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-3/igt@xe_pm@s3-d3cold-basic-exec.h=
tml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issu=
es/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@xe_pm@s3-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a>)</li>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/igt@xe_pm@s3-d3cold-basic-exec.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/366">Intel XE#366</a>)</li>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-4/igt@xe_pm@s3-d3cold-basic-exec.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/2284">Intel XE#2284</a> / <a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/366">Intel XE#366</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm@s3-multiple-execs:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-3/igt@xe_pm@s3-multiple-execs.html"=
>SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/5=
84">Intel XE#584</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-queue-post-termination-irq:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@xe_pxp@pxp-stale-queue-post=
-termination-irq.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4733">Intel XE#4733</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-oa-units:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-433/igt@xe_query@multigpu-query-oa-=
units.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-pxp-status:</p>
<ul>
<li>shard-lnl:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-lnl-1/igt@xe_query@multigpu-query-pxp-s=
tatus.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
<li>shard-adlp:         NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-9/igt@xe_query@multigpu-query-pxp-=
status.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ker=
nel/issues/944">Intel XE#944</a>)</li>
<li>shard-bmg:          NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-bmg-5/igt@xe_query@multigpu-query-pxp-s=
tatus.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/944">Intel XE#944</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_render_copy@render-stress-2-copies:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-435/igt@xe_render_copy@render-stres=
s-2-copies.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4814">Intel XE#4814</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_spin_batch@spin-mem-copy:</p>
<ul>
<li>shard-dg2-set2:     NOTRUN -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-dg2-435/igt@xe_spin_batch@spin-mem-copy=
.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/is=
sues/4821">Intel XE#4821</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-2147483648:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-6/igt@xe_vm@l=
arge-misaligned-binds-2147483648.html">PASS</a> -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@xe_vm@large=
-misaligned-binds-2147483648.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +9 other tests sk=
ip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_async_flips@async-flip-with-page-flip-events-linear-atomic@pipe-=
c-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-1/igt@kms_asyn=
c_flips@async-flip-with-page-flip-events-linear-atomic@pipe-c-edp-1.html">F=
AIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/911=
">Intel XE#911</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-pw-150845v1/shard-lnl-8/igt@kms_async_flips@async-flip-with-page-fli=
p-events-linear-atomic@pipe-c-edp-1.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-4/igt@kms_big=
_fb@y-tiled-max-hw-stride-32bpp-rotate-180-async-flip.html">DMESG-FAIL</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel=
 XE#4543</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-150845v1/shard-adlp-8/igt@kms_big_fb@y-tiled-max-hw-stride-32bpp-rotate=
-180-async-flip.html">PASS</a> +11 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-2560x1440p:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-5/igt@kms_bw@c=
onnected-linear-tiling-2-displays-2560x1440p.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2314">Intel XE#2314</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2894">Intel =
XE#2894</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-=
pw-150845v1/shard-bmg-4/igt@kms_bw@connected-linear-tiling-2-displays-2560x=
1440p.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-435/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
13">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-4=
33/igt@kms_ccs@random-ccs-data-4-tiled-dg2-mc-ccs@pipe-b-dp-4.html">PASS</a=
> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">INCOMPLETE</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1=
727</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/31=
13">Intel XE#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-463/igt@kms_ccs=
@random-ccs-data-4-tiled-dg2-rc-ccs@pipe-b-dp-4.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-5/igt@kms_curs=
or_legacy@2x-flip-vs-cursor-legacy.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2291">Intel XE#2291</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-3/=
igt@kms_cursor_legacy@2x-flip-vs-cursor-legacy.html">PASS</a> +5 other test=
s pass</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@flip-vs-cursor-legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-5/igt@kms_curs=
or_legacy@flip-vs-cursor-legacy.html">FAIL</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/4633">Intel XE#4633</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-5/ig=
t@kms_cursor_legacy@flip-vs-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-plain-flip-fb-recreate:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-5/igt@kms_flip=
@2x-plain-flip-fb-recreate.html">SKIP</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/2316">Intel XE#2316</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_=
flip@2x-plain-flip-fb-recreate.html">PASS</a> +9 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-expired-vblank@c-edp1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-8/igt@kms_flip=
@flip-vs-expired-vblank@c-edp1.html">FAIL</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/301">Intel XE#301</a> / <a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/3149">Intel XE#3149</a>) -&g=
t; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shar=
d-lnl-6/igt@kms_flip@flip-vs-expired-vblank@c-edp1.html">PASS</a> +1 other =
test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_fl=
ip@flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.or=
g/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"https://gitlab.=
freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-432/=
igt@kms_flip@flip-vs-suspend.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@flip-vs-suspend-interruptible:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_fli=
p@flip-vs-suspend-interruptible.html">DMESG-WARN</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/4543">Intel XE#4543</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adl=
p-4/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> +20 other tes=
ts pass</li>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-3/igt@kms_flip=
@flip-vs-suspend-interruptible.html">INCOMPLETE</a> (<a href=3D"https://git=
lab.freedesktop.org/drm/xe/kernel/issues/2049">Intel XE#2049</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2597">Intel XE#2597=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1508=
45v1/shard-bmg-2/igt@kms_flip@flip-vs-suspend-interruptible.html">PASS</a> =
+1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_fli=
p_scaled_crc@flip-64bpp-xtile-to-16bpp-xtile-downscaling.html">DMESG-FAIL</=
a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4543">In=
tel XE#4543</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/i=
ssues/4921">Intel XE#4921</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-pw-150845v1/shard-adlp-6/igt@kms_flip_scaled_crc@flip-64b=
pp-xtile-to-16bpp-xtile-downscaling.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_joiner@invalid-modeset-force-big-joiner:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-5/igt@kms_join=
er@invalid-modeset-force-big-joiner.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/3012">Intel XE#3012</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-3=
/igt@kms_joiner@invalid-modeset-force-big-joiner.html">PASS</a> +1 other te=
st pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_cursor@viewport:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_pl=
ane_cursor@viewport.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/616">Intel XE#616</a>) -&gt; <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/igt@kms_plane_c=
ursor@viewport.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-4:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-5/igt@kms_plan=
e_multiple@2x-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_plan=
e_multiple@2x-tiling-4.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_pm_dc@dc6-dpms:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-3/igt@kms_pm_d=
c@dc6-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/718">Intel XE#718</a>) -&gt; <a href=3D"https://intel-gfx-ci=
.01.org/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@kms_pm_dc@dc6-dpms.htm=
l">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-180:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-2/igt@kms_rot=
ation_crc@primary-y-tiled-reflect-x-180.html">DMESG-WARN</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2953">Intel XE#2953</a> /=
 <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4173">Intel=
 XE#4173</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-150845v1/shard-adlp-2/igt@kms_rotation_crc@primary-y-tiled-reflect-x-18=
0.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-2/igt@kms_vrr@=
seamless-rr-switch-virtual@pipe-a-edp-1.html">FAIL</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/2142">Intel XE#2142</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-l=
nl-8/igt@kms_vrr@seamless-rr-switch-virtual@pipe-a-edp-1.html">PASS</a> +1 =
other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-once-null-defer-mmap:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-432/igt@xe_exe=
c_basic@multigpu-once-null-defer-mmap.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#1392</a>) -&gt; <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2=
-466/igt@xe_exec_basic@multigpu-once-null-defer-mmap.html">PASS</a> +2 othe=
r tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_reset@parallel-gt-reset:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-435/igt@xe_exe=
c_reset@parallel-gt-reset.html">DMESG-WARN</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/3876">Intel XE#3876</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-464/=
igt@xe_exec_reset@parallel-gt-reset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues-new-bo-ma=
p:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-4/igt@xe_exec_=
system_allocator@threads-shared-vm-many-execqueues-new-bo-map.html">FAIL</a=
> -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1=
/shard-lnl-1/igt@xe_exec_system_allocator@threads-shared-vm-many-execqueues=
-new-bo-map.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-large-new-bo-map-nom=
emset:</p>
<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-lnl-2/igt@xe_exec_=
system_allocator@threads-shared-vm-many-large-new-bo-map-nomemset.html">FAI=
L</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4937"=
>Intel XE#4937</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/5018">Intel XE#5018</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-pw-150845v1/shard-lnl-8/igt@xe_exec_system_allocator@t=
hreads-shared-vm-many-large-new-bo-map-nomemset.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-misaligned-binds-2097152:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@xe_vm@=
large-misaligned-binds-2097152.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-435/=
igt@xe_vm@large-misaligned-binds-2097152.html">PASS</a> +7 other tests pass=
</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_big_fb@4-tiled-16bpp-rotate-270:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_big=
_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/1124">Intel XE#1124</a>) -&gt; <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@k=
ms_big_fb@4-tiled-16bpp-rotate-270.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/2351">Intel XE#2351</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a=
>)</li>
</ul>
</li>
<li>
<p>igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-2/igt@kms_big=
_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-async-flip.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1124">Intel XE#112=
4</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
845v1/shard-adlp-1/igt@kms_big_fb@yf-tiled-max-hw-stride-64bpp-rotate-0-asy=
nc-flip.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_bw@=
connected-linear-tiling-2-displays-1920x1080p.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/2191">Intel XE#2191</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/s=
hard-adlp-1/igt@kms_bw@connected-linear-tiling-2-displays-1920x1080p.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/49=
50">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_bw@linear-tiling-1-displays-2560x1440p:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-4/igt@kms_bw@=
linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"https://gitl=
ab.freedesktop.org/drm/xe/kernel/issues/367">Intel XE#367</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/=
igt@kms_bw@linear-tiling-1-displays-2560x1440p.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-2/igt@kms_ccs=
@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https://=
gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787</=
a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845=
v1/shard-adlp-1/igt@kms_ccs@bad-pixel-format-4-tiled-dg2-rc-ccs-cc.html">SK=
IP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947=
">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-3/igt@kms_ccs=
@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/787">Intel XE#787<=
/a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15084=
5v1/shard-adlp-1/igt@kms_ccs@crc-primary-basic-4-tiled-dg2-rc-ccs-cc.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/23=
51">Intel XE#2351</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_cc=
s@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/s=
hard-dg2-432/igt@kms_ccs@crc-primary-rotation-180-4-tiled-mtl-mc-ccs.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/45=
5">Intel XE#455</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kern=
el/issues/787">Intel XE#787</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_ccs@random-ccs-data-4-tiled-dg2-rc-ccs:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-433/igt@kms_cc=
s@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel XE=
#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/=
4212">Intel XE#4212</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4345">Intel XE#4345</a> / <a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4522">Intel XE#4522</a>) -&gt; <a href=3D"https=
://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-463/igt@kms_c=
cs@random-ccs-data-4-tiled-dg2-rc-ccs.html">INCOMPLETE</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3113">Intel X=
E#3113</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/3124">Intel XE#3124</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe=
/kernel/issues/4345">Intel XE#4345</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-aspect-ratio:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_ch=
amelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D"h=
ttps://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)=
 -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/=
shard-dg2-464/igt@kms_chamelium_frames@hdmi-aspect-ratio.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/373">Intel XE#=
373</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_chamelium_frames@hdmi-crc-multiple:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-8/igt@kms_cha=
melium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/373">Intel XE#373</a>) -&gt; <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@=
kms_chamelium_frames@hdmi-crc-multiple.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 othe=
r test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_con=
tent_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href=3D"https://=
intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_conte=
nt_protection@atomic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4950">Intel XE#4950</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@atomic-dpms:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-2/igt@kms_cont=
ent_protection@atomic-dpms.html">FAIL</a> (<a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@kms_=
content_protection@atomic-dpms.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@dp-mst-lic-type-1:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_co=
ntent_protection@dp-mst-lic-type-1.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a href=3D=
"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v=
1/shard-dg2-436/igt@kms_content_protection@dp-mst-lic-type-1.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/307">Intel=
 XE#307</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_content_protection@legacy:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-5/igt@kms_cont=
ent_protection@legacy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/2341">Intel XE#2341</a>) -&gt; <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-7/igt@kms_conte=
nt_protection@legacy.html">FAIL</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/1178">Intel XE#1178</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_crc@cursor-rapid-movement-512x512:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_cur=
sor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/308">Intel XE#308</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-=
1/igt@kms_cursor_crc@cursor-rapid-movement-512x512.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@short-busy-flip-before-cursor-atomic-transitions-v=
arying-size:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-6/igt@kms_cur=
sor_legacy@short-busy-flip-before-cursor-atomic-transitions-varying-size.ht=
ml">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issue=
s/323">Intel XE#323</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/=
intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_cursor_legacy@short-busy-flip-=
before-cursor-atomic-transitions-varying-size.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4950">Intel XE#4950</a>)<=
/li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-4/igt@kms_flip=
@2x-flip-vs-dpms-on-nop-interruptible.html">FAIL</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/886">Intel XE#886</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-6=
/igt@kms_flip@2x-flip-vs-dpms-on-nop-interruptible.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2316">Intel XE#2316=
</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@2x-flip-vs-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@kms_fli=
p@2x-flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/310">Intel XE#310</a>) -&gt; <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms_flip@2x=
-flip-vs-suspend.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4950">Intel XE#4950</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling:</=
p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_fl=
ip_scaled_crc@flip-32bpp-yftile-to-64bpp-yftile-downscaling.html">SKIP</a> =
(<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel=
 XE#4208</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe=
-pw-150845v1/shard-dg2-432/igt@kms_flip_scaled_crc@flip-32bpp-yftile-to-64b=
pp-yftile-downscaling.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop=
.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-cur-indfb-draw-render.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#=
2312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-=
150845v1/shard-bmg-8/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-cur-indf=
b-draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm=
/xe/kernel/issues/2311">Intel XE#2311</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-4/igt@kms_fron=
tbuffer_tracking@drrs-2p-primscrn-indfb-pgflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2311">Intel XE#2311=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1508=
45v1/shard-bmg-6/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-indfb-pgflip=
-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/2312">Intel XE#2312</a>) +14 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@drrs-2p-primscrn-spr-indfb-move.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1508=
45v1/shard-dg2-464/igt@kms_frontbuffer_tracking@drrs-2p-primscrn-spr-indfb-=
move.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kerne=
l/issues/651">Intel XE#651</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-draw-render.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2=
312</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1=
50845v1/shard-bmg-4/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-=
draw-render.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4141">Intel XE#4141</a>) +13 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-2/igt@kms_fron=
tbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.html">SKIP</a> (<a href=3D=
"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4141">Intel XE#4141</a=
>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v=
1/shard-bmg-6/igt@kms_frontbuffer_tracking@fbc-2p-scndscrn-spr-indfb-onoff.=
html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/iss=
ues/2312">Intel XE#2312</a>) +11 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-1/igt@kms_fro=
ntbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</a> (<a href=3D"https:=
//gitlab.freedesktop.org/drm/xe/kernel/issues/651">Intel XE#651</a>) -&gt; =
<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-a=
dlp-1/igt@kms_frontbuffer_tracking@fbcdrrs-modesetfrombusy.html">SKIP</a> (=
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel =
XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-1/igt@kms_fron=
tbuffer_tracking@fbcpsr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a hre=
f=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2313">Intel XE#231=
3</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
845v1/shard-bmg-5/igt@kms_frontbuffer_tracking@fbcpsr-2p-primscrn-indfb-plf=
lip-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/ke=
rnel/issues/2312">Intel XE#2312</a>) +20 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-8/igt@kms_fro=
ntbuffer_tracking@fbcpsr-2p-scndscrn-cur-indfb-draw-blt.html">SKIP</a> (<a =
href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/656">Intel XE#6=
56</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0845v1/shard-adlp-1/igt@kms_frontbuffer_tracking@fbcpsr-2p-scndscrn-cur-ind=
fb-draw-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/x=
e/kernel/issues/4947">Intel XE#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-4/igt@kms_fro=
ntbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/653">Intel XE#653</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-ad=
lp-1/igt@kms_frontbuffer_tracking@fbcpsr-rgb565-draw-blt.html">SKIP</a> (<a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE=
#4947</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@fbcpsr-tiling-4:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-2/igt@kms_fro=
ntbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/1151">Intel XE#1151</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/=
igt@kms_frontbuffer_tracking@fbcpsr-tiling-4.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</=
li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_fr=
ontbuffer_tracking@psr-2p-pri-indfb-multidraw.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) =
-&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/s=
hard-dg2-436/igt@kms_frontbuffer_tracking@psr-2p-pri-indfb-multidraw.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/65=
3">Intel XE#653</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-6/igt@kms_fron=
tbuffer_tracking@psr-2p-primscrn-indfb-plflip-blt.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2312">Intel XE#2312=
</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-1508=
45v1/shard-bmg-2/igt@kms_frontbuffer_tracking@psr-2p-primscrn-indfb-plflip-=
blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel=
/issues/2313">Intel XE#2313</a>) +16 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_plane_multiple@2x-tiling-y:</p>
<ul>
<li>shard-bmg:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-bmg-7/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/5021">Intel XE#5021</a>) -&gt; <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-bmg-6/igt@kms_plan=
e_multiple@2x-tiling-y.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/4596">Intel XE#4596</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pm_rpm@dpms-mode-unset-non-lpsp:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-1/igt@kms_pm_=
rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.free=
desktop.org/drm/xe/kernel/issues/836">Intel XE#836</a>) -&gt; <a href=3D"ht=
tps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@kms=
_pm_rpm@dpms-mode-unset-non-lpsp.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4962">Intel XE#4962</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-6/igt@kms_psr=
2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/1489">Intel XE#1489</a>) -&gt; <a hr=
ef=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1=
/igt@kms_psr2_sf@fbc-pr-plane-move-sf-dmg-area.html">SKIP</a> (<a href=3D"h=
ttps://gitlab.freedesktop.org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)=
</li>
</ul>
</li>
<li>
<p>igt@kms_psr@pr-primary-blt:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-4/igt@kms_psr=
@pr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/d=
rm/xe/kernel/issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.fre=
edesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@km=
s_psr@pr-primary-blt.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.=
org/drm/xe/kernel/issues/4947">Intel XE#4947</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr2-basic:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_ps=
r@psr2-basic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/=
xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a href=3D"https://intel-gf=
x-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-466/igt@kms_psr@psr2-bas=
ic.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/=
issues/2850">Intel XE#2850</a> / <a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/929">Intel XE#929</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@kms_rotation_crc@primary-y-tiled-reflect-x-0:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@kms_ro=
tation_crc@primary-y-tiled-reflect-x-0.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a> / <a hre=
f=3D"https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#257=
5</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150=
845v1/shard-dg2-466/igt@kms_rotation_crc@primary-y-tiled-reflect-x-0.html">=
SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/11=
27">Intel XE#1127</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-3/igt@xe_ccs@=
ctrl-surf-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/dr=
m/xe/kernel/issues/455">Intel XE#455</a> / <a href=3D"https://gitlab.freede=
sktop.org/drm/xe/kernel/issues/488">Intel XE#488</a>) -&gt; <a href=3D"http=
s://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@xe_cc=
s@ctrl-surf-copy.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/=
drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_eudebug@basic-vm-bind-discovery:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@xe_eude=
bug@basic-vm-bind-discovery.html">SKIP</a> (<a href=3D"https://gitlab.freed=
esktop.org/drm/xe/kernel/issues/4837">Intel XE#4837</a>) -&gt; <a href=3D"h=
ttps://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/igt@xe=
_eudebug@basic-vm-bind-discovery.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-small-external:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-8/igt@xe_evic=
t@evict-small-external.html">SKIP</a> (<a href=3D"https://gitlab.freedeskto=
p.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href=3D"https://gitla=
b.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/i=
gt@xe_evict@evict-small-external.html">SKIP</a> (<a href=3D"https://gitlab.=
freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-2/igt@xe_exec=
_basic@multigpu-many-execqueues-many-vm-bindexecqueue.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/1392">Intel XE#13=
92</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0845v1/shard-adlp-1/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bind=
execqueue.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4945">Intel XE#4945</a>) +1 other test skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@xe_exe=
c_fault_mode@invalid-va-scratch-nopagefault.html">SKIP</a> (<a href=3D"http=
s://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&=
gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/sha=
rd-dg2-436/igt@xe_exec_fault_mode@invalid-va-scratch-nopagefault.html">SKIP=
</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">I=
ntel XE#288</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-bindexecqueue-rebind:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-4/igt@xe_exec=
_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href=3D"https://gi=
tlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a h=
ref=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-=
1/igt@xe_exec_fault_mode@many-bindexecqueue-rebind.html">SKIP</a> (<a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945=
</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_mix_modes@exec-simple-batch-store-lr:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@xe_exe=
c_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <=
a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg=
2-466/igt@xe_exec_mix_modes@exec-simple-batch-store-lr.html">SKIP</a> (<a h=
ref=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/2360">Intel XE#2=
360</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@process-many-stride-mmap-free-huge:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@xe_exe=
c_system_allocator@process-many-stride-mmap-free-huge.html">SKIP</a> (<a hr=
ef=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#42=
08</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-15=
0845v1/shard-dg2-466/igt@xe_exec_system_allocator@process-many-stride-mmap-=
free-huge.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.org/drm/xe/=
kernel/issues/4915">Intel XE#4915</a>) +12 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset:=
</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-9/igt@xe_exec=
_system_allocator@threads-shared-vm-many-mmap-mlock-nomemset.html">SKIP</a>=
 (<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/4915">Inte=
l XE#4915</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/x=
e-pw-150845v1/shard-adlp-1/igt@xe_exec_system_allocator@threads-shared-vm-m=
any-mmap-mlock-nomemset.html">SKIP</a> (<a href=3D"https://gitlab.freedeskt=
op.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>) +13 other tests skip</=
li>
</ul>
</li>
<li>
<p>igt@xe_oa@oa-unit-concurrent-oa-buffer-read:</p>
<ul>
<li>shard-dg2-set2:     <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-dg2-463/igt@xe_oa@=
oa-unit-concurrent-oa-buffer-read.html">SKIP</a> (<a href=3D"https://gitlab=
.freedesktop.org/drm/xe/kernel/issues/4208">Intel XE#4208</a>) -&gt; <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-dg2-436=
/igt@xe_oa@oa-unit-concurrent-oa-buffer-read.html">SKIP</a> (<a href=3D"htt=
ps://gitlab.freedesktop.org/drm/xe/kernel/issues/2541">Intel XE#2541</a> / =
<a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/3573">Intel =
XE#3573</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pxp@pxp-stale-bo-exec-post-suspend:</p>
<ul>
<li>shard-adlp:         <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e/shard-adlp-4/igt@xe_pxp@=
pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https://gitlab.fr=
eedesktop.org/drm/xe/kernel/issues/4733">Intel XE#4733</a>) -&gt; <a href=
=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150845v1/shard-adlp-1/i=
gt@xe_pxp@pxp-stale-bo-exec-post-suspend.html">SKIP</a> (<a href=3D"https:/=
/gitlab.freedesktop.org/drm/xe/kernel/issues/4945">Intel XE#4945</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when comput=
ing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8429 -&gt; IGT_8430</li>
<li>Linux: xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e -&gt; xe-pw-150=
845v1</li>
</ul>
<p>IGT_8429: 8429<br />
  IGT_8430: 4351ec818f4bd363ad0594a008d11ba3963e1f05 @ https://gitlab.freed=
esktop.org/drm/igt-gpu-tools.git<br />
  xe-3316-d4161d829aaed27ce21671cc3c7acbef8ae55a4e: d4161d829aaed27ce21671c=
c3c7acbef8ae55a4e<br />
  xe-pw-150845v1: 150845v1</p>

</body>
</html>

--===============4638389015813119306==--
