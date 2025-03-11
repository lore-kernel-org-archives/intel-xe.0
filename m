Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ECA04C28B2E
	for <intel-xe@archiver.kernel.org>; Tue, 11 Mar 2025 07:50:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2F2910E2DF;
	Tue, 11 Mar 2025 07:50:14 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7FE7D10E2DF;
 Tue, 11 Mar 2025 07:50:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2984780034651329293=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_PMU_support_for_function_en?=
 =?utf-8?q?gine_activity_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Riana Tauro" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 11 Mar 2025 07:50:13 -0000
Message-ID: <174167941351.17144.5878906480745212701@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250311071759.2117211-1-riana.tauro@intel.com>
In-Reply-To: <20250311071759.2117211-1-riana.tauro@intel.com>
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

--===============2984780034651329293==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PMU support for function engine activity (rev2)
URL   : https://patchwork.freedesktop.org/series/145755/
State : success

== Summary ==

CI Bug Log - changes from xe-2793-003c44ec0b7d86569bd13d4a810ee24176c3d034_BAT -> xe-pw-145755v2_BAT
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

  Here are the changes found in xe-pw-145755v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_mmap@vram:
    - bat-adlp-vf:        NOTRUN -> [SKIP][1] ([Intel XE#1008])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v2/bat-adlp-vf/igt@xe_mmap@vram.html

  * igt@xe_pm_residency@gt-c6-on-idle:
    - bat-adlp-vf:        NOTRUN -> [SKIP][2] ([Intel XE#2468])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v2/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html

  * igt@xe_sriov_flr@flr-vf1-clear:
    - bat-adlp-vf:        NOTRUN -> [SKIP][3] ([Intel XE#3342])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v2/bat-adlp-vf/igt@xe_sriov_flr@flr-vf1-clear.html

  * igt@xe_vm@large-split-binds-268435456:
    - bat-adlp-vf:        NOTRUN -> [ABORT][4] ([Intel XE#4491])
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v2/bat-adlp-vf/igt@xe_vm@large-split-binds-268435456.html

  
#### Possible fixes ####

  * igt@xe_intel_bb@render@render-xmajor-256:
    - bat-adlp-vf:        [ABORT][5] ([Intel XE#4491]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2793-003c44ec0b7d86569bd13d4a810ee24176c3d034/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v2/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html

  
  [Intel XE#1008]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008
  [Intel XE#2468]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468
  [Intel XE#3342]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * Linux: xe-2793-003c44ec0b7d86569bd13d4a810ee24176c3d034 -> xe-pw-145755v2

  IGT_8270: 49751c5c11723262ec66e564c76503f74a9fa831 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2793-003c44ec0b7d86569bd13d4a810ee24176c3d034: 003c44ec0b7d86569bd13d4a810ee24176c3d034
  xe-pw-145755v2: 145755v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v2/index.html

--===============2984780034651329293==
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
<tr><td><b>Series:</b></td><td>PMU support for function engine activity (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145755/">https://patchwork.freedesktop.org/series/145755/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2793-003c44ec0b7d86569bd13d4a810ee24176c3d034_BAT -&gt; xe-pw-145755v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-145755v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_mmap@vram:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v2/bat-adlp-vf/igt@xe_mmap@vram.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1008">Intel XE#1008</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_pm_residency@gt-c6-on-idle:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v2/bat-adlp-vf/igt@xe_pm_residency@gt-c6-on-idle.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2468">Intel XE#2468</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_sriov_flr@flr-vf1-clear:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v2/bat-adlp-vf/igt@xe_sriov_flr@flr-vf1-clear.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/3342">Intel XE#3342</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_vm@large-split-binds-268435456:</p>
<ul>
<li>bat-adlp-vf:        NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v2/bat-adlp-vf/igt@xe_vm@large-split-binds-268435456.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_intel_bb@render@render-xmajor-256:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2793-003c44ec0b7d86569bd13d4a810ee24176c3d034/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145755v2/bat-adlp-vf/igt@xe_intel_bb@render@render-xmajor-256.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2793-003c44ec0b7d86569bd13d4a810ee24176c3d034 -&gt; xe-pw-145755v2</li>
</ul>
<p>IGT_8270: 49751c5c11723262ec66e564c76503f74a9fa831 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2793-003c44ec0b7d86569bd13d4a810ee24176c3d034: 003c44ec0b7d86569bd13d4a810ee24176c3d034<br />
  xe-pw-145755v2: 145755v2</p>

</body>
</html>

--===============2984780034651329293==--
