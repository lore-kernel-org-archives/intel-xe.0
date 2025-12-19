Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0441D7495D
	for <intel-xe@archiver.kernel.org>; Fri, 19 Dec 2025 06:58:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EBB610EE3C;
	Fri, 19 Dec 2025 06:58:27 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 696EF10EE8C;
 Fri, 19 Dec 2025 06:58:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8233444243159268143=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Prepare_GVT_for_display_mod?=
 =?utf-8?q?ularization_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 19 Dec 2025 06:58:26 -0000
Message-ID: <176612750642.104675.15279041339345791691@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251219060302.2365123-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20251219060302.2365123-1-ankit.k.nautiyal@intel.com>
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

--===============8233444243159268143==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Prepare GVT for display modularization (rev3)
URL   : https://patchwork.freedesktop.org/series/159008/
State : success

== Summary ==

CI Bug Log - changes from xe-4272-93db616df689a410d961e7c614c57e61d17a29a0_BAT -> xe-pw-159008v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts

Known issues
------------

  Here are the changes found in xe-pw-159008v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_module_load@load:
    - bat-bmg-1:          [PASS][1] -> [ABORT][2] ([Intel XE#6818])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4272-93db616df689a410d961e7c614c57e61d17a29a0/bat-bmg-1/igt@xe_module_load@load.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159008v3/bat-bmg-1/igt@xe_module_load@load.html

  
  [Intel XE#6818]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6818


Build changes
-------------

  * Linux: xe-4272-93db616df689a410d961e7c614c57e61d17a29a0 -> xe-pw-159008v3

  IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4272-93db616df689a410d961e7c614c57e61d17a29a0: 93db616df689a410d961e7c614c57e61d17a29a0
  xe-pw-159008v3: 159008v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159008v3/index.html

--===============8233444243159268143==
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
<tr><td><b>Series:</b></td><td>Prepare GVT for display modularization (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159008/">https://patchwork.freedesktop.org/series/159008/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159008v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159008v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4272-93db616df689a410d961e7c614c57e61d17a29a0_BAT -&gt; xe-pw-159008v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159008v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_module_load@load:<ul>
<li>bat-bmg-1:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4272-93db616df689a410d961e7c614c57e61d17a29a0/bat-bmg-1/igt@xe_module_load@load.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159008v3/bat-bmg-1/igt@xe_module_load@load.html">ABORT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6818">Intel XE#6818</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4272-93db616df689a410d961e7c614c57e61d17a29a0 -&gt; xe-pw-159008v3</li>
</ul>
<p>IGT_8674: f38f4d8e9c65aff45ac807e646d06e38bc3193a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4272-93db616df689a410d961e7c614c57e61d17a29a0: 93db616df689a410d961e7c614c57e61d17a29a0<br />
  xe-pw-159008v3: 159008v3</p>

</body>
</html>

--===============8233444243159268143==--
