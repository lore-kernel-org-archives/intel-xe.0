Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3220DCF394B
	for <intel-xe@archiver.kernel.org>; Wed, 19 Nov 2025 16:10:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E744110E247;
	Wed, 19 Nov 2025 16:10:20 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9ED8010E674;
 Wed, 19 Nov 2025 16:10:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2178202705966751620=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_and_refactor_?=
 =?utf-8?q?CONFIG=5FDRM=5FXE=5FDEBUG=5FGUC_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 19 Nov 2025 16:10:19 -0000
Message-ID: <176356861963.8491.11304876323318642865@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251118-fix-debug-guc-v1-0-9f780c6bedf8@intel.com>
In-Reply-To: <20251118-fix-debug-guc-v1-0-9f780c6bedf8@intel.com>
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

--===============2178202705966751620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix and refactor CONFIG_DRM_XE_DEBUG_GUC (rev2)
URL   : https://patchwork.freedesktop.org/series/157742/
State : success

== Summary ==

CI Bug Log - changes from xe-4126-80939f90d3e68b92b868017ea450e6695f756666_BAT -> xe-pw-157742v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-157742v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@kms_force_connector_basic@force-connector-state:
    - bat-bmg-2:          [PASS][1] -> [ABORT][2] ([Intel XE#1727] / [Intel XE#4760])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4126-80939f90d3e68b92b868017ea450e6695f756666/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157742v2/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html

  * igt@xe_module_load@load:
    - bat-bmg-1:          [PASS][3] -> [ABORT][4] ([Intel XE#4760])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4126-80939f90d3e68b92b868017ea450e6695f756666/bat-bmg-1/igt@xe_module_load@load.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157742v2/bat-bmg-1/igt@xe_module_load@load.html

  * igt@xe_waitfence@engine:
    - bat-dg2-oem2:       [PASS][5] -> [FAIL][6] ([Intel XE#6519])
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4126-80939f90d3e68b92b868017ea450e6695f756666/bat-dg2-oem2/igt@xe_waitfence@engine.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157742v2/bat-dg2-oem2/igt@xe_waitfence@engine.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][7] -> [FAIL][8] ([Intel XE#6520])
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4126-80939f90d3e68b92b868017ea450e6695f756666/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157742v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
#### Possible fixes ####

  * igt@xe_waitfence@reltime:
    - bat-pvc-2:          [FAIL][9] ([Intel XE#6520]) -> [PASS][10]
   [9]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4126-80939f90d3e68b92b868017ea450e6695f756666/bat-pvc-2/igt@xe_waitfence@reltime.html
   [10]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157742v2/bat-pvc-2/igt@xe_waitfence@reltime.html

  
  [Intel XE#1727]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727
  [Intel XE#4760]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760
  [Intel XE#6519]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8632 -> IGT_8633
  * Linux: xe-4126-80939f90d3e68b92b868017ea450e6695f756666 -> xe-pw-157742v2

  IGT_8632: bbd6b1e5161ad8d244042f4a0d9fefcd575ccf67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8633: 8633
  xe-4126-80939f90d3e68b92b868017ea450e6695f756666: 80939f90d3e68b92b868017ea450e6695f756666
  xe-pw-157742v2: 157742v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157742v2/index.html

--===============2178202705966751620==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix and refactor CONFIG_DRM_XE_DEBUG_GUC (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157742/">https://patchwork.freedesktop.org/series/157742/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157742v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157742v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4126-80939f90d3e68b92b868017ea450e6695f756666_BAT -&gt; xe-pw-157742v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-157742v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@kms_force_connector_basic@force-connector-state:</p>
<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4126-80939f90d3e68b92b868017ea450e6695f756666/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157742v2/bat-bmg-2/igt@kms_force_connector_basic@force-connector-state.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1727">Intel XE#1727</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_module_load@load:</p>
<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4126-80939f90d3e68b92b868017ea450e6695f756666/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157742v2/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4760">Intel XE#4760</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@engine:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4126-80939f90d3e68b92b868017ea450e6695f756666/bat-dg2-oem2/igt@xe_waitfence@engine.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157742v2/bat-dg2-oem2/igt@xe_waitfence@engine.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6519">Intel XE#6519</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4126-80939f90d3e68b92b868017ea450e6695f756666/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157742v2/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-pvc-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4126-80939f90d3e68b92b868017ea450e6695f756666/bat-pvc-2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157742v2/bat-pvc-2/igt@xe_waitfence@reltime.html">PASS</a></li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8632 -&gt; IGT_8633</li>
<li>Linux: xe-4126-80939f90d3e68b92b868017ea450e6695f756666 -&gt; xe-pw-157742v2</li>
</ul>
<p>IGT_8632: bbd6b1e5161ad8d244042f4a0d9fefcd575ccf67 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8633: 8633<br />
  xe-4126-80939f90d3e68b92b868017ea450e6695f756666: 80939f90d3e68b92b868017ea450e6695f756666<br />
  xe-pw-157742v2: 157742v2</p>

</body>
</html>

--===============2178202705966751620==--
