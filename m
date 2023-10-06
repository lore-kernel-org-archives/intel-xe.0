Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1CB1E81DF4
	for <intel-xe@archiver.kernel.org>; Fri,  6 Oct 2023 13:03:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAEA510E4E4;
	Fri,  6 Oct 2023 13:03:12 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 7561110E1FD;
 Fri,  6 Oct 2023 13:03:09 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 6BA78AADEA;
 Fri,  6 Oct 2023 13:03:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7823860940075225242=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Date: Fri, 06 Oct 2023 13:03:09 -0000
Message-ID: <169659738940.6465.4294560479196777293@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231006095943.7-1-francois.dugast@intel.com>
In-Reply-To: <20231006095943.7-1-francois.dugast@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_uAPI_Alig?=
 =?utf-8?q?nment_-_take_1_v5?=
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============7823860940075225242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: uAPI Alignment - take 1 v5
URL   : https://patchwork.freedesktop.org/series/124710/
State : failure

== Summary ==

CI Bug Log - changes from xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e_BAT -> xe-pw-124710v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-124710v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-124710v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-124710v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][1] +22 other tests fail
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3.html

  * igt@xe_exec_threads@threads-mixed-basic:
    - bat-dg2-oem2:       [PASS][2] -> [TIMEOUT][3] +2 other tests timeout
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][4] -> [FAIL][5] +130 other tests fail
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_mmio@mmio-invalid:
    - bat-adlp-7:         [PASS][6] -> [FAIL][7] +2 other tests fail
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@xe_mmio@mmio-invalid.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@xe_mmio@mmio-invalid.html

  * igt@xe_query@query-engines:
    - bat-dg2-oem2:       [PASS][8] -> [WARN][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@xe_query@query-engines.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@xe_query@query-engines.html

  
#### Warnings ####

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       [FAIL][10] ([Intel XE#609]) -> [FAIL][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [FAIL][12] ([Intel XE#608]) -> [FAIL][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [TIMEOUT][14] ([Intel XE#430] / [Intel XE#530]) -> [FAIL][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:
    - bat-dg2-oem2:       [FAIL][16] ([Intel XE#400]) -> [FAIL][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3:
    - bat-dg2-oem2:       [TIMEOUT][18] ([Intel XE#530]) -> [FAIL][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-dg2-oem2:       [INCOMPLETE][20] ([Intel XE#282] / [Intel XE#749]) -> [FAIL][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3:
    - bat-dg2-oem2:       [INCOMPLETE][22] ([Intel XE#282]) -> [FAIL][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-dg2-oem2:       [PASS][24] -> [WARN][25] +1 other test warn
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html

  * {igt@xe_exec_basic@no-exec-bindexecqueue}:
    - bat-dg2-oem2:       [PASS][26] -> [FAIL][27] +11 other tests fail
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html

  
Known issues
------------

  Here are the changes found in xe-pw-124710v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_psr@primary_page_flip:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][28] ([i915#1072]) +2 other tests skip
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html
    - bat-adlp-7:         NOTRUN -> [FAIL][29] ([Intel XE#716]) +12 other tests fail
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@kms_psr@primary_page_flip.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-dg2-oem2:       [PASS][30] -> [TIMEOUT][31] ([Intel XE#280] / [Intel XE#474] / [Intel XE#544])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_intel_bb@create-in-region:
    - bat-adlp-7:         [PASS][32] -> [FAIL][33] ([Intel XE#716]) +155 other tests fail
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@xe_intel_bb@create-in-region.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@xe_intel_bb@create-in-region.html

  * igt@xe_live_ktest@migrate:
    - bat-adlp-7:         NOTRUN -> [INCOMPLETE][34] ([Intel XE#753])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@xe_live_ktest@migrate.html

  
#### Warnings ####

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-adlp-7:         [FAIL][35] ([Intel XE#609]) -> [FAIL][36] ([Intel XE#716]) +2 other tests fail
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-adlp-7:         [SKIP][37] ([Intel XE#423]) -> [FAIL][38] ([Intel XE#716])
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@kms_dsc@dsc-basic.html
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [INCOMPLETE][39] ([Intel XE#606] / [Intel XE#632]) -> [FAIL][40] ([Intel XE#716])
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [40]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_evict@evict-beng-small-external:
    - bat-adlp-7:         [SKIP][41] ([Intel XE#261] / [Intel XE#688]) -> [FAIL][42] ([Intel XE#716]) +15 other tests fail
   [41]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html
   [42]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html

  * igt@xe_exec_fault_mode@twice-userptr:
    - bat-adlp-7:         [SKIP][43] ([Intel XE#288]) -> [FAIL][44] ([Intel XE#716]) +17 other tests fail
   [43]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html
   [44]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html

  * igt@xe_mmap@vram:
    - bat-adlp-7:         [SKIP][45] ([Intel XE#263]) -> [FAIL][46] ([Intel XE#716])
   [45]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@xe_mmap@vram.html
   [46]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@xe_mmap@vram.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#261]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/261
  [Intel XE#263]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/263
  [Intel XE#280]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/280
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/430
  [Intel XE#474]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/474
  [Intel XE#530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/530
  [Intel XE#544]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/544
  [Intel XE#606]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/606
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#632]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/632
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#716]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/716
  [Intel XE#749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/749
  [Intel XE#753]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/753
  [i915#1072]: https://gitlab.freedesktop.org/drm/intel/issues/1072


Build changes
-------------

  * IGT: IGT_7517 -> IGT_7519
  * Linux: xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e -> xe-pw-124710v1

  IGT_7517: 8368e3ad3f9459a8f5cdd24f813ae802c1211029 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7519: d1db7333d9c5fbbb05e50b0804123950d9dc1c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e: b3daf7f07d6accbe43feafcadeb0b0498063761e
  xe-pw-124710v1: 124710v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/index.html

--===============7823860940075225242==
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
<tr><td><b>Series:</b></td><td>uAPI Alignment - take 1 v5</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/124710/">https://patchwork.freedesktop.org/series/124710/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e_BAT -&gt; xe-pw-124710v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-124710v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-124710v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-124710v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-c-dp-3.html">FAIL</a> +22 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-basic.html">TIMEOUT</a> +2 other tests timeout</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">FAIL</a> +130 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmio@mmio-invalid:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@xe_mmio@mmio-invalid.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@xe_mmio@mmio-invalid.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_query@query-engines:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@xe_query@query-engines.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@xe_query@query-engines.html">WARN</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/430">Intel XE#430</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/530">Intel XE#530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-b-dp-3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/530">Intel XE#530</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/749">Intel XE#749</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">FAIL</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@xe_create@create-execqueues-noleak.html">WARN</a> +1 other test warn</li>
</ul>
</li>
<li>
<p>{igt@xe_exec_basic@no-exec-bindexecqueue}:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@xe_exec_basic@no-exec-bindexecqueue.html">FAIL</a> +11 other tests fail</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-124710v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1072">i915#1072</a>) +2 other tests skip</p>
</li>
<li>
<p>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@kms_psr@primary_page_flip.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +12 other tests fail</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/280">Intel XE#280</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/474">Intel XE#474</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/544">Intel XE#544</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@xe_intel_bb@create-in-region.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +155 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@migrate:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@xe_live_ktest@migrate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/753">Intel XE#753</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@kms_addfb_basic@basic-y-tiled-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@kms_dsc@dsc-basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/606">Intel XE#606</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/632">Intel XE#632</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-external:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/261">Intel XE#261</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/688">Intel XE#688</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@xe_evict@evict-beng-small-external.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +15 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@xe_exec_fault_mode@twice-userptr.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>) +17 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e/bat-adlp-7/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/263">Intel XE#263</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-124710v1/bat-adlp-7/igt@xe_mmap@vram.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/716">Intel XE#716</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7517 -&gt; IGT_7519</li>
<li>Linux: xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e -&gt; xe-pw-124710v1</li>
</ul>
<p>IGT_7517: 8368e3ad3f9459a8f5cdd24f813ae802c1211029 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7519: d1db7333d9c5fbbb05e50b0804123950d9dc1c46 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-417-b3daf7f07d6accbe43feafcadeb0b0498063761e: b3daf7f07d6accbe43feafcadeb0b0498063761e<br />
  xe-pw-124710v1: 124710v1</p>

</body>
</html>

--===============7823860940075225242==--
