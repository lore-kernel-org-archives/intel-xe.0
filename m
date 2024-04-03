Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D09E4CD128A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Apr 2024 15:07:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8FE8D112761;
	Wed,  3 Apr 2024 15:07:08 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CFD2112761;
 Wed,  3 Apr 2024 15:07:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4729725278659743754=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/display=3A_check_for_erro?=
 =?utf-8?q?r_on_drmm=5Fmutex=5Finit_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Apr 2024 15:07:07 -0000
Message-ID: <171215682744.1171321.13847555633515079322@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240403140105.1306622-1-arun.r.murthy@intel.com>
In-Reply-To: <20240403140105.1306622-1-arun.r.murthy@intel.com>
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

--===============4729725278659743754==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: check for error on drmm_mutex_init (rev4)
URL   : https://patchwork.freedesktop.org/series/131300/
State : success

== Summary ==

CI Bug Log - changes from xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade_BAT -> xe-pw-131300v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-131300v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [PASS][1] -> [SKIP][2] ([Intel XE#1136])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [PASS][3] -> [SKIP][4] ([i915#2575]) +50 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [PASS][5] -> [SKIP][6] ([Intel XE#1134])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][7] -> [SKIP][8] ([Intel XE#1130]) +133 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-dg2-oem2:       [PASS][9] -> [SKIP][10] ([Intel XE#1245])
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       [PASS][11] -> [SKIP][12] ([Intel XE#1245] / [Intel XE#455]) +5 other tests skip
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][13] -> [FAIL][14] ([Intel XE#1244])
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@xe_module_load@load.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][15] ([Intel XE#623]) -> [SKIP][16] ([i915#2575])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][17] ([Intel XE#455]) -> [SKIP][18] ([Intel XE#1134])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][19] ([i915#5274]) -> [SKIP][20] ([i915#2575])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][21] ([Intel XE#929]) -> [SKIP][22] ([Intel XE#1134]) +2 other tests skip
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-dg2-oem2:       [SKIP][23] ([Intel XE#288]) -> [SKIP][24] ([Intel XE#1130]) +22 other tests skip
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][25] ([Intel XE#255]) -> [SKIP][26] ([Intel XE#1130])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][27] ([Intel XE#977]) -> [SKIP][28] ([Intel XE#1130])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][29] ([Intel XE#979]) -> [SKIP][30] ([Intel XE#1130]) +1 other test skip
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
  [Intel XE#1136]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1136
  [Intel XE#1244]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1244
  [Intel XE#1245]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1245
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/intel/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/intel/issues/5274


Build changes
-------------

  * Linux: xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade -> xe-pw-131300v4

  IGT_7797: e88ebc17ec12b503aab380b08c1213af9cc7a97c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade: 23e6199ddb938adf30f3174971cd36160b8f0ade
  xe-pw-131300v4: 131300v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/index.html

--===============4729725278659743754==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: check for error on drmm_mutex_init (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131300/">https://patchwork.freedesktop.org/series/131300/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade_BAT -&gt; xe-pw-131300v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131300v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1136">Intel XE#1136</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +133 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1245">Intel XE#1245</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1245">Intel XE#1245</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1244">Intel XE#1244</a>)</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +22 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v4/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade -&gt; xe-pw-131300v4</li>
</ul>
<p>IGT_7797: e88ebc17ec12b503aab380b08c1213af9cc7a97c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1031-23e6199ddb938adf30f3174971cd36160b8f0ade: 23e6199ddb938adf30f3174971cd36160b8f0ade<br />
  xe-pw-131300v4: 131300v4</p>

</body>
</html>

--===============4729725278659743754==--
