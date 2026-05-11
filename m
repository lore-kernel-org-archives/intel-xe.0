Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F4FFCD37AC
	for <intel-xe@archiver.kernel.org>; Mon, 11 May 2026 04:39:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA79C10E0D4;
	Mon, 11 May 2026 04:39:06 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9A58D10E0D4;
 Mon, 11 May 2026 04:39:05 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4742917378200327079=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/i915/dp=3A_On_DPCD_rea?=
 =?utf-8?q?d_failure_skip_LT?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 11 May 2026 04:39:05 -0000
Message-ID: <177847434562.55711.8807762887680879837@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260511032007.104081-1-arun.r.murthy@intel.com>
In-Reply-To: <20260511032007.104081-1-arun.r.murthy@intel.com>
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

--===============4742917378200327079==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: On DPCD read failure skip LT
URL   : https://patchwork.freedesktop.org/series/166283/
State : success

== Summary ==

CI Bug Log - changes from xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c_FULL -> xe-pw-166283v1_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

New tests
---------

  New tests have been introduced between xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c_FULL and xe-pw-166283v1_FULL:

### New IGT tests (6) ###

  * igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.15, 0.18] s

  * igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-4tiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.18] s

  * igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-4tiled:
    - Statuses : 2 pass(s)
    - Exec time: [0.13, 0.20] s

  * igt@kms_plane_lowres@tiling-4@pipe-a-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  * igt@kms_plane_lowres@tiling-4@pipe-c-edp-1:
    - Statuses : 1 skip(s)
    - Exec time: [0.0] s

  

Known issues
------------

  Here are the changes found in xe-pw-166283v1_FULL that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_module_load@load:
    - shard-lnl:          ([PASS][1], [PASS][2], [PASS][3], [PASS][4], [PASS][5], [PASS][6], [PASS][7], [PASS][8], [PASS][9], [PASS][10], [PASS][11], [PASS][12], [PASS][13], [PASS][14], [PASS][15], [PASS][16], [PASS][17], [PASS][18], [PASS][19], [PASS][20], [PASS][21], [SKIP][22], [PASS][23], [PASS][24], [PASS][25], [PASS][26]) ([Intel XE#378] / [Intel XE#7405]) -> ([PASS][27], [PASS][28], [PASS][29], [PASS][30], [PASS][31], [PASS][32], [PASS][33])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-5/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-4/igt@xe_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-5/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-4/igt@xe_module_load@load.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-4/igt@xe_module_load@load.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-8/igt@xe_module_load@load.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-8/igt@xe_module_load@load.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-8/igt@xe_module_load@load.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-8/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-7/igt@xe_module_load@load.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-7/igt@xe_module_load@load.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-5/igt@xe_module_load@load.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-5/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-3/igt@xe_module_load@load.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-3/igt@xe_module_load@load.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-3/igt@xe_module_load@load.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-3/igt@xe_module_load@load.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-7/igt@xe_module_load@load.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-2/igt@xe_module_load@load.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-2/igt@xe_module_load@load.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-2/igt@xe_module_load@load.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-2/igt@xe_module_load@load.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-2/igt@xe_module_load@load.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-1/igt@xe_module_load@load.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-1/igt@xe_module_load@load.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-1/igt@xe_module_load@load.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/shard-lnl-8/igt@xe_module_load@load.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/shard-lnl-7/igt@xe_module_load@load.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/shard-lnl-1/igt@xe_module_load@load.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/shard-lnl-5/igt@xe_module_load@load.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/shard-lnl-4/igt@xe_module_load@load.html
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/shard-lnl-2/igt@xe_module_load@load.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/shard-lnl-3/igt@xe_module_load@load.html
    - shard-bmg:          ([SKIP][34], [PASS][35], [PASS][36], [PASS][37], [PASS][38], [PASS][39], [PASS][40], [PASS][41], [PASS][42], [PASS][43], [PASS][44], [PASS][45], [PASS][46], [PASS][47], [PASS][48], [PASS][49], [PASS][50], [PASS][51], [PASS][52], [PASS][53], [PASS][54], [PASS][55], [PASS][56], [PASS][57], [PASS][58], [PASS][59]) ([Intel XE#2457] / [Intel XE#7405]) -> ([PASS][60], [PASS][61], [PASS][62], [PASS][63])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-10/igt@xe_module_load@load.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-10/igt@xe_module_load@load.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-10/igt@xe_module_load@load.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-10/igt@xe_module_load@load.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-1/igt@xe_module_load@load.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-1/igt@xe_module_load@load.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-1/igt@xe_module_load@load.html
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-1/igt@xe_module_load@load.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-4/igt@xe_module_load@load.html
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-9/igt@xe_module_load@load.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-9/igt@xe_module_load@load.html
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-4/igt@xe_module_load@load.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-5/igt@xe_module_load@load.html
   [47]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-9/igt@xe_module_load@load.html
   [48]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_module_load@load.html
   [49]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_module_load@load.html
   [50]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-5/igt@xe_module_load@load.html
   [51]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-4/igt@xe_module_load@load.html
   [52]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-6/igt@xe_module_load@load.html
   [53]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-5/igt@xe_module_load@load.html
   [54]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-6/igt@xe_module_load@load.html
   [55]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-6/igt@xe_module_load@load.html
   [56]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-3/igt@xe_module_load@load.html
   [57]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-3/igt@xe_module_load@load.html
   [58]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-3/igt@xe_module_load@load.html
   [59]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-3/igt@xe_module_load@load.html
   [60]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/shard-bmg-10/igt@xe_module_load@load.html
   [61]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/shard-bmg-5/igt@xe_module_load@load.html
   [62]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/shard-bmg-9/igt@xe_module_load@load.html
   [63]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/shard-bmg-1/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:
    - shard-lnl:          [SKIP][64] ([Intel XE#309] / [Intel XE#7343] / [Intel XE#7935]) -> [SKIP][65] ([Intel XE#309] / [Intel XE#7343])
   [64]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-8/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html
   [65]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions.html

  
  [Intel XE#2457]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2457
  [Intel XE#309]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/309
  [Intel XE#378]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/378
  [Intel XE#7343]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343
  [Intel XE#7405]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405
  [Intel XE#7935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/7935


Build changes
-------------

  * Linux: xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c -> xe-pw-166283v1

  IGT_8902: d28bd0b9e0347c58ca9b012c02de7e2ad5ffe847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c: a86f5af06a7f8fa3c0a87caa138d06824f87878c
  xe-pw-166283v1: 166283v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/index.html

--===============4742917378200327079==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: On DPCD read failure skip LT</t=
d></tr>
<tr><td><b>URL:</b></td><td><a href=3D"https://patchwork.freedesktop.org/se=
ries/166283/">https://patchwork.freedesktop.org/series/166283/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href=3D"https://intel-gfx-ci.01.org/=
tree/intel-xe/xe-pw-166283v1/index.html">https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-pw-166283v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5037-a86f5af06a7f8fa3c0a87caa138d06824=
f87878c_FULL -&gt; xe-pw-166283v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>New tests</h2>
<p>New tests have been introduced between xe-5037-a86f5af06a7f8fa3c0a87caa1=
38d06824f87878c_FULL and xe-pw-166283v1_FULL:</p>
<h3>New IGT tests (6)</h3>
<ul>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@rgb565-4tiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.15, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@xrgb2101010-4tiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.18] s</li>
</ul>
</li>
<li>
<p>igt@kms_draw_crc@draw-method-mmap-wc@xrgb8888-4tiled:</p>
<ul>
<li>Statuses : 2 pass(s)</li>
<li>Exec time: [0.13, 0.20] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-a-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-b-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
<li>
<p>igt@kms_plane_lowres@tiling-4@pipe-c-edp-1:</p>
<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.0] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166283v1_FULL that come from known i=
ssues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>shard-lnl:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-5/igt@xe_modu=
le_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/in=
tel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-4/igt@xe_=
module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tre=
e/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-5/igt=
@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org=
/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-4=
/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01=
.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-l=
nl-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/sha=
rd-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c=
/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87=
878c/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d0682=
4f87878c/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d=
06824f87878c/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa=
138d06824f87878c/shard-lnl-7/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a8=
7caa138d06824f87878c/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3=
c0a87caa138d06824f87878c/shard-lnl-5/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f=
8fa3c0a87caa138d06824f87878c/shard-lnl-3/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af0=
6a7f8fa3c0a87caa138d06824f87878c/shard-lnl-3/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f=
5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-3/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-=
a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-3/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-7/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-2/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-2/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-2/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-2/ig=
t@xe_module_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-=
2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-=
lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/sh=
ard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878=
c/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https://g=
itlab.freedesktop.org/drm/xe/kernel/issues/378">Intel XE#378</a> / <a href=
=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE#7405=
</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166=
283v1/shard-lnl-8/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/shard-lnl-7/igt@xe_modul=
e_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/int=
el-xe/xe-pw-166283v1/shard-lnl-1/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/shard-lnl=
-5/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.=
01.org/tree/intel-xe/xe-pw-166283v1/shard-lnl-4/igt@xe_module_load@load.htm=
l">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166=
283v1/shard-lnl-2/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:=
//intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/shard-lnl-3/igt@xe_modul=
e_load@load.html">PASS</a>)</li>
<li>shard-bmg:          (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-=
xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-10/igt@xe_mod=
ule_load@load.html">SKIP</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-10/igt@x=
e_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/t=
ree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-10/=
igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.=
org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bm=
g-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-c=
i.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-g=
fx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c=
/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://int=
el-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87=
878c/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https:/=
/intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d0682=
4f87878c/shard-bmg-1/igt@xe_module_load@load.html">PASS</a>, <a href=3D"htt=
ps://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d=
06824f87878c/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>, <a href=3D=
"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa=
138d06824f87878c/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a hre=
f=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a8=
7caa138d06824f87878c/shard-bmg-9/igt@xe_module_load@load.html">PASS</a>, <a=
 href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3=
c0a87caa138d06824f87878c/shard-bmg-4/igt@xe_module_load@load.html">PASS</a>=
, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f=
8fa3c0a87caa138d06824f87878c/shard-bmg-5/igt@xe_module_load@load.html">PASS=
</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af0=
6a7f8fa3c0a87caa138d06824f87878c/shard-bmg-9/igt@xe_module_load@load.html">=
PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f=
5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_module_load@load.ht=
ml">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5037-=
a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-2/igt@xe_module_load@loa=
d.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-5=
037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-5/igt@xe_module_load=
@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/=
xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-4/igt@xe_module_=
load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel=
-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-6/igt@xe_mod=
ule_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tree/i=
ntel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-6/ig=
t@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.or=
g/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-bmg-=
6/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.0=
1.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-=
bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-=
ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/sh=
ard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://intel-=
gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878=
c/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>, <a href=3D"https://in=
tel-gfx-ci.01.org/tree/intel-xe/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f8=
7878c/shard-bmg-3/igt@xe_module_load@load.html">PASS</a>) (<a href=3D"https=
://gitlab.freedesktop.org/drm/xe/kernel/issues/2457">Intel XE#2457</a> / <a=
 href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7405">Intel XE=
#7405</a>) -&gt; (<a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-p=
w-166283v1/shard-bmg-10/igt@xe_module_load@load.html">PASS</a>, <a href=3D"=
https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/shard-bmg-5/igt@xe=
_module_load@load.html">PASS</a>, <a href=3D"https://intel-gfx-ci.01.org/tr=
ee/intel-xe/xe-pw-166283v1/shard-bmg-9/igt@xe_module_load@load.html">PASS</=
a>, <a href=3D"https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166283v1/sha=
rd-bmg-1/igt@xe_module_load@load.html">PASS</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_cursor_legacy@cursorb-vs-flipb-atomic-transitions:<ul>
<li>shard-lnl:          <a href=3D"https://intel-gfx-ci.01.org/tree/intel-x=
e/xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c/shard-lnl-8/igt@kms_curs=
or_legacy@cursorb-vs-flipb-atomic-transitions.html">SKIP</a> (<a href=3D"ht=
tps://gitlab.freedesktop.org/drm/xe/kernel/issues/309">Intel XE#309</a> / <=
a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues/7343">Intel X=
E#7343</a> / <a href=3D"https://gitlab.freedesktop.org/drm/xe/kernel/issues=
/7935">Intel XE#7935</a>) -&gt; <a href=3D"https://intel-gfx-ci.01.org/tree=
/intel-xe/xe-pw-166283v1/shard-lnl-3/igt@kms_cursor_legacy@cursorb-vs-flipb=
-atomic-transitions.html">SKIP</a> (<a href=3D"https://gitlab.freedesktop.o=
rg/drm/xe/kernel/issues/309">Intel XE#309</a> / <a href=3D"https://gitlab.f=
reedesktop.org/drm/xe/kernel/issues/7343">Intel XE#7343</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c -&gt; xe-pw-166=
283v1</li>
</ul>
<p>IGT_8902: d28bd0b9e0347c58ca9b012c02de7e2ad5ffe847 @ https://gitlab.free=
desktop.org/drm/igt-gpu-tools.git<br />
  xe-5037-a86f5af06a7f8fa3c0a87caa138d06824f87878c: a86f5af06a7f8fa3c0a87ca=
a138d06824f87878c<br />
  xe-pw-166283v1: 166283v1</p>

</body>
</html>

--===============4742917378200327079==--
