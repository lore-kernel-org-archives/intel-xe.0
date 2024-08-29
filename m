Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DD1CA0EC8
	for <intel-xe@archiver.kernel.org>; Thu, 29 Aug 2024 22:55:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 762D810E61F;
	Thu, 29 Aug 2024 22:55:32 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1930E10E61F;
 Thu, 29 Aug 2024 22:55:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1688297170388767340=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Remove_falsely_GT-centric_design?=
 =?utf-8?q?_in_pcode_and_hwmon?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 Aug 2024 22:55:31 -0000
Message-ID: <172497213109.849749.2089778243291950569@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240829220619.789159-4-matthew.d.roper@intel.com>
In-Reply-To: <20240829220619.789159-4-matthew.d.roper@intel.com>
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

--===============1688297170388767340==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove falsely GT-centric design in pcode and hwmon
URL   : https://patchwork.freedesktop.org/series/137979/
State : success

== Summary ==

CI Bug Log - changes from xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c_BAT -> xe-pw-137979v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7997 -> IGT_7999
  * Linux: xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c -> xe-pw-137979v1

  IGT_7997: c70810080fa12a37859c45f16445797c5d849d4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_7999: a73311079a5d8ac99eb25336a8369a2c3c6b519b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c: c9ae06dbcb2accfef0eec7d34d80063f9c97b18c
  xe-pw-137979v1: 137979v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/index.html

--===============1688297170388767340==
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
<tr><td><b>Series:</b></td><td>Remove falsely GT-centric design in pcode and hwmon</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137979/">https://patchwork.freedesktop.org/series/137979/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137979v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c_BAT -&gt; xe-pw-137979v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7997 -&gt; IGT_7999</li>
<li>Linux: xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c -&gt; xe-pw-137979v1</li>
</ul>
<p>IGT_7997: c70810080fa12a37859c45f16445797c5d849d4d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_7999: a73311079a5d8ac99eb25336a8369a2c3c6b519b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1860-c9ae06dbcb2accfef0eec7d34d80063f9c97b18c: c9ae06dbcb2accfef0eec7d34d80063f9c97b18c<br />
  xe-pw-137979v1: 137979v1</p>

</body>
</html>

--===============1688297170388767340==--
