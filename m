Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1DCDC25B74
	for <intel-xe@archiver.kernel.org>; Mon, 27 May 2024 18:28:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 009E810E0D8;
	Mon, 27 May 2024 18:28:18 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12A6E10E0D8;
 Mon, 27 May 2024 18:28:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5679103569915219277=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_VF=3A_Setup_VRAM_based_on_receiv?=
 =?utf-8?q?ed_config_data?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 May 2024 18:28:16 -0000
Message-ID: <171683449607.2213173.16218441385533036073@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240527173554.1108-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240527173554.1108-1-michal.wajdeczko@intel.com>
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

--===============5679103569915219277==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: VF: Setup VRAM based on received config data
URL   : https://patchwork.freedesktop.org/series/134097/
State : failure

== Summary ==

CI Bug Log - changes from xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84_BAT -> xe-pw-134097v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-134097v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-134097v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-134097v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@xe_live_ktest@xe_migrate:
    - bat-atsm-2:         NOTRUN -> [SKIP][1] +3 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html

  * igt@xe_module_load@load:
    - bat-atsm-2:         [PASS][2] -> [FAIL][3]
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@xe_module_load@load.html
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@xe_module_load@load.html

  
#### Warnings ####

  * igt@kms_addfb_basic@invalid-set-prop-any:
    - bat-atsm-2:         [SKIP][4] ([i915#6077]) -> [SKIP][5] +30 other tests skip
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html

  * igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:
    - bat-atsm-2:         [SKIP][6] ([Intel XE#1024] / [Intel XE#782]) -> [SKIP][7] +5 other tests skip
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html

  * igt@kms_dsc@dsc-basic:
    - bat-atsm-2:         [SKIP][8] ([Intel XE#1024] / [Intel XE#784]) -> [SKIP][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_dsc@dsc-basic.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html

  * igt@kms_flip@basic-flip-vs-modeset:
    - bat-atsm-2:         [SKIP][10] ([Intel XE#1024] / [Intel XE#947]) -> [SKIP][11] +3 other tests skip
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-atsm-2:         [SKIP][12] ([Intel XE#540]) -> [SKIP][13] +3 other tests skip
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@kms_frontbuffer_tracking@basic:
    - bat-atsm-2:         [SKIP][14] ([Intel XE#1024] / [Intel XE#783]) -> [SKIP][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html

  * igt@kms_pipe_crc_basic@nonblocking-crc:
    - bat-atsm-2:         [SKIP][16] ([i915#1836]) -> [SKIP][17] +6 other tests skip
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html

  * igt@kms_prop_blob@basic:
    - bat-atsm-2:         [SKIP][18] ([Intel XE#780]) -> [SKIP][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_prop_blob@basic.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_prop_blob@basic.html

  * igt@kms_psr@psr-primary-page-flip:
    - bat-atsm-2:         [SKIP][20] ([Intel XE#1024]) -> [SKIP][21] +2 other tests skip
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html

  
Known issues
------------

  Here are the changes found in xe-pw-134097v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_compute_mode@twice-userptr-invalidate:
    - bat-atsm-2:         [PASS][22] -> [SKIP][23] ([Intel XE#1130]) +52 other tests skip
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         NOTRUN -> [SKIP][24] ([Intel XE#1130]) +138 other tests skip
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  
#### Warnings ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue:
    - bat-atsm-2:         [DMESG-WARN][25] -> [SKIP][26] ([Intel XE#1130])
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1024]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024
  [Intel XE#1130]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130
  [Intel XE#1908]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1908
  [Intel XE#1939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1939
  [Intel XE#540]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/540
  [Intel XE#780]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/780
  [Intel XE#782]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/782
  [Intel XE#783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/783
  [Intel XE#784]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/784
  [Intel XE#947]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/947
  [i915#1836]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836
  [i915#6077]: https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077


Build changes
-------------

  * Linux: xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84 -> xe-pw-134097v1

  IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84: 0f0c00c367c8a8621a07443664d5f9a266889e84
  xe-pw-134097v1: 134097v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/index.html

--===============5679103569915219277==
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
<tr><td><b>Series:</b></td><td>VF: Setup VRAM based on received config data</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134097/">https://patchwork.freedesktop.org/series/134097/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84_BAT -&gt; xe-pw-134097v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-134097v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-134097v1_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-134097v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@xe_live_ktest@xe_migrate:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@xe_live_ktest@xe_migrate.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@xe_module_load@load.html">FAIL</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>
<p>igt@kms_addfb_basic@invalid-set-prop-any:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/6077">i915#6077</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_addfb_basic@invalid-set-prop-any.html">SKIP</a> +30 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-after-cursor-atomic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/782">Intel XE#782</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_cursor_legacy@basic-flip-after-cursor-atomic.html">SKIP</a> +5 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_dsc@dsc-basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/784">Intel XE#784</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_dsc@dsc-basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-modeset:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/947">Intel XE#947</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_flip@basic-flip-vs-modeset.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/540">Intel XE#540</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_force_connector_basic@force-connector-state.html">SKIP</a> +3 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_frontbuffer_tracking@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/783">Intel XE#783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_frontbuffer_tracking@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_pipe_crc_basic@nonblocking-crc:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/i915/kernel/-/issues/1836">i915#1836</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_pipe_crc_basic@nonblocking-crc.html">SKIP</a> +6 other tests skip</li>
</ul>
</li>
<li>
<p>igt@kms_prop_blob@basic:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/780">Intel XE#780</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_prop_blob@basic.html">SKIP</a></li>
</ul>
</li>
<li>
<p>igt@kms_psr@psr-primary-page-flip:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1024">Intel XE#1024</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@kms_psr@psr-primary-page-flip.html">SKIP</a> +2 other tests skip</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-134097v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-userptr-invalidate:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-userptr-invalidate.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +52 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>) +138 other tests skip</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_compute_mode@twice-bindexecqueue:<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134097v1/bat-atsm-2/igt@xe_exec_compute_mode@twice-bindexecqueue.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1130">Intel XE#1130</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84 -&gt; xe-pw-134097v1</li>
</ul>
<p>IGT_7871: 1d7b961235e345db20933c057f265898e2e96fd2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1351-0f0c00c367c8a8621a07443664d5f9a266889e84: 0f0c00c367c8a8621a07443664d5f9a266889e84<br />
  xe-pw-134097v1: 134097v1</p>

</body>
</html>

--===============5679103569915219277==--
