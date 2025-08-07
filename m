Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A15BC87FCA
	for <intel-xe@archiver.kernel.org>; Thu,  7 Aug 2025 10:45:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B9E8410E0AE;
	Thu,  7 Aug 2025 10:45:11 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 925CD10E0AE;
 Thu,  7 Aug 2025 10:45:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4588451483047674050=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Introduce_drm_sharpness_pro?=
 =?utf-8?q?perty?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nemesa Garg" <nemesa.garg@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 Aug 2025 10:45:10 -0000
Message-ID: <175456351059.219080.4839713619750496454@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250807092841.3169436-1-nemesa.garg@intel.com>
In-Reply-To: <20250807092841.3169436-1-nemesa.garg@intel.com>
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

--===============4588451483047674050==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce drm sharpness property
URL   : https://patchwork.freedesktop.org/series/152615/
State : success

== Summary ==

CI Bug Log - changes from xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8_BAT -> xe-pw-152615v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 9)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-152615v1_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@sriov_basic@enable-vfs-autoprobe-off:
    - bat-bmg-2:          [SKIP][1] ([Intel XE#1091] / [Intel XE#2849]) -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152615v1/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html
    - bat-bmg-1:          [SKIP][3] ([Intel XE#1091] / [Intel XE#2849]) -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152615v1/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-bmg-1:          [SKIP][5] ([Intel XE#3342]) -> [PASS][6]
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152615v1/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html
    - bat-bmg-2:          [SKIP][7] ([Intel XE#3342]) -> [PASS][8]
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/bat-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152615v1/bat-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@bind-execqueues-independent:
    - {bat-ptl-1}:        [FAIL][9] ([Intel XE#5783]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152615v1/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#1091]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091
  [Intel XE#2849]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#5783]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783


Build changes
-------------

  * Linux: xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8 -> xe-pw-152615v1

  IGT_8488: c4a9bee161f4bb74cbbf81c73b24c416ecf93976 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8: 8463eb0394270c7f78c091aa5f5c7af0abf6fdf8
  xe-pw-152615v1: 152615v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152615v1/index.html

--===============4588451483047674050==
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
<tr><td><b>Series:</b></td><td>Introduce drm sharpness property</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152615/">https://patchwork.freedesktop.org/series/152615/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152615v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152615v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8_BAT -&gt; xe-pw-152615v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-152615v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@sriov_basic@enable-vfs-autoprobe-off:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152615v1/bat-bmg-2/igt@sriov_basic@enable-vfs-autoprobe-off.html">PASS</a> +1 other test pass</li>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1091">Intel XE#1091</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2849">Intel XE#2849</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152615v1/bat-bmg-1/igt@sriov_basic@enable-vfs-autoprobe-off.html">PASS</a> +1 other test pass</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152615v1/bat-bmg-1/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a></li>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/bat-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152615v1/bat-bmg-2/igt@xe_sriov_flr@flr-vf1-clear.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_vm@bind-execqueues-independent:</p>
<ul>
<li>{bat-ptl-1}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5783">Intel XE#5783</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152615v1/bat-ptl-1/igt@xe_vm@bind-execqueues-independent.html">PASS</a></li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8 -&gt; xe-pw-152615v1</li>
</ul>
<p>IGT_8488: c4a9bee161f4bb74cbbf81c73b24c416ecf93976 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3512-8463eb0394270c7f78c091aa5f5c7af0abf6fdf8: 8463eb0394270c7f78c091aa5f5c7af0abf6fdf8<br />
  xe-pw-152615v1: 152615v1</p>

</body>
</html>

--===============4588451483047674050==--
