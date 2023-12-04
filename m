Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D625C10DCE
	for <intel-xe@archiver.kernel.org>; Mon,  4 Dec 2023 16:18:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA16910E331;
	Mon,  4 Dec 2023 16:18:25 +0000 (UTC)
Received: from emeril.freedesktop.org (emeril.freedesktop.org
 [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTP id 5285A10E397;
 Mon,  4 Dec 2023 16:18:20 +0000 (UTC)
Received: from emeril.freedesktop.org (localhost [127.0.0.1])
 by emeril.freedesktop.org (Postfix) with ESMTP id 73D3EAA917;
 Mon,  4 Dec 2023 16:18:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7118647630764124263=="
MIME-Version: 1.0
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Date: Mon, 04 Dec 2023 16:18:19 -0000
Message-ID: <170170669943.20595.11677780967754407278@emeril.freedesktop.org>
X-Patchwork-Hint: ignore
References: <20231204142738.794980-1-tejas.upadhyay@intel.com>
In-Reply-To: <20231204142738.794980-1-tejas.upadhyay@intel.com>
Subject: [Intel-xe] =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/xe?=
 =?utf-8?q?2=3A_Add_workaround_18032095049?=
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

--===============7118647630764124263==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe2: Add workaround 18032095049
URL   : https://patchwork.freedesktop.org/series/127304/
State : success

== Summary ==

CI Bug Log - changes from xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87_BAT -> xe-pw-127304v1_BAT
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

  Here are the changes found in xe-pw-127304v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:
    - bat-dg2-oem2:       [FAIL][1] ([Intel XE#480]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127304v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html

  * igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:
    - bat-adlp-7:         [FAIL][3] ([Intel XE#480]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127304v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html

  * {igt@xe_create@create-execqueues-leak}:
    - bat-atsm-2:         [FAIL][5] ([Intel XE#524]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-atsm-2/igt@xe_create@create-execqueues-leak.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127304v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html

  * igt@xe_evict@evict-mixed-threads-small-multi-vm:
    - bat-pvc-2:          [DMESG-WARN][7] -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127304v1/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#480]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/480
  [Intel XE#524]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/524


Build changes
-------------

  * IGT: IGT_7615 -> IGT_7617
  * Linux: xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87 -> xe-pw-127304v1

  IGT_7615: 2abe4128f4f8ad1130b9c7012536543243c6e3d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7617: 15eebc01e498c61f96928fa7fa3a0d53bdead193 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87: 3cf2df8b17f8be54008581a37361e6ec36dc3d87
  xe-pw-127304v1: 127304v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127304v1/index.html

--===============7118647630764124263==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe2: Add workaround 18032095049</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/127304/">https://patchwork.freedesktop.org/series/127304/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127304v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127304v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87_BAT -&gt; xe-pw-127304v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-127304v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127304v1/bat-dg2-oem2/igt@kms_flip@basic-flip-vs-wf_vblank@b-dp3.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1:</p>
<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/480">Intel XE#480</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127304v1/bat-adlp-7/igt@kms_flip@basic-flip-vs-wf_vblank@d-edp1.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>{igt@xe_create@create-execqueues-leak}:</p>
<ul>
<li>bat-atsm-2:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/524">Intel XE#524</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127304v1/bat-atsm-2/igt@xe_create@create-execqueues-leak.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_evict@evict-mixed-threads-small-multi-vm:</p>
<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">DMESG-WARN</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-127304v1/bat-pvc-2/igt@xe_evict@evict-mixed-threads-small-multi-vm.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7615 -&gt; IGT_7617</li>
<li>Linux: xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87 -&gt; xe-pw-127304v1</li>
</ul>
<p>IGT_7615: 2abe4128f4f8ad1130b9c7012536543243c6e3d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7617: 15eebc01e498c61f96928fa7fa3a0d53bdead193 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-547-3cf2df8b17f8be54008581a37361e6ec36dc3d87: 3cf2df8b17f8be54008581a37361e6ec36dc3d87<br />
  xe-pw-127304v1: 127304v1</p>

</body>
</html>

--===============7118647630764124263==--
