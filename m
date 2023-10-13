Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D900CDB487
	for <intel-xe@archiver.kernel.org>; Fri, 13 Oct 2023 16:06:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2BBE110E1A3;
	Fri, 13 Oct 2023 16:06:51 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 50CB710E1A3;
 Fri, 13 Oct 2023 16:06:49 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 4A446A3ECB;
 Fri, 13 Oct 2023 16:06:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3806858556625937765=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: maarten.lankhorst@linux.intel.com
Date: Fri, 13 Oct 2023 16:06:44 -0000
Message-ID: <169721320425.31155.3863273834304618067@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231013151452.52457-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20231013151452.52457-1-maarten.lankhorst@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/di?=
 =?utf-8?q?splay=3A_Handle_NULL_ggtt=5Fvma_unpinning=2E_=28rev2=29?=
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

--===============3806858556625937765==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Handle NULL ggtt_vma unpinning. (rev2)
URL   : https://patchwork.freedesktop.org/series/125107/
State : success

== Summary ==

CI Bug Log - changes from xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338_BAT -> xe-pw-125107v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 3)
------------------------------

  Additional (1): bat-atsm-2 

Known issues
------------

  Here are the changes found in xe-pw-125107v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] ([i915#6077]) +33 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-adlp-7:         [PASS][2] -> [FAIL][3] ([i915#2346])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:
    - bat-dg2-oem2:       [PASS][4] -> [FAIL][5] ([i915#2346])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-atsm-2:         NOTRUN -> [SKIP][6] ([Intel XE#782]) +5 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][7] ([Intel XE#784])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-atsm-2:         NOTRUN -> [SKIP][8] ([Intel XE#541]) +3 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:
    - bat-adlp-7:         [PASS][9] -> [FAIL][10] ([Intel XE#480])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-atsm-2:         NOTRUN -> [SKIP][11] ([Intel XE#540]) +3 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][12] ([Intel XE#783])
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:
    - bat-atsm-2:         NOTRUN -> [SKIP][13] ([i915#1836]) +6 other tests skip
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html

  * igt@kms_pipe_crc_basic@hang-read-crc:
    - bat-dg2-oem2:       [PASS][14] -> [INCOMPLETE][15] ([Intel XE#749])
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html

  * igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3:
    - bat-dg2-oem2:       [PASS][16] -> [INCOMPLETE][17] ([Intel XE#545])
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         NOTRUN -> [SKIP][18] ([Intel XE#780])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@cursor_plane_move:
    - bat-atsm-2:         NOTRUN -> [SKIP][19] ([Intel XE#535]) +2 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_psr@cursor_plane_move.html

  * igt@xe_compute@compute-square:
    - bat-atsm-2:         NOTRUN -> [SKIP][20] ([Intel XE#672])
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@xe_compute@compute-square.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         NOTRUN -> [SKIP][21] ([Intel XE#288]) +17 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_store@basic-store:
    - bat-adlp-7:         [PASS][22] -> [FAIL][23] ([Intel XE#761])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-adlp-7/igt@xe_exec_store@basic-store.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-adlp-7/igt@xe_exec_store@basic-store.html

  * igt@xe_huc_copy@huc_copy:
    - bat-atsm-2:         NOTRUN -> [SKIP][24] ([Intel XE#255])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [FAIL][25] ([Intel XE#480]) -> [PASS][26] +1 other test pass
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
#### Warnings ####

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       [FAIL][27] ([Intel XE#400]) -> [TIMEOUT][28] ([Intel XE#430] / [Intel XE#530])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3:
    - bat-dg2-oem2:       [FAIL][29] ([Intel XE#400]) -> [TIMEOUT][30] ([Intel XE#530])
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#430]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/430
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#530]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/530
  [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#541]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/541
  [Intel XE#545]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/545
  [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
  [Intel XE#749]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/749
  [Intel XE#761]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/761
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [i915#1836]: https://gitlab.freedesktop.org/drm/intel/issues/1836
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#6077]: https://gitlab.freedesktop.org/drm/intel/issues/6077


Build changes
-------------

  * IGT: IGT_7534 -> IGT_7538
  * Linux: xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338 -> xe-pw-125107v2

  IGT_7534: 7534
  IGT_7538: 2fc5a3b845dac0f54b595839ee0c0ee9ad90409f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338: 037b6c8b23818fa71223e996c68a4f55f2d91338
  xe-pw-125107v2: 125107v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/index.html

--===============3806858556625937765==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Handle NULL ggtt_vma unpinning. (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125107/">https://patchwork.freedesktop.org/series/125107/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338_BAT -&gt; xe-pw-125107v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 3)</h2>
<p>Additional (1): bat-atsm-2 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-125107v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/6077">i915#6077</a>) +33 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-dg2-oem2/igt@kms_cursor_legacy@basic-flip-after-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/541">Intel XE#541</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@c-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/1836">i915#1836</a>) +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/749">Intel XE#749</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-dg2-oem2/igt@kms_pipe_crc_basic@hang-read-crc@pipe-a-dp-3.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/545">Intel XE#545</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@cursor_plane_move:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@kms_psr@cursor_plane_move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_store@basic-store:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-adlp-7/igt@xe_exec_store@basic-store.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-adlp-7/igt@xe_exec_store@basic-store.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/761">Intel XE#761</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/430">Intel XE#430</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/530">Intel XE#530</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125107v2/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12@pipe-d-dp-3.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/530">Intel XE#530</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7534 -&gt; IGT_7538</li>
<li>Linux: xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338 -&gt; xe-pw-125107v2</li>
</ul>
<p>IGT_7534: 7534<br />
  IGT_7538: 2fc5a3b845dac0f54b595839ee0c0ee9ad90409f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-433-037b6c8b23818fa71223e996c68a4f55f2d91338: 037b6c8b23818fa71223e996c68a4f55f2d91338<br />
  xe-pw-125107v2: 125107v2</p>

</body>
</html>

--===============3806858556625937765==--
