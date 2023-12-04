Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8076DC4167B
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 17:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DB46110E209;
	Mon,  4 Dec 2023 17:49:14 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [IPv6:2610:10:20:722:a800:ff:feee:56cf])
 by gabe.freedesktop.org (Postfix) with ESMTP id 2FD7810E209;
 Mon,  4 Dec 2023 17:49:09 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 1DC39AA3D8;
 Mon,  4 Dec 2023 17:49:09 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3192996273503970462=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Date: Mon, 04 Dec 2023 17:49:09 -0000
Message-ID: <170171214911.20594.3324611010797299322@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231204164047.1166360-1-jouni.hogander@intel.com>
In-Reply-To: <20231204164047.1166360-1-jouni.hogander@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=97_CI=2EBAT=3A_failure_for_Intel=5Ff?=
 =?utf-8?q?b=2Ec_refactoring_=28rev4=29?=
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

--===============3192996273503970462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Intel_fb.c refactoring (rev4)
URL   : https://patchwork.freedesktop.org/series/126505/
State : failure

== Summary ==

CI Bug Log - changes from xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87_BAT -> xe-pw-126505v4_BAT
====================================================

Summary
-------

  **FAILURE**

  Serious unknown changes coming with xe-pw-126505v4_BAT absolutely need to be
  verified manually.
  
  If you think the reported changes have nothing to do with the changes
  introduced in xe-pw-126505v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them
  to document this new failure mode, which will reduce false positives in CI.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts

Possible new issues
-------------------

  Here are the unknown changes that may have been introduced in xe-pw-126505v4_BAT:

### IGT changes ###

#### Possible regressions ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-adlp-7:         [PASS][1] -> [INCOMPLETE][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html

  
Known issues
------------

  Here are the changes found in xe-pw-126505v4_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@core_hotunplug@unbind-rebind:
    - bat-dg2-oem2:       [PASS][3] -> [INCOMPLETE][4] ([Intel XE#764])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html

  * igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:
    - bat-adlp-7:         [PASS][5] -> [FAIL][6] ([i915#2346])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html

  
#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:
    - bat-dg2-oem2:       [FAIL][7] ([Intel XE#480]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [FAIL][9] ([Intel XE#480]) -> [PASS][10] +1 other test pass
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [FAIL][11] ([Intel XE#524]) -> [PASS][12]
   [11]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [12]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [DMESG-WARN][13] -> [PASS][14]
   [13]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
   [14]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  
#### Warnings ####

  * igt@kms_frontbuffer_tracking@basic:
    - bat-adlp-7:         [DMESG-FAIL][15] ([Intel XE#282] / [i915#2017]) -> [DMESG-WARN][16] ([Intel XE#282] / [i915#2017])
   [15]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html
   [16]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#282]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/282
  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524
  [Intel XE#764]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/764
  [i915#2017]: https://gitlab.freedesktop.org/drm/intel/issues/2017
  [i915#2346]: https://gitlab.freedesktop.org/drm/intel/issues/2346


Build changes
-------------

  * IGT: IGT_7615 -> IGT_7617
  * Linux: xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87 -> xe-pw-126505v4

  IGT_7615: 2abe4128f4f8ad1130b9c7012536543243c6e3d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7617: 15eebc01e498c61f96928fa7fa3a0d53bdead193 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87: 3cf2df8b17f8be54008581a37361e6ec36dc3d87
  xe-pw-126505v4: 126505v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/index.html

--===============3192996273503970462==
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
<tr><td><b>Series:</b></td><td>Intel_fb.c refactoring (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/126505/">https://patchwork.freedesktop.org/series/126505/</a></td></tr>
<tr><td><b>State:</b></td><td>failure</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87_BAT -&gt; xe-pw-126505v4_BAT</h1>
<h2>Summary</h2>
<p><strong>FAILURE</strong></p>
<p>Serious unknown changes coming with xe-pw-126505v4_BAT absolutely need to be<br />
  verified manually.</p>
<p>If you think the reported changes have nothing to do with the changes<br />
  introduced in xe-pw-126505v4_BAT, please notify your bug team (I915-ci-infra@lists.freedesktop.org) to allow them<br />
  to document this new failure mode, which will reduce false positives in CI.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Possible new issues</h2>
<p>Here are the unknown changes that may have been introduced in xe-pw-126505v4_BAT:</p>
<h3>IGT changes</h3>
<h4>Possible regressions</h4>
<ul>
<li>igt@core_hotunplug@unbind-rebind:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/bat-adlp-7/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a></li>
</ul>
</li>
</ul>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-126505v4_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@core_hotunplug@unbind-rebind:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/bat-dg2-oem2/igt@core_hotunplug@unbind-rebind.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/764">Intel XE#764</a>)</li>
</ul>
</li>
<li>
<p>igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/bat-adlp-7/igt@kms_cursor_legacy@basic-flip-before-cursor-varying-size.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/intel/issues/2346">i915#2346</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">PASS</a></li>
</ul>
</li>
</ul>
<h4>Warnings</h4>
<ul>
<li>igt@kms_frontbuffer_tracking@basic:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-126505v4/bat-adlp-7/igt@kms_frontbuffer_tracking@basic.html">DMESG-WARN</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/282">Intel XE#282</a> / <a href="https://gitlab.freedesktop.org/drm/intel/issues/2017">i915#2017</a>)</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7615 -&gt; IGT_7617</li>
<li>Linux: xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87 -&gt; xe-pw-126505v4</li>
</ul>
<p>IGT_7615: 2abe4128f4f8ad1130b9c7012536543243c6e3d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7617: 15eebc01e498c61f96928fa7fa3a0d53bdead193 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87: 3cf2df8b17f8be54008581a37361e6ec36dc3d87<br />
  xe-pw-126505v4: 126505v4</p>

</body>
</html>

--===============3192996273503970462==--
