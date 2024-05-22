Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2735CC25B78
	for <intel-xe@archiver.kernel.org>; Wed, 22 May 2024 19:29:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 98BB910E0CB;
	Wed, 22 May 2024 19:29:41 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9B30A10E0CB;
 Wed, 22 May 2024 19:29:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8447657986202443373=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/i915=3A_identify_all_platfor?=
 =?utf-8?q?ms_in_display_probe?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 22 May 2024 19:29:39 -0000
Message-ID: <171640617963.2167935.13584329789212395586@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <cover.1716399081.git.jani.nikula@intel.com>
In-Reply-To: <cover.1716399081.git.jani.nikula@intel.com>
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

--===============8447657986202443373==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: identify all platforms in display probe
URL   : https://patchwork.freedesktop.org/series/133931/
State : success

== Summary ==

CI Bug Log - changes from xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921_BAT -> xe-pw-133931v1_BAT
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

  Here are the changes found in xe-pw-133931v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] ([Intel XE#288]) +32 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-adlp-7:         NOTRUN -> [ABORT][2] ([Intel XE#1908])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - bat-atsm-2:         NOTRUN -> [SKIP][3] ([Intel XE#255])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-atsm-2:         NOTRUN -> [SKIP][4] ([Intel XE#977])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-atsm-2:         NOTRUN -> [SKIP][5] ([Intel XE#979]) +1 other test skip
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html

  
#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-basic:
    - bat-atsm-2:         [ABORT][6] -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921/bat-atsm-2/igt@xe_exec_compute_mode@twice-basic.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-basic.html

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - {bat-lnl-1}:        [ABORT][8] ([Intel XE#1908]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921/bat-lnl-1/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-lnl-1/igt@xe_exec_threads@threads-mixed-fd-basic.html
    - bat-adlp-7:         [ABORT][10] ([Intel XE#1908]) -> [PASS][11]
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921/bat-adlp-7/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-adlp-7/igt@xe_exec_threads@threads-mixed-fd-basic.html

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-dg2-oem2:       [ABORT][12] ([Intel XE#1908]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#688]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/688
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979


Build changes
-------------

  * IGT: IGT_7868 -> IGT_7869
  * Linux: xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921 -> xe-pw-133931v1

  IGT_7868: fb027c7a11b77ea2bc9747f5d796cb123d383a23 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921: 42b9a14c5932c577019bf2f5d5ff25d208c1f921
  xe-pw-133931v1: 133931v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/index.html

--===============8447657986202443373==
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
<tr><td><b>Series:</b></td><td>drm/i915: identify all platforms in display probe</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133931/">https://patchwork.freedesktop.org/series/133931/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921_BAT -&gt; xe-pw-133931v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133931v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-adlp-7:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-atsm-2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-atsm-2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-atsm-2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921/bat-atsm-2/igt@xe_exec_compute_mode@twice-basic.html">ABORT</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-fd-basic:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921/bat-lnl-1/igt@xe_exec_threads@threads-mixed-fd-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-lnl-1/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921/bat-adlp-7/igt@xe_exec_threads@threads-mixed-fd-basic.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-adlp-7/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908">Intel XE#1908</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133931v1/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7868 -&gt; IGT_7869</li>
<li>Linux: xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921 -&gt; xe-pw-133931v1</li>
</ul>
<p>IGT_7868: fb027c7a11b77ea2bc9747f5d796cb123d383a23 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7869: e43892a30d594f8bcbcbd42ccffe298313479215 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1329-42b9a14c5932c577019bf2f5d5ff25d208c1f921: 42b9a14c5932c577019bf2f5d5ff25d208c1f921<br />
  xe-pw-133931v1: 133931v1</p>

</body>
</html>

--===============8447657986202443373==--
