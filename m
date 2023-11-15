Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C5E5C07548
	for <intel-xe@archiver.kernel.org>; Wed, 15 Nov 2023 03:35:10 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5C2EB10E40A;
	Wed, 15 Nov 2023 03:35:10 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 8CD9510E406;
 Wed, 15 Nov 2023 03:35:07 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 7B8B1AADF5;
 Wed, 15 Nov 2023 03:35:07 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4421817935050110041=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sujaritha Sundaresan" <sujaritha.sundaresan@intel.com>
Date: Wed, 15 Nov 2023 03:35:07 -0000
Message-ID: <170001930749.647.17999801186676933075@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231115030111.770130-1-sujaritha.sundaresan@intel.com>
In-Reply-To: <20231115030111.770130-1-sujaritha.sundaresan@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Creating_?=
 =?utf-8?q?a_base_directory_for_frequency_sysfs?=
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

--===============4421817935050110041==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Creating a base directory for frequency sysfs
URL   : https://patchwork.freedesktop.org/series/126436/
State : failure

== Summary ==

CI Bug Log - changes from xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b_BAT -> xe-pw-126436v1_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-126436v1_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-126436v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-126436v1_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [DMESG-WARN][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
    - bat-dg2-oem2:       [PASS][3] -> [DMESG-WARN][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@xe_guc_pc@freq_basic_api:
    - bat-adlp-7:         [PASS][5] -> [FAIL][6] +2 other tests fail
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html
    - bat-pvc-2:          [PASS][7] -> [FAIL][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html

  * igt@xe_guc_pc@freq_fixed_idle:
    - bat-atsm-2:         [PASS][9] -> [FAIL][10] +2 other tests fail
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html
    - bat-dg2-oem2:       [PASS][11] -> [FAIL][12] +2 other tests fail
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html

  
Known issues
------------

  Here are the changes found in xe-pw-126436v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [PASS][13] -> [FAIL][14] ([Intel XE#480]) +2 other tests fail
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:
    - bat-dg2-oem2:       [FAIL][15] -> [PASS][16]
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:
    - bat-dg2-oem2:       [FAIL][17] ([Intel XE#906]) -> [PASS][18] +1 other test pass
   [17]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html
   [18]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][19] ([Intel XE#282] / [i915#2017]) -> [FAIL][20] ([Intel XE#616] / [Intel XE#750])
   [19]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [20]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#616]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/616
  [Intel XE#750]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/750
  [Intel XE#906]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/906
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017


Build changes
-------------

  * Linux: xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b -> xe-pw-126436v1

  IGT_7588: 328c5873b8f061267fdf86ed32cb5ecc611ba081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b: 2fe82053d916d09ffcc92bc27294c9eed4e4804b
  xe-pw-126436v1: 126436v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/index.html

--===============4421817935050110041==
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
<tr><td><b>Series:</b></td><td>Creating a base directory for frequency sysfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126436/">https://patchwork.freedesktop.org/series/126436/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b_BAT -&gt; xe-pw-126436v1_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-126436v1_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-126436v1_BAT, please notify your bug team (lgci.bug.filing@intel.com) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-126436v1_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">DMESG-WARN</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_basic_api:</p>
<ul>
<li>
<p>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-adlp-7/igt@xe_guc_pc@freq_basic_api.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-pvc-2/igt@xe_guc_pc@freq_basic_api.html">FAIL</a></p>
</li>
</ul>
</li>
<li>
<p>igt@xe_guc_pc@freq_fixed_idle:</p>
<ul>
<li>
<p>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-atsm-2/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> +2 other tests fail</p>
</li>
<li>
<p>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-dg2-oem2/igt@xe_guc_pc@freq_fixed_idle.html">FAIL</a> +2 other tests fail</p>
</li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126436v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) +2 other tests fail</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@c-dp3.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/906">Intel XE#906</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@d-dp3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126436v1/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/616">Intel XE#616</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/750">Intel XE#750</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b -&gt; xe-pw-126436v1</li>
</ul>
<p>IGT_7588: 328c5873b8f061267fdf86ed32cb5ecc611ba081 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-490-2fe82053d916d09ffcc92bc27294c9eed4e4804b: 2fe82053d916d09ffcc92bc27294c9eed4e4804b<br />
  xe-pw-126436v1: 126436v1</p>

</body>
</html>

--===============4421817935050110041==--
