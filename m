Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5C82EC3DA6E
	for <intel-xe@archiver.kernel.org>; Sat,  6 Jan 2024 02:29:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1474C10E6B1;
	Sat,  6 Jan 2024 02:29:34 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2D6B10E0B0;
 Sat,  6 Jan 2024 02:29:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0360265384496024570=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/guc=3A_Only_take_actions_?=
 =?utf-8?q?in_CT_irq_handler_if_CTs_are_enabled_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Date: Sat, 06 Jan 2024 02:29:32 -0000
Message-ID: <170450817272.57734.17354351724414163007@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240105203431.1329368-1-matthew.brost@intel.com>
In-Reply-To: <20240105203431.1329368-1-matthew.brost@intel.com>
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

--===============0360265384496024570==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Only take actions in CT irq handler if CTs are enabled (rev3)
URL   : https://patchwork.freedesktop.org/series/128129/
State : success

== Summary ==

CI Bug Log - changes from xe-603-cca0607b6f6a21bee68c092ed7ad9f3322e54523_BAT -> xe-pw-128129v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-128129v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][1] ([Intel XE#623])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][2] ([Intel XE#455])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [PASS][3] -> [FAIL][4] ([Intel XE#480]) +1 other test fail
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-603-cca0607b6f6a21bee68c092ed7ad9f3322e54523/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][5] ([i915#5274])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][6] ([Intel XE#608])
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][7] ([Intel XE#400] / [Intel XE#616]) +2 other tests fail
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html

  * igt@xe_exec_fault_mode@many-basic:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][8] ([Intel XE#288]) +32 other tests skip
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][9] ([Intel XE#255])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][10] ([Intel XE#977])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][11] ([Intel XE#979]) +1 other test skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  
#### Possible fixes ####

  * igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:
    - bat-adlp-7:         [FAIL][12] ([i915#2346]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-603-cca0607b6f6a21bee68c092ed7ad9f3322e54523/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       [INCOMPLETE][14] ([Intel XE#1044]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-603-cca0607b6f6a21bee68c092ed7ad9f3322e54523/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#400]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/400
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274


Build changes
-------------

  * IGT: IGT_7659 -> IGT_7660
  * Linux: xe-603-cca0607b6f6a21bee68c092ed7ad9f3322e54523 -> xe-pw-128129v3

  IGT_7659: dcc68cc6c562866584feac3ffadab65dfa9a402b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7660: 5652fea1340df44a032f14136c532f59e6158259 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-603-cca0607b6f6a21bee68c092ed7ad9f3322e54523: cca0607b6f6a21bee68c092ed7ad9f3322e54523
  xe-pw-128129v3: 128129v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/index.html

--===============0360265384496024570==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Only take actions in CT irq handler if CTs are enabled (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128129/">https://patchwork.freedesktop.org/series/128129/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-603-cca0607b6f6a21bee68c092ed7ad9f3322e54523_BAT -&gt; xe-pw-128129v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-128129v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-603-cca0607b6f6a21bee68c092ed7ad9f3322e54523/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-nv12.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/400">Intel XE#400</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@many-basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@xe_exec_fault_mode@many-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-legacy:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-603-cca0607b6f6a21bee68c092ed7ad9f3322e54523/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-legacy.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-603-cca0607b6f6a21bee68c092ed7ad9f3322e54523/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128129v3/bat-dg2-oem2/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7659 -&gt; IGT_7660</li>
<li>Linux: xe-603-cca0607b6f6a21bee68c092ed7ad9f3322e54523 -&gt; xe-pw-128129v3</li>
</ul>
<p>IGT_7659: dcc68cc6c562866584feac3ffadab65dfa9a402b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7660: 5652fea1340df44a032f14136c532f59e6158259 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-603-cca0607b6f6a21bee68c092ed7ad9f3322e54523: cca0607b6f6a21bee68c092ed7ad9f3322e54523<br />
  xe-pw-128129v3: 128129v3</p>

</body>
</html>

--===============0360265384496024570==--
