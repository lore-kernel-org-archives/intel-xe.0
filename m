Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1FC5BC61D85
	for <intel-xe@archiver.kernel.org>; Wed, 22 Nov 2023 00:19:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C1EA210E5B1;
	Wed, 22 Nov 2023 00:19:23 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id B7A0710E5B1;
 Wed, 22 Nov 2023 00:19:21 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id A39FDAADD2;
 Wed, 22 Nov 2023 00:19:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2262051952464066066=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Wed, 22 Nov 2023 00:19:21 -0000
Message-ID: <170061236163.4725.15019587767084012779@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231120121428.3576569-1-tejas.upadhyay@intel.com>
In-Reply-To: <20231120121428.3576569-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe?=
 =?utf-8?q?2=3A_Add_workaround_14017421178?=
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

--===============2262051952464066066==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Add workaround 14017421178
URL   : https://patchwork.freedesktop.org/series/126647/
State : success

== Summary ==

CI Bug Log - changes from xe-515-a9ee4928479a5449991149cc38747e8e20376db9_BAT -> xe-pw-126647v1_BAT
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

  Here are the changes found in xe-pw-126647v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:
    - bat-adlp-7:         [PASS][1] -> [FAIL][2] ([Intel XE#480])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html

  
#### Possible fixes ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [DMESG-WARN][3] ([Intel XE#939]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-dg2-oem2:       [DMESG-WARN][5] ([Intel XE#939]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_flip@basic-flip-vs-wf_vblank:
    - bat-dg2-oem2:       [FAIL][7] ([Intel XE#480]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:
    - bat-adlp-7:         [FAIL][9] ([Intel XE#480]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [FAIL][11] ([Intel XE#524]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  * igt@xe_guc_pc@freq_basic_api:
    - bat-adlp-7:         [FAIL][13] ([Intel XE#935]) -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
    - bat-pvc-2:          [FAIL][15] ([Intel XE#935]) -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html
    - bat-dg2-oem2:       [FAIL][17] ([Intel XE#935]) -> [PASS][18]
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html
    - bat-atsm-2:         [FAIL][19] ([Intel XE#935]) -> [PASS][20]
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html

  * igt@xe_guc_pc@freq_fixed_idle:
    - bat-atsm-2:         [FAIL][21] ([Intel XE#940]) -> [PASS][22] +1 other test pass
   [21]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html
   [22]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html
    - bat-dg2-oem2:       [FAIL][23] ([Intel XE#940]) -> [PASS][24] +1 other test pass
   [23]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html
   [24]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html

  * igt@xe_guc_pc@freq_range_idle:
    - bat-adlp-7:         [FAIL][25] ([Intel XE#940]) -> [PASS][26] +1 other test pass
   [25]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html
   [26]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [FAIL][27] ([Intel XE#616] / [Intel XE#750]) -> [DMESG-FAIL][28] ([Intel XE#282] / [i915#2017])
   [27]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [28]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750
  [Intel XE#935]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/935
  [Intel XE#939]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/939
  [Intel XE#940]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/940
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * Linux: xe-515-a9ee4928479a5449991149cc38747e8e20376db9 -> xe-pw-126647v1

  IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-515-a9ee4928479a5449991149cc38747e8e20376db9: a9ee4928479a5449991149cc38747e8e20376db9
  xe-pw-126647v1: 126647v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/index.html

--===============2262051952464066066==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Add workaround 14017421178</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126647/">https://patchwork.freedesktop.org/series/126647/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-515-a9ee4928479a5449991149cc38747e8e20376db9_BAT -&gt; xe-pw-126647v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126647v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@a-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/939">Intel XE#939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/939">Intel XE#939</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@b-edp1.html">PASS</a></li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_basic_api:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-dg2-oem2/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/935">Intel XE#935</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-atsm-2/igt@xe_guc_pc@freq_basic_api.html">PASS</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_fixed_idle:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> +1 other test pass</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> +1 other test pass</p>
</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_range_idle:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/940">Intel XE#940</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-adlp-7/igt@xe_guc_pc@freq_range_idle.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-515-a9ee4928479a5449991149cc38747e8e20376db9/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/750">Intel XE#750</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126647v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-515-a9ee4928479a5449991149cc38747e8e20376db9 -&gt; xe-pw-126647v1</li>
</ul>
<p>IGT_7595: cfa00d99b1dfa0621ea552d1ed54907798da1a1a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-515-a9ee4928479a5449991149cc38747e8e20376db9: a9ee4928479a5449991149cc38747e8e20376db9<br />
  xe-pw-126647v1: 126647v1</p>

</body>
</html>

--===============2262051952464066066==--
