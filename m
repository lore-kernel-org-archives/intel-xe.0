Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11516C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 15:39:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9814910E994;
	Mon, 25 Mar 2024 15:39:44 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5283010E98E;
 Mon, 25 Mar 2024 15:39:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9090859281186860441=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Add_support_for_Wa_KLVs_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Badal Nilawar" <badal.nilawar@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Mar 2024 15:39:43 -0000
Message-ID: <171138118333.1035680.14932763226303992152@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240325150435.2967536-1-badal.nilawar@intel.com>
In-Reply-To: <20240325150435.2967536-1-badal.nilawar@intel.com>
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

--===============9090859281186860441==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add support for Wa KLVs (rev3)
URL   : https://patchwork.freedesktop.org/series/131179/
State : success

== Summary ==

CI Bug Log - changes from xe-987-fc736bbab7abcae683f52604591fe16cf2a85b3e_BAT -> xe-pw-131179v3_BAT
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

  Here are the changes found in xe-pw-131179v3_BAT that come from known issues:

### IGT changes ###

#### Warnings ####

  * igt@xe_exec_threads@threads-mixed-userptr-invalidate:
    - bat-adlp-7:         [INCOMPLETE][1] ([Intel XE#1044]) -> [INCOMPLETE][2] ([Intel XE#1044] / [Intel XE#1376])
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-987-fc736bbab7abcae683f52604591fe16cf2a85b3e/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v3/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html

  
  [Intel XE#1044]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044
  [Intel XE#1376]: https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376


Build changes
-------------

  * Linux: xe-987-fc736bbab7abcae683f52604591fe16cf2a85b3e -> xe-pw-131179v3

  IGT_7780: 93a5298ac980333738cf75da6b66fa6f3769205f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-987-fc736bbab7abcae683f52604591fe16cf2a85b3e: fc736bbab7abcae683f52604591fe16cf2a85b3e
  xe-pw-131179v3: 131179v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v3/index.html

--===============9090859281186860441==
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
<tr><td><b>Series:</b></td><td>Add support for Wa KLVs (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131179/">https://patchwork.freedesktop.org/series/131179/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-987-fc736bbab7abcae683f52604591fe16cf2a85b3e_BAT -&gt; xe-pw-131179v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-131179v3_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Warnings</h4>
<ul>
<li>igt@xe_exec_threads@threads-mixed-userptr-invalidate:<ul>
<li>bat-adlp-7:         <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-987-fc736bbab7abcae683f52604591fe16cf2a85b3e/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a>) -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131179v3/bat-adlp-7/igt@xe_exec_threads@threads-mixed-userptr-invalidate.html">INCOMPLETE</a> (<a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1044">Intel XE#1044</a> / <a href="https://gitlab.freedesktop.org/drm/xe/kernel/issues/1376">Intel XE#1376</a>)</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-987-fc736bbab7abcae683f52604591fe16cf2a85b3e -&gt; xe-pw-131179v3</li>
</ul>
<p>IGT_7780: 93a5298ac980333738cf75da6b66fa6f3769205f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-987-fc736bbab7abcae683f52604591fe16cf2a85b3e: fc736bbab7abcae683f52604591fe16cf2a85b3e<br />
  xe-pw-131179v3: 131179v3</p>

</body>
</html>

--===============9090859281186860441==--
