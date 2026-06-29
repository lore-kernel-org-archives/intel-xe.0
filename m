Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 05994C43458
	for <intel-xe@archiver.kernel.org>; Mon, 29 Jun 2026 16:20:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0BC610E94B;
	Mon, 29 Jun 2026 16:20:06 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5F57310E988;
 Mon, 29 Jun 2026 16:20:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7724821058848357501=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/hw=5Fengine=3A_Fix_d?=
 =?utf-8?q?ouble-free_of_managed_BO_in_error_path_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Shuicheng Lin" <shuicheng.lin@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Jun 2026 16:20:03 -0000
Message-ID: <178275000338.128396.1044984780602568138@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260626210631.3887291-1-shuicheng.lin@intel.com>
In-Reply-To: <20260626210631.3887291-1-shuicheng.lin@intel.com>
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

--===============7724821058848357501==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/hw_engine: Fix double-free of managed BO in error path (rev2)
URL   : https://patchwork.freedesktop.org/series/166336/
State : success

== Summary ==

CI Bug Log - changes from xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34_BAT -> xe-pw-166336v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-166336v2_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_ccs@block-copy-compressed:
    - bat-ptl-1:          [INCOMPLETE][1] ([Intel XE#8437] / [Intel XE#8479]) -> [PASS][2] +7 other tests pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-ptl-1/igt@xe_ccs@block-copy-compressed.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-ptl-1/igt@xe_ccs@block-copy-compressed.html
    - bat-lnl-1:          [INCOMPLETE][3] ([Intel XE#8437] / [Intel XE#8479]) -> [PASS][4] +7 other tests pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-lnl-1/igt@xe_ccs@block-copy-compressed.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-lnl-1/igt@xe_ccs@block-copy-compressed.html

  * igt@xe_ccs@ctrl-surf-copy:
    - bat-ptl-2:          [INCOMPLETE][5] ([Intel XE#8437] / [Intel XE#8479]) -> [PASS][6] +7 other tests pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-ptl-2/igt@xe_ccs@ctrl-surf-copy.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-ptl-2/igt@xe_ccs@ctrl-surf-copy.html
    - bat-wcl-1:          [INCOMPLETE][7] ([Intel XE#8437] / [Intel XE#8479]) -> [PASS][8] +7 other tests pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-wcl-1/igt@xe_ccs@ctrl-surf-copy.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-wcl-1/igt@xe_ccs@ctrl-surf-copy.html

  * igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01:
    - bat-bmg-2:          [INCOMPLETE][9] ([Intel XE#8437] / [Intel XE#8479]) -> [PASS][10] +7 other tests pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-bmg-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-bmg-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01.html

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory:
    - bat-atsm-2:         [INCOMPLETE][11] ([Intel XE#8437]) -> [PASS][12] +7 other tests pass
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-atsm-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-atsm-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory.html

  * igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:
    - bat-adlp-7:         [INCOMPLETE][13] ([Intel XE#8437]) -> [PASS][14] +3 other tests pass
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-adlp-7/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-adlp-7/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html

  * igt@xe_exec_atomic@basic-inc-all:
    - bat-bmg-1:          [INCOMPLETE][15] ([Intel XE#8437] / [Intel XE#8479]) -> [PASS][16] +7 other tests pass
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-bmg-1/igt@xe_exec_atomic@basic-inc-all.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-bmg-1/igt@xe_exec_atomic@basic-inc-all.html

  * igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:
    - bat-wcl-2:          [INCOMPLETE][17] ([Intel XE#8437] / [Intel XE#8479]) -> [PASS][18] +7 other tests pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-wcl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-wcl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:
    - bat-bmg-3:          [INCOMPLETE][19] ([Intel XE#8439] / [Intel XE#8479] / [Intel XE#8499]) -> [PASS][20] +7 other tests pass
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:
    - bat-bmg-3:          [CRASH][21] ([Intel XE#8438] / [Intel XE#8482]) -> [PASS][22]
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:
    - bat-bmg-3:          [CRASH][23] ([Intel XE#8482]) -> [PASS][24] +2 other tests pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html

  * igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:
    - bat-bmg-3:          [INCOMPLETE][25] ([Intel XE#8479] / [Intel XE#8499]) -> [PASS][26]
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html

  * igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:
    - bat-bmg-3:          [FAIL][27] ([Intel XE#8479]) -> [PASS][28]
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html

  
  [Intel XE#8437]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437
  [Intel XE#8438]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8438
  [Intel XE#8439]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439
  [Intel XE#8479]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479
  [Intel XE#8482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482
  [Intel XE#8499]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499


Build changes
-------------

  * IGT: IGT_8987 -> IGT_8988
  * Linux: xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34 -> xe-pw-166336v2

  IGT_8987: 8987
  IGT_8988: 8988
  xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34: b9aebfff5a3c5049500a7bd4573815090a425f34
  xe-pw-166336v2: 166336v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/index.html

--===============7724821058848357501==
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
<tr><td><b>Series:</b></td><td>drm/xe/hw_engine: Fix double-free of managed BO in error path (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166336/">https://patchwork.freedesktop.org/series/166336/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34_BAT -&gt; xe-pw-166336v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-166336v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_ccs@block-copy-compressed:</p>
<ul>
<li>bat-ptl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-ptl-1/igt@xe_ccs@block-copy-compressed.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-ptl-1/igt@xe_ccs@block-copy-compressed.html">PASS</a> +7 other tests pass</li>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-lnl-1/igt@xe_ccs@block-copy-compressed.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-lnl-1/igt@xe_ccs@block-copy-compressed.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy:</p>
<ul>
<li>bat-ptl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-ptl-2/igt@xe_ccs@ctrl-surf-copy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-ptl-2/igt@xe_ccs@ctrl-surf-copy.html">PASS</a> +7 other tests pass</li>
<li>bat-wcl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-wcl-1/igt@xe_ccs@ctrl-surf-copy.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-wcl-1/igt@xe_ccs@ctrl-surf-copy.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-bmg-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-bmg-2/igt@xe_ccs@ctrl-surf-copy@linear-compressed-compfmt0-vram01-vram01.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-atsm-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-atsm-2/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_copy-instance-0-tile-0-vram0-memory.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-adlp-7/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-adlp-7/igt@xe_exec_atomic@basic-dec-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html">PASS</a> +3 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-bmg-1/igt@xe_exec_atomic@basic-inc-all.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-bmg-1/igt@xe_exec_atomic@basic-inc-all.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory:</p>
<ul>
<li>bat-wcl-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-wcl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8437">Intel XE#8437</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-wcl-2/igt@xe_exec_atomic@basic-inc-all@engine-drm_xe_engine_class_render-instance-0-tile-0-system-memory.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8439">Intel XE#8439</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499">Intel XE#8499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-bind.html">PASS</a> +7 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8438">Intel XE#8438</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Intel XE#8482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-basic-defer-mmap.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">CRASH</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8482">Intel XE#8482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-bindexecqueue-userptr-invalidate-race.html">PASS</a> +2 other tests pass</li>
</ul>
</li>
<li>
<p>igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8499">Intel XE#8499</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-bmg-3/igt@xe_exec_basic@multigpu-many-execqueues-many-vm-null-rebind.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz:</p>
<ul>
<li>bat-bmg-3:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34/bat-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/8479">Intel XE#8479</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166336v2/bat-bmg-3/igt@xe_query@multigpu-query-invalid-uc-fw-version-mbz.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8987 -&gt; IGT_8988</li>
<li>Linux: xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34 -&gt; xe-pw-166336v2</li>
</ul>
<p>IGT_8987: 8987<br />
  IGT_8988: 8988<br />
  xe-5304-b9aebfff5a3c5049500a7bd4573815090a425f34: b9aebfff5a3c5049500a7bd4573815090a425f34<br />
  xe-pw-166336v2: 166336v2</p>

</body>
</html>

--===============7724821058848357501==--
