Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7A30D1AD53
	for <intel-xe@archiver.kernel.org>; Wed, 16 Oct 2024 13:16:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA63610E097;
	Wed, 16 Oct 2024 13:16:04 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E60310E097;
 Wed, 16 Oct 2024 13:16:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1427234976485821246=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_PF=3A_Add_functions_to_save_and_?=
 =?utf-8?q?restore_VF_LMEM_and_CCS_data?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Oct 2024 13:16:03 -0000
Message-ID: <172908456364.1273945.18332978128058331173@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241016095745.7477-1-lukasz.laguna@intel.com>
In-Reply-To: <20241016095745.7477-1-lukasz.laguna@intel.com>
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

--===============1427234976485821246==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PF: Add functions to save and restore VF LMEM and CCS data
URL   : https://patchwork.freedesktop.org/series/140050/
State : success

== Summary ==

CI Bug Log - changes from xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519_BAT -> xe-pw-140050v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-140050v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][1] ([Intel XE#288]) +32 other tests skip
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html

  * igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:
    - bat-dg2-oem2:       NOTRUN -> [SKIP][2] ([Intel XE#2229])
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html

  
#### Possible fixes ####

  * igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:
    - bat-lnl-1:          [DMESG-FAIL][3] ([Intel XE#2687]) -> [PASS][4]
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html

  * igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:
    - {bat-bmg-2}:        [INCOMPLETE][5] ([Intel XE#2874] / [Intel XE#2998]) -> [PASS][6] +1 other test pass
   [5]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [6]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
    - bat-dg2-oem2:       [INCOMPLETE][7] ([Intel XE#2874]) -> [PASS][8] +1 other test pass
   [7]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html
   [8]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html

  
  {name}: This element is suppressed. This means it is ignored when computing
          the status of the difference (SUCCESS, WARNING, or FAILURE).

  [Intel XE#2229]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229
  [Intel XE#2687]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687
  [Intel XE#2874]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874
  [Intel XE#288]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/288
  [Intel XE#2998]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998


Build changes
-------------

  * IGT: IGT_8076 -> IGT_8077
  * Linux: xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519 -> xe-pw-140050v1

  IGT_8076: e511df10a1201d0d83c03ccbcabc3d57191e5f8e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8077: 42f9e9702f74a4993318adea936baaa186084689 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519: 12e4970af1ecdeb76e94df2daf51a9c3d6b9f519
  xe-pw-140050v1: 140050v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v1/index.html

--===============1427234976485821246==
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
<tr><td><b>Series:</b></td><td>PF: Add functions to save and restore VF LMEM and CCS data</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/140050/">https://patchwork.freedesktop.org/series/140050/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519_BAT -&gt; xe-pw-140050v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-140050v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_exec_fault_mode@twice-bindexecqueue-userptr:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v1/bat-dg2-oem2/igt@xe_exec_fault_mode@twice-bindexecqueue-userptr.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/288">Intel XE#288</a>) +32 other tests skip</li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit:</p>
<ul>
<li>bat-dg2-oem2:       NOTRUN -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v1/bat-dg2-oem2/igt@xe_live_ktest@xe_migrate@xe_validate_ccs_kunit.html">SKIP</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2229">Intel XE#2229</a>)</li>
</ul>
</li>
</ul>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate:</p>
<ul>
<li>bat-lnl-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">DMESG-FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2687">Intel XE#2687</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v1/bat-lnl-1/igt@xe_exec_compute_mode@twice-bindexecqueue-userptr-invalidate.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit:</p>
<ul>
<li>{bat-bmg-2}:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2998">Intel XE#2998</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v1/bat-bmg-2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/2874">Intel XE#2874</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-140050v1/bat-dg2-oem2/igt@xe_live_ktest@xe_bo@xe_bo_shrink_kunit.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<p>{name}: This element is suppressed. This means it is ignored when computing<br />
          the status of the difference (SUCCESS, WARNING, or FAILURE).</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8076 -&gt; IGT_8077</li>
<li>Linux: xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519 -&gt; xe-pw-140050v1</li>
</ul>
<p>IGT_8076: e511df10a1201d0d83c03ccbcabc3d57191e5f8e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8077: 42f9e9702f74a4993318adea936baaa186084689 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2072-12e4970af1ecdeb76e94df2daf51a9c3d6b9f519: 12e4970af1ecdeb76e94df2daf51a9c3d6b9f519<br />
  xe-pw-140050v1: 140050v1</p>

</body>
</html>

--===============1427234976485821246==--
