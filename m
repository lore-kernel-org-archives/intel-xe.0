Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8695C282DE
	for <intel-xe@archiver.kernel.org>; Mon, 10 Mar 2025 14:08:09 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 514E610E08F;
	Mon, 10 Mar 2025 14:08:09 +0000 (UTC)
Received: from 18a75f3d1eae (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C69610E08F;
 Mon, 10 Mar 2025 14:08:08 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5735094782797617006=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Use_VRR_timing_generator_fo?=
 =?utf-8?q?r_fixed_refresh_rate_modes_=28rev8=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 10 Mar 2025 14:08:08 -0000
Message-ID: <174161568817.14390.15911347807535422988@18a75f3d1eae>
X-Patchwork-Hint: ignore
References: <20250310121615.1077079-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250310121615.1077079-1-ankit.k.nautiyal@intel.com>
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

--===============5735094782797617006==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Use VRR timing generator for fixed refresh rate modes (rev8)
URL   : https://patchwork.freedesktop.org/series/141152/
State : success

== Summary ==

CI Bug Log - changes from xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a_BAT -> xe-pw-141152v8_BAT
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

  Here are the changes found in xe-pw-141152v8_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:
    - bat-adlp-vf:        [PASS][1] -> [ABORT][2] ([Intel XE#4491])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v8/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html

  
  [Intel XE#4491]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491


Build changes
-------------

  * IGT: IGT_8267 -> IGT_8268
  * Linux: xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a -> xe-pw-141152v8

  IGT_8267: 3ad1299396859b88c0938d93b38f42e2169cdf41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8268: a7465d3781d7e7a2374425cf4fecd945ef1e1bf6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a: 0457c65354c6dfa0e81d9acb5e39e03b59b82d7a
  xe-pw-141152v8: 141152v8

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v8/index.html

--===============5735094782797617006==
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
<tr><td><b>Series:</b></td><td>Use VRR timing generator for fixed refresh rate modes (rev8)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141152/">https://patchwork.freedesktop.org/series/141152/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v8/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v8/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a_BAT -&gt; xe-pw-141152v8_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 9)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-141152v8_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race:<ul>
<li>bat-adlp-vf:        <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141152v8/bat-adlp-vf/igt@xe_exec_threads@threads-mixed-shared-vm-userptr-invalidate-race.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/4491">Intel XE#4491</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8267 -&gt; IGT_8268</li>
<li>Linux: xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a -&gt; xe-pw-141152v8</li>
</ul>
<p>IGT_8267: 3ad1299396859b88c0938d93b38f42e2169cdf41 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8268: a7465d3781d7e7a2374425cf4fecd945ef1e1bf6 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2786-0457c65354c6dfa0e81d9acb5e39e03b59b82d7a: 0457c65354c6dfa0e81d9acb5e39e03b59b82d7a<br />
  xe-pw-141152v8: 141152v8</p>

</body>
</html>

--===============5735094782797617006==--
