Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 59620EE021D
	for <intel-xe@archiver.kernel.org>; Tue, 30 Dec 2025 15:58:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0311F10E91D;
	Tue, 30 Dec 2025 15:58:00 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EAFAC10E91D;
 Tue, 30 Dec 2025 15:57:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8178130923236920320=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/sysctrl=3A_Add_syste?=
 =?utf-8?q?m_controller_component_for_Xe3p_dGPU_platforms?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Anoop, Vijay" <anoop.c.vijay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 30 Dec 2025 15:57:58 -0000
Message-ID: <176711027896.121043.15939625390620770300@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251230151722.293657-3-anoop.c.vijay@intel.com>
In-Reply-To: <20251230151722.293657-3-anoop.c.vijay@intel.com>
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

--===============8178130923236920320==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/sysctrl: Add system controller component for Xe3p dGPU platforms
URL   : https://patchwork.freedesktop.org/series/159554/
State : success

== Summary ==

CI Bug Log - changes from xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb_BAT -> xe-pw-159554v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-bmg-1 

Known issues
------------

  Here are the changes found in xe-pw-159554v1_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][1] -> [FAIL][2] ([Intel XE#6520])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * IGT: IGT_8679 -> IGT_8681
  * Linux: xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb -> xe-pw-159554v1

  IGT_8679: 8679
  IGT_8681: c49f35440873244aa86e778007ed2dcbe5bf0ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb: 633f3e5eab13c5bc2d760d1f3db65eb346d9babb
  xe-pw-159554v1: 159554v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v1/index.html

--===============8178130923236920320==
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
<tr><td><b>Series:</b></td><td>drm/xe/sysctrl: Add system controller component for Xe3p dGPU platforms</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159554/">https://patchwork.freedesktop.org/series/159554/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb_BAT -&gt; xe-pw-159554v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-bmg-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159554v1_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_waitfence@reltime:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159554v1/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8679 -&gt; IGT_8681</li>
<li>Linux: xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb -&gt; xe-pw-159554v1</li>
</ul>
<p>IGT_8679: 8679<br />
  IGT_8681: c49f35440873244aa86e778007ed2dcbe5bf0ecb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4315-633f3e5eab13c5bc2d760d1f3db65eb346d9babb: 633f3e5eab13c5bc2d760d1f3db65eb346d9babb<br />
  xe-pw-159554v1: 159554v1</p>

</body>
</html>

--===============8178130923236920320==--
