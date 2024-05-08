Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B19CC04FFE
	for <intel-xe@archiver.kernel.org>; Wed,  8 May 2024 18:07:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F3A0910F713;
	Wed,  8 May 2024 18:07:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8093510F713;
 Wed,  8 May 2024 18:07:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4574456058320317488=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Rename_few_xe=5Fargs?=
 =?utf-8?q?=2Eh_macros_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 08 May 2024 18:07:57 -0000
Message-ID: <171519167752.2019525.2573973777480334922@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240508171000.1864-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240508171000.1864-1-michal.wajdeczko@intel.com>
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

--===============4574456058320317488==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Rename few xe_args.h macros (rev3)
URL   : https://patchwork.freedesktop.org/series/133258/
State : success

== Summary ==

CI Bug Log - changes from xe-1257-34d52122a69076639d526b035c8edd5b43201f84_BAT -> xe-pw-133258v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7842 -> IGT_7843
  * Linux: xe-1257-34d52122a69076639d526b035c8edd5b43201f84 -> xe-pw-133258v3

  IGT_7842: e2a63accde6e8f3196013ab4809bf07f343fcf1e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7843: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1257-34d52122a69076639d526b035c8edd5b43201f84: 34d52122a69076639d526b035c8edd5b43201f84
  xe-pw-133258v3: 133258v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v3/index.html

--===============4574456058320317488==
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
<tr><td><b>Series:</b></td><td>drm/xe: Rename few xe_args.h macros (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133258/">https://patchwork.freedesktop.org/series/133258/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133258v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1257-34d52122a69076639d526b035c8edd5b43201f84_BAT -&gt; xe-pw-133258v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7842 -&gt; IGT_7843</li>
<li>Linux: xe-1257-34d52122a69076639d526b035c8edd5b43201f84 -&gt; xe-pw-133258v3</li>
</ul>
<p>IGT_7842: e2a63accde6e8f3196013ab4809bf07f343fcf1e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7843: 0df7b9b97f9da0e364f5ee30fe331004b8c86b56 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1257-34d52122a69076639d526b035c8edd5b43201f84: 34d52122a69076639d526b035c8edd5b43201f84<br />
  xe-pw-133258v3: 133258v3</p>

</body>
</html>

--===============4574456058320317488==--
