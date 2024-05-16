Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 61C75C25B74
	for <intel-xe@archiver.kernel.org>; Thu, 16 May 2024 19:16:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D60E210EDA4;
	Thu, 16 May 2024 19:16:29 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A765810EDA1;
 Thu, 16 May 2024 19:16:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2539954752057118681=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_xe_bo_shrinker_and_exhaustive_ev?=
 =?utf-8?q?iction_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 May 2024 19:16:28 -0000
Message-ID: <171588698868.2122741.8494117715714071079@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240516182339.3482-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240516182339.3482-1-thomas.hellstrom@linux.intel.com>
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

--===============2539954752057118681==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: xe bo shrinker and exhaustive eviction (rev4)
URL   : https://patchwork.freedesktop.org/series/133643/
State : failure

== Summary ==

CI Bug Log - changes from xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8_BAT -> xe-pw-133643v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-133643v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-133643v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-133643v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@xe_compute@compute-square:
    - bat-pvc-2:          [PASS][3] -> [INCOMPLETE][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-pvc-2/igt@xe_compute@compute-square.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-pvc-2/igt@xe_compute@compute-square.html
    - bat-atsm-2:         [PASS][5] -> [INCOMPLETE][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-atsm-2/igt@xe_compute@compute-square.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-atsm-2/igt@xe_compute@compute-square.html

  * igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:
    - bat-dg2-oem2:       [PASS][7] -> [SKIP][8] +2 other tests skip
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html

  * igt@xe_module_load@load:
    - bat-dg2-oem2:       [PASS][9] -> [FAIL][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@xe_module_load@load.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_module_load@load.html

  
#### Suppressed ####

  The following results come from untrusted machines, tests, or statuses.
  They do not affect the overall result.

  * igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1:
    - {bat-lnl-1}:        [PASS][11] -> [DMESG-WARN][12] +189 other tests dmesg-warn
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1.html

  * igt@xe_pat@pat-index-xe2:
    - {bat-lnl-1}:        [PASS][13] -> [INCOMPLETE][14] +1 other test incomplete
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-lnl-1/igt@xe_pat@pat-index-xe2.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-lnl-1/igt@xe_pat@pat-index-xe2.html

  
New tests
---------

  New tests have been introduced between xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8_BAT and xe-pw-133643v4_BAT:

### New IGT tests (1) ###

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - Statuses : 1 skip(s)
    - Exec time: [0.01] s

  

Known issues
------------

  Here are the changes found in xe-pw-133643v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_addfb_basic@bad-pitch-128:
    - bat-dg2-oem2:       [PASS][15] -> [SKIP][16] ([i915#2575]) +50 other tests skip
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-dg2-oem2:       [PASS][17] -> [SKIP][18] ([Intel XE#1134])
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html

  * igt@xe_intel_bb@create-in-region:
    - bat-dg2-oem2:       [PASS][19] -> [SKIP][20] ([Intel XE#1130]) +155 other tests skip
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit (NEW):
    - bat-dg2-oem2:       NOTRUN -> [SKIP][21] ([Intel XE#455])
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  * igt@xe_live_ktest@xe_migrate:
    - bat-dg2-oem2:       [PASS][22] -> [SKIP][23] ([Intel XE#455]) +4 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html

  
#### Warnings ####

  * igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:
    - bat-dg2-oem2:       [SKIP][24] ([Intel XE#623]) -> [SKIP][25] ([i915#2575])
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html

  * igt@kms_dsc@dsc-basic:
    - bat-dg2-oem2:       [SKIP][26] ([Intel XE#455]) -> [SKIP][27] ([Intel XE#1134])
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html

  * igt@kms_force_connector_basic@prune-stale-modes:
    - bat-dg2-oem2:       [SKIP][28] ([i915#5274]) -> [SKIP][29] ([i915#2575])
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html

  * igt@kms_psr@psr-cursor-plane-move:
    - bat-dg2-oem2:       [SKIP][30] ([Intel XE#929]) -> [SKIP][31] ([Intel XE#1134]) +2 other tests skip
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-dg2-oem2:       [SKIP][32] ([Intel XE#288]) -> [SKIP][33] ([Intel XE#1130]) +32 other tests skip
   [32]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html
   [33]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_huc_copy@huc_copy:
    - bat-dg2-oem2:       [SKIP][34] ([Intel XE#255]) -> [SKIP][35] ([Intel XE#1130])
   [34]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html
   [35]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html

  * igt@xe_pat@pat-index-xe2:
    - bat-dg2-oem2:       [SKIP][36] ([Intel XE#977]) -> [SKIP][37] ([Intel XE#1130])
   [36]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html
   [37]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html

  * igt@xe_pat@pat-index-xehpc:
    - bat-dg2-oem2:       [SKIP][38] ([Intel XE#979]) -> [SKIP][39] ([Intel XE#1130]) +1 other test skip
   [38]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html
   [39]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1134]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134
  [Intel XE#1192]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1192
  [Intel XE#255]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/255
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#455]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/455
  [Intel XE#623]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/623
  [Intel XE#929]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/929
  [Intel XE#977]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/977
  [Intel XE#979]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/979
  [i915#2575]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575
  [i915#5274]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274


Build changes
-------------

  * IGT: IGT_7858 -> IGT_7859
  * Linux: xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8 -> xe-pw-133643v4

  IGT_7858: 133c90d6aabcd90871e36946317c90ee83c2f847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7859: 7859
  xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8: 01e8fd3a8450d33ddf644820ffa8de5369e6a7a8
  xe-pw-133643v4: 133643v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/index.html

--===============2539954752057118681==
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
<tr><td><b>Series:</b></td><td>xe bo shrinker and exhaustive eviction (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133643/">https://patchwork.freedesktop.org/series/133643/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8_BAT -&gt; xe-pw-133643v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-133643v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-133643v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-133643v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_compute@compute-square:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-pvc-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-pvc-2/igt@xe_compute@compute-square.html">INCOMPLETE</a></li>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-atsm-2/igt@xe_compute@compute-square.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-atsm-2/igt@xe_compute@compute-square.html">INCOMPLETE</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_ccs_migrate_kunit.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_module_load@load.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Suppressed</h4>
<p>The following results come from untrusted machines, tests, or statuses.<br />
  They do not affect the overall result.</p>
<ul>
<li>
<p>igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-lnl-1/igt@kms_pipe_crc_basic@compare-crc-sanitycheck-xr24@pipe-c-edp-1.html">DMESG-WARN</a> +189 other tests dmesg-warn</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>{bat-lnl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-lnl-1/igt@xe_pat@pat-index-xe2.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-lnl-1/igt@xe_pat@pat-index-xe2.html">INCOMPLETE</a> +1 other test incomplete</li>
</ul>
</li>
</ul>
<h2>New tests</h2>
<p>New tests have been introduced between xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8_BAT and xe-pw-133643v4_BAT:</p>
<h3>New IGT tests (1)</h3>
<ul>
<li>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:<ul>
<li>Statuses : 1 skip(s)</li>
<li>Exec time: [0.01] s</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-133643v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@bad-pitch-128:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@kms_addfb_basic@bad-pitch-128.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>) +50 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_intel_bb@create-in-region:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_intel_bb@create-in-region.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +155 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit (NEW):</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) +4 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@addfb25-y-tiled-small-legacy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/623">Intel XE#623</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@kms_addfb_basic@addfb25-y-tiled-small-legacy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/455">Intel XE#455</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@prune-stale-modes:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/5274">i915#5274</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@kms_force_connector_basic@prune-stale-modes.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/2575">i915#2575</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-cursor-plane-move:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/929">Intel XE#929</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@kms_psr@psr-cursor-plane-move.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1134">Intel XE#1134</a>) +2 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_huc_copy@huc_copy:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/255">Intel XE#255</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_huc_copy@huc_copy.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xe2:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/977">Intel XE#977</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_pat@pat-index-xe2.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pat@pat-index-xehpc:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/979">Intel XE#979</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133643v4/bat-dg2-oem2/igt@xe_pat@pat-index-xehpc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +1 other test skip</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7858 -&gt; IGT_7859</li>
<li>Linux: xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8 -&gt; xe-pw-133643v4</li>
</ul>
<p>IGT_7858: 133c90d6aabcd90871e36946317c90ee83c2f847 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7859: 7859<br />
  xe-1301-01e8fd3a8450d33ddf644820ffa8de5369e6a7a8: 01e8fd3a8450d33ddf644820ffa8de5369e6a7a8<br />
  xe-pw-133643v4: 133643v4</p>

</body>
</html>

--===============2539954752057118681==--
