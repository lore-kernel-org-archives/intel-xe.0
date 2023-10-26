Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42020C25B6B
	for <intel-xe@archiver.kernel.org>; Thu, 26 Oct 2023 11:04:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC0DB10E7A9;
	Thu, 26 Oct 2023 11:04:32 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id F2B4D10E7A9;
 Thu, 26 Oct 2023 11:04:30 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id CA79AA02F0;
 Thu, 26 Oct 2023 11:04:30 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8184537467839179305=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Date: Thu, 26 Oct 2023 11:04:30 -0000
Message-ID: <169831827080.20472.16257698596858132774@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231026101536.5509-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20231026101536.5509-1-thomas.hellstrom@linux.intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_series_st?=
 =?utf-8?q?arting_with_=5BCI=2C01/10=5D_drm/gpuvm=3A_convert_WARN=28=29_to?=
 =?utf-8?q?_drm=5FWARN=28=29_variants?=
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

--===============8184537467839179305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,01/10] drm/gpuvm: convert WARN() to drm_WARN() variants
URL   : https://patchwork.freedesktop.org/series/125627/
State : failure

== Summary ==

CI Bug Log - changes from xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df_BAT -> xe-pw-125627v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-125627v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-125627v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (3 -> 4)
------------------------------

  Additional (1): bat-dg2-oem2 

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-125627v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-atsm-2:         [PASS][3] -> [FAIL][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  
#### Warnings ####

  * igt@xe_evict@evict-small-external-cm:
    - bat-pvc-2:          [DMESG-FAIL][5] ([Intel XE#482]) -> [FAIL][6] +2 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html

  
New tests
---------

  New tests have been introduced between xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df_BAT and xe-pw-125627v1_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest:
    - Statuses :
    - Exec time: [None] s

  

Known issues
------------

  Here are the changes found in xe-pw-125627v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       NOTRUN -> [INCOMPLETE][7] ([Intel XE#764])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
    - bat-atsm-2:         [PASS][8] -> [INCOMPLETE][9] ([Intel XE#764])
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][10] ([Intel XE#623])
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_addfb_basic@basic-y-tiled-legacy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][11] ([Intel XE#624])
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html

  * igt@kms_addfb_basic@tile-pitch-mismatch:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][12] ([Intel XE#609]) +1 other test fail
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-adlp-7:         [PASS][13] -> [FAIL][14] ([i915#2346])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][15] ([Intel XE#423])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [PASS][16] -> [FAIL][17] ([Intel XE#480]) +2 other tests fail
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][18] ([i915#5274])
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       NOTRUN -> [FAIL][19] ([Intel XE#608])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_psr@primary_page_flip:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][20] ([Intel XE#535]) +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html

  * igt@xe_compute@compute-square:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][21] ([Intel XE#672])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@xe_compute@compute-square.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][22] ([Intel XE#255])
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][23] ([Intel XE#282]) -> [DMESG-FAIL][24] ([Intel XE#282] / [i915#2017])
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_evict@evict-beng-small-cm:
    - bat-pvc-2:          [DMESG-FAIL][25] ([Intel XE#482]) -> [FAIL][26] ([Intel XE#389])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html

  
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#389]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/389
  [Intel XE#423]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/423
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#482]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/482
  [Intel XE#535]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/535
  [Intel XE#608]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/608
  [Intel XE#609]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/609
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#624]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/624
  [Intel XE#672]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/672
  [Intel XE#764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/764
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274


Build changes
-------------

  * IGT: IGT_7557 -> IGT_7558
  * Linux: xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df -> xe-pw-125627v1

  IGT_7557: 18fc864d68d382847596594d7eb3488f2c8fb45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7558: f347c169c0ee259f5ac3e58d8524f1e4127d061f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df: 4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df
  xe-pw-125627v1: 125627v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/index.html

--===============8184537467839179305==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,01/10] drm/gpuvm: convert WARN() to drm_WARN() variants</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/125627/">https://patchwork.freedesktop.org/series/125627/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df_BAT -&gt; xe-pw-125627v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-125627v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-125627v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (3 -&gt; 4)</h2>
<p>Additional (1): bat-dg2-oem2 </p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-125627v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-atsm-2/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_evict@evict-small-external-cm:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-pvc-2/igt@xe_evict@evict-small-external-cm.html">FAIL</a> +2 other tests fail</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df_BAT and xe-pw-125627v1_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest:<ul>
<li>Statuses :</li>
<li>Exec time: [None] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-125627v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/764">Intel XE#764</a>)</p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/764">Intel XE#764</a>)</p>
</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@basic-y-tiled-legacy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@kms_addfb_basic@basic-y-tiled-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/624">Intel XE#624</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@tile-pitch-mismatch:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@kms_addfb_basic@tile-pitch-mismatch.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/609">Intel XE#609</a>) +1 other test fail</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/423">Intel XE#423</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +2 other tests fail</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/608">Intel XE#608</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@primary_page_flip:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@kms_psr@primary_page_flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/535">Intel XE#535</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@xe_compute@compute-square.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/672">Intel XE#672</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-beng-small-cm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/482">Intel XE#482</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-125627v1/bat-pvc-2/igt@xe_evict@evict-beng-small-cm.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/389">Intel XE#389</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7557 -&gt; IGT_7558</li>
<li>Linux: xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df -&gt; xe-pw-125627v1</li>
</ul>
<p>IGT_7557: 18fc864d68d382847596594d7eb3488f2c8fb45e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7558: f347c169c0ee259f5ac3e58d8524f1e4127d061f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-449-4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df: 4c7ed0ef2d582ae173d9a2062ee6f7360d1aa1df<br />
  xe-pw-125627v1: 125627v1</p>

</body>
</html>

--===============8184537467839179305==--
