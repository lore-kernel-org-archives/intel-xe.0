Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8B3A7109C058
	for <intel-xe@archiver.kernel.org>; Wed, 25 Mar 2026 19:07:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 72B2510E832;
	Wed, 25 Mar 2026 19:07:39 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AEB4D10E7D3;
 Wed, 25 Mar 2026 19:07:38 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5427523186824789353=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFULL=3A_success_for_drm/xe/xe=5Fsysctrl=3A_Add?=
 =?utf-8?q?_system_controller_component_for_Xe3p_dGPU_platforms_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 25 Mar 2026 19:07:38 -0000
Message-ID: <177446565868.397746.10806092599826760206@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260325120030.510480-9-anoop.c.vijay@intel.com>
In-Reply-To: <20260325120030.510480-9-anoop.c.vijay@intel.com>
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

--===============5427523186824789353==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_sysctrl: Add system controller component for Xe3p dGPU platforms (rev3)
URL   : https://patchwork.freedesktop.org/series/163196/
State : success

== Summary ==

CI Bug Log - changes from xe-4778-41579e12882a0a3b881bfade003fcb1fd39c347c_FULL -> xe-pw-163196v3_FULL
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (2 -> 2)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-163196v3_FULL that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:
    - shard-lnl:          [FAIL][1] ([Intel XE#5625]) -> [PASS][2]
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4778-41579e12882a0a3b881bfade003fcb1fd39c347c/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163196v3/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html

  * igt@xe_pmu@gt-frequency@gt0:
    - shard-lnl:          [FAIL][3] -> [PASS][4] +1 other test pass
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4778-41579e12882a0a3b881bfade003fcb1fd39c347c/shard-lnl-6/igt@xe_pmu@gt-frequency@gt0.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163196v3/shard-lnl-7/igt@xe_pmu@gt-frequency@gt0.html

  
  [Intel XE#5625]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625


Build changes
-------------

  * Linux: xe-4778-41579e12882a0a3b881bfade003fcb1fd39c347c -> xe-pw-163196v3

  IGT_8825: 531ebe0606453021b88f794aad255d9e1a234d3d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4778-41579e12882a0a3b881bfade003fcb1fd39c347c: 41579e12882a0a3b881bfade003fcb1fd39c347c
  xe-pw-163196v3: 163196v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163196v3/index.html

--===============5427523186824789353==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_sysctrl: Add system controller component for Xe3p dGPU platforms (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163196/">https://patchwork.freedesktop.org/series/163196/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163196v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163196v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4778-41579e12882a0a3b881bfade003fcb1fd39c347c_FULL -&gt; xe-pw-163196v3_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (2 -&gt; 2)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-163196v3_FULL that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>
<p>igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4778-41579e12882a0a3b881bfade003fcb1fd39c347c/shard-lnl-7/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/5625">Intel XE#5625</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163196v3/shard-lnl-2/igt@xe_exec_system_allocator@pat-index-madvise-pat-idx-uc-multi-vma.html">PASS</a></li>
</ul>
</li>
<li>
<p>igt@xe_pmu@gt-frequency@gt0:</p>
<ul>
<li>shard-lnl:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4778-41579e12882a0a3b881bfade003fcb1fd39c347c/shard-lnl-6/igt@xe_pmu@gt-frequency@gt0.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163196v3/shard-lnl-7/igt@xe_pmu@gt-frequency@gt0.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4778-41579e12882a0a3b881bfade003fcb1fd39c347c -&gt; xe-pw-163196v3</li>
</ul>
<p>IGT_8825: 531ebe0606453021b88f794aad255d9e1a234d3d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4778-41579e12882a0a3b881bfade003fcb1fd39c347c: 41579e12882a0a3b881bfade003fcb1fd39c347c<br />
  xe-pw-163196v3: 163196v3</p>

</body>
</html>

--===============5427523186824789353==--
