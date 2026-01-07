Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 377C4CF6BE4
	for <intel-xe@archiver.kernel.org>; Wed,  7 Jan 2026 02:02:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id ED3BF10E145;
	Wed,  7 Jan 2026 02:02:02 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A483D10E145;
 Wed,  7 Jan 2026 02:02:01 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1884016529487633117=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Page-reclaim_fixes_and_PRL_?=
 =?utf-8?q?stats_addition_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Brian Nguyen" <brian3.nguyen@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Jan 2026 02:02:01 -0000
Message-ID: <176775132165.130906.12300516915176061191@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260107010447.4125005-6-brian3.nguyen@intel.com>
In-Reply-To: <20260107010447.4125005-6-brian3.nguyen@intel.com>
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

--===============1884016529487633117==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Page-reclaim fixes and PRL stats addition (rev3)
URL   : https://patchwork.freedesktop.org/series/159478/
State : success

== Summary ==

CI Bug Log - changes from xe-4337-cf42653e3e0def607bd49a8ed918bee102311450_BAT -> xe-pw-159478v3_BAT
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

  Here are the changes found in xe-pw-159478v3_BAT that come from known issues:

### IGT changes ###

#### Issues hit ####

  * igt@xe_waitfence@abstime:
    - bat-dg2-oem2:       [PASS][1] -> [TIMEOUT][2] ([Intel XE#6506])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4337-cf42653e3e0def607bd49a8ed918bee102311450/bat-dg2-oem2/igt@xe_waitfence@abstime.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159478v3/bat-dg2-oem2/igt@xe_waitfence@abstime.html

  * igt@xe_waitfence@reltime:
    - bat-dg2-oem2:       [PASS][3] -> [FAIL][4] ([Intel XE#6520])
   [3]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-4337-cf42653e3e0def607bd49a8ed918bee102311450/bat-dg2-oem2/igt@xe_waitfence@reltime.html
   [4]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159478v3/bat-dg2-oem2/igt@xe_waitfence@reltime.html

  
  [Intel XE#6506]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506
  [Intel XE#6520]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520


Build changes
-------------

  * Linux: xe-4337-cf42653e3e0def607bd49a8ed918bee102311450 -> xe-pw-159478v3

  IGT_8688: bf529184be041a0197778395aa71dbb1e5d47bff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4337-cf42653e3e0def607bd49a8ed918bee102311450: cf42653e3e0def607bd49a8ed918bee102311450
  xe-pw-159478v3: 159478v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159478v3/index.html

--===============1884016529487633117==
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
<tr><td><b>Series:</b></td><td>Page-reclaim fixes and PRL stats addition (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159478/">https://patchwork.freedesktop.org/series/159478/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159478v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159478v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4337-cf42653e3e0def607bd49a8ed918bee102311450_BAT -&gt; xe-pw-159478v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-bmg-1 </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-159478v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Issues hit</h4>
<ul>
<li>
<p>igt@xe_waitfence@abstime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4337-cf42653e3e0def607bd49a8ed918bee102311450/bat-dg2-oem2/igt@xe_waitfence@abstime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159478v3/bat-dg2-oem2/igt@xe_waitfence@abstime.html">TIMEOUT</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6506">Intel XE#6506</a>)</li>
</ul>
</li>
<li>
<p>igt@xe_waitfence@reltime:</p>
<ul>
<li>bat-dg2-oem2:       <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-4337-cf42653e3e0def607bd49a8ed918bee102311450/bat-dg2-oem2/igt@xe_waitfence@reltime.html">PASS</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159478v3/bat-dg2-oem2/igt@xe_waitfence@reltime.html">FAIL</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/6520">Intel XE#6520</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4337-cf42653e3e0def607bd49a8ed918bee102311450 -&gt; xe-pw-159478v3</li>
</ul>
<p>IGT_8688: bf529184be041a0197778395aa71dbb1e5d47bff @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4337-cf42653e3e0def607bd49a8ed918bee102311450: cf42653e3e0def607bd49a8ed918bee102311450<br />
  xe-pw-159478v3: 159478v3</p>

</body>
</html>

--===============1884016529487633117==--
