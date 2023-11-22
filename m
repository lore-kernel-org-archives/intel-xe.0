Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 551C1C61D85
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 01:57:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB0CD10E2E1;
	Wed, 22 Nov 2023 01:57:21 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 1AB3E10E2E1;
 Wed, 22 Nov 2023 01:57:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 12075A47DF;
 Wed, 22 Nov 2023 01:57:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3915318152452668777=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "David Kershner" <david.kershner@intel.com>
Date: Wed, 22 Nov 2023 01:57:20 -0000
Message-ID: <170061824003.4726.17235019408008689702@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231120185700.3304104-1-david.kershner@intel.com>
In-Reply-To: <20231120185700.3304104-1-david.kershner@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Add_suppo?=
 =?utf-8?q?rt_for_XeLink_device_=28rev2=29?=
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

--===============3915318152452668777==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for XeLink device (rev2)
URL   : https://patchwork.freedesktop.org/series/122168/
State : success

== Summary ==

CI Bug Log - changes from xe-515-a9ee4928479a5449991149cc38747e8e20376db9_BAT -> xe-pw-122168v2_BAT
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

  Here are the changes found in xe-pw-122168v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#480])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html

  * igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:
    - bat-atsm-2:         NOTRUN -> [SKIP][3] ([Intel XE#288]) +17 other tests skip
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-atsm-2:         [INCOMPLETE][4] ([Intel XE#764]) -> [PASS][5]
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html
    - bat-adlp-7:         [DMESG-WARN][6] ([Intel XE#939]) -> [PASS][7]
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-dg2-oem2:       [DMESG-WARN][8] ([Intel XE#939]) -> [PASS][9]
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-adlp-7:         [FAIL][10] ([Intel XE#480]) -> [PASS][11] +1 other test pass
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:
    - bat-dg2-oem2:       [FAIL][12] ([Intel XE#480]) -> [PASS][13]
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html

  * {igt@xe_create@create-execqueues-noleak}:
    - bat-adlp-7:         [FAIL][14] ([Intel XE#524]) -> [PASS][15]
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html

  * igt@xe_guc_pc@freq_basic_api:
    - bat-adlp-7:         [FAIL][16] ([Intel XE#935]) -> [PASS][17]
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
    - bat-pvc-2:          [FAIL][18] ([Intel XE#935]) -> [PASS][19]
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html
    - bat-dg2-oem2:       [FAIL][20] ([Intel XE#935]) -> [PASS][21]
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html
    - bat-atsm-2:         [FAIL][22] ([Intel XE#935]) -> [PASS][23]
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html

  * igt@xe_guc_pc@freq_fixed_idle:
    - bat-atsm-2:         [FAIL][24] ([Intel XE#940]) -> [PASS][25] +1 other test pass
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html
    - bat-dg2-oem2:       [FAIL][26] ([Intel XE#940]) -> [PASS][27] +1 other test pass
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html

  * igt@xe_guc_pc@freq_range_idle:
    - bat-adlp-7:         [FAIL][28] ([Intel XE#940]) -> [PASS][29] +1 other test pass
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html
   [29]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][30] ([Intel XE#616] / [Intel XE#750]) -> [DMESG-FAIL][31] ([Intel XE#282] / [i915#2017])
   [30]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [31]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750
  [Intel XE#764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/764
  [Intel XE#935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/935
  [Intel XE#939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/939
  [Intel XE#940]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/940
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * Linux: xe-515-a9ee4928479a5449991149cc38747e8e20376db9 -> xe-pw-122168v2

  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-515-a9ee4928479a5449991149cc38747e8e20376db9: a9ee4928479a5449991149cc38747e8e20376db9
  xe-pw-122168v2: 122168v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/index.html

--===============3915318152452668777==
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
<tr><td><b>Series:</b></td><td>Add support for XeLink device (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/122168/">https://patchwork.freedesktop.org/series/122168/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-515-a9ee4928479a5449991149cc38747e8e20376db9_BAT -&gt; xe-pw-122168v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-122168v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_exec_fault_mode@twice-userptr-invalidate-imm:</p>
<ul>
<li>bat-atsm-2:         NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-atsm-2/igt@xe_exec_fault_mode@twice-userptr-invalidate-imm.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +17 other tests skip</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/764">Intel XE#764</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-atsm-2/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/939">Intel XE#939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/939">Intel XE#939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@a-dp3.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-noleak}:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-adlp-7/igt@xe_create@create-execqueues-noleak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_basic_api:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_fixed_idle:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> +1 other test pass</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> +1 other test pass</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_range_idle:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/750">Intel XE#750</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-122168v2/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-515-a9ee4928479a5449991149cc38747e8e20376db9 -&gt; xe-pw-122168v2</li>
</ul>
<p>IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-515-a9ee4928479a5449991149cc38747e8e20376db9: a9ee4928479a5449991149cc38747e8e20376db9<br />
  xe-pw-122168v2: 122168v2</p>

</body>
</html>

--===============3915318152452668777==--
