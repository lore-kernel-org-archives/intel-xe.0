Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0FA2C48BEB
	for <intel-xe@archiver.kernel.org>; Thu, 22 Feb 2024 01:45:53 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6B08210E83F;
	Thu, 22 Feb 2024 01:45:53 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 29E1010E7CD;
 Thu, 22 Feb 2024 01:45:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8220350366030361329=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drivers/i915/intel=5Fbios=3A_Fix?=
 =?utf-8?q?_parsing_backlight_BDB_data_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthikeyan Ramasubramanian" <kramasub@chromium.org>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 22 Feb 2024 01:45:52 -0000
Message-ID: <170856635216.197499.5495334917763183744@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240221180622.v2.1.I0690aa3e96a83a43b3fc33f50395d334b2981826@changeid>
In-Reply-To: <20240221180622.v2.1.I0690aa3e96a83a43b3fc33f50395d334b2981826@changeid>
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

--===============8220350366030361329==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drivers/i915/intel_bios: Fix parsing backlight BDB data (rev2)
URL   : https://patchwork.freedesktop.org/series/130153/
State : success

== Summary ==

CI Bug Log - changes from xe-819-06b279b4fb58a00667e47fafed72bba923d032ae_BAT -> xe-pw-130153v2_BAT
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

  Here are the changes found in xe-pw-130153v2_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_exec_threads@threads-mixed-fd-basic:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#1167])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-819-06b279b4fb58a00667e47fafed72bba923d032ae/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130153v2/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html

  
  [Intel XE#1167]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167


Build changes
-------------

  * Linux: xe-819-06b279b4fb58a00667e47fafed72bba923d032ae -> xe-pw-130153v2

  IGT_7720: 7720
  xe-819-06b279b4fb58a00667e47fafed72bba923d032ae: 06b279b4fb58a00667e47fafed72bba923d032ae
  xe-pw-130153v2: 130153v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130153v2/index.html

--===============8220350366030361329==
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
<tr><td><b>Series:</b></td><td>drivers/i915/intel_bios: Fix parsing backlight BDB data (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130153/">https://patchwork.freedesktop.org/series/130153/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130153v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130153v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-819-06b279b4fb58a00667e47fafed72bba923d032ae_BAT -&gt; xe-pw-130153v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-130153v2_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-fd-basic:<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-819-06b279b4fb58a00667e47fafed72bba923d032ae/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130153v2/bat-dg2-oem2/igt@xe_exec_threads@threads-mixed-fd-basic.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1167">Intel XE#1167</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-819-06b279b4fb58a00667e47fafed72bba923d032ae -&gt; xe-pw-130153v2</li>
</ul>
<p>IGT_7720: 7720<br />
  xe-819-06b279b4fb58a00667e47fafed72bba923d032ae: 06b279b4fb58a00667e47fafed72bba923d032ae<br />
  xe-pw-130153v2: 130153v2</p>

</body>
</html>

--===============8220350366030361329==--
