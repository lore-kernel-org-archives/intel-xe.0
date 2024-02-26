Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A14EBC54E4A
	for <intel-xe@archiver.kernel.org>; Mon, 26 Feb 2024 19:10:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 20AB510E649;
	Mon, 26 Feb 2024 19:10:26 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACE8610E33A;
 Mon, 26 Feb 2024 19:10:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6682065697643048805=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_VM_Overcommit_handling?=
 =?utf-8?q?_fixes?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Feb 2024 19:10:21 -0000
Message-ID: <170897462170.318338.13117612554206317026@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20240226164455.10179-1-thomas.hellstrom@linux.intel.com>
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

--===============6682065697643048805==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: VM Overcommit handling fixes
URL   : https://patchwork.freedesktop.org/series/130395/
State : success

== Summary ==

CI Bug Log - changes from xe-852-2011d36b07c479fe19c2fca3f50436bdbf1e2627_BAT -> xe-pw-130395v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-pvc-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-852-2011d36b07c479fe19c2fca3f50436bdbf1e2627 -> xe-pw-130395v1

  IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-852-2011d36b07c479fe19c2fca3f50436bdbf1e2627: 2011d36b07c479fe19c2fca3f50436bdbf1e2627
  xe-pw-130395v1: 130395v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130395v1/index.html

--===============6682065697643048805==
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
<tr><td><b>Series:</b></td><td>drm/xe: VM Overcommit handling fixes</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130395/">https://patchwork.freedesktop.org/series/130395/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130395v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130395v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-852-2011d36b07c479fe19c2fca3f50436bdbf1e2627_BAT -&gt; xe-pw-130395v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-852-2011d36b07c479fe19c2fca3f50436bdbf1e2627 -&gt; xe-pw-130395v1</li>
</ul>
<p>IGT_7731: 17f897a81868fb35c6a7033a8b07256659742248 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-852-2011d36b07c479fe19c2fca3f50436bdbf1e2627: 2011d36b07c479fe19c2fca3f50436bdbf1e2627<br />
  xe-pw-130395v1: 130395v1</p>

</body>
</html>

--===============6682065697643048805==--
