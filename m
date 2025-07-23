Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2744C83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 19:20:16 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7486910E85D;
	Wed, 23 Jul 2025 19:20:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B3CFD10E858;
 Wed, 23 Jul 2025 19:20:15 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8059429688465554109=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_devcoredump=3A_Fix_circular?=
 =?utf-8?q?_locking_dependency_with_devcd-=3Emutex=2E_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <dev@lankhorst.se>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Jul 2025 19:20:15 -0000
Message-ID: <175329841572.184315.2126262214675726787@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250723142416.1020423-1-dev@lankhorst.se>
In-Reply-To: <20250723142416.1020423-1-dev@lankhorst.se>
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

--===============8059429688465554109==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: devcoredump: Fix circular locking dependency with devcd->mutex. (rev3)
URL   : https://patchwork.freedesktop.org/series/151901/
State : success

== Summary ==

CI Bug Log - changes from xe-3466-22160d1b26a745a0a939dbc792485a2404aea536_BAT -> xe-pw-151901v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3466-22160d1b26a745a0a939dbc792485a2404aea536 -> xe-pw-151901v3

  IGT_8475: 1ddc997191d8aa008b49b5a4c47cf295c9a3c4f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3466-22160d1b26a745a0a939dbc792485a2404aea536: 22160d1b26a745a0a939dbc792485a2404aea536
  xe-pw-151901v3: 151901v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151901v3/index.html

--===============8059429688465554109==
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
<tr><td><b>Series:</b></td><td>devcoredump: Fix circular locking dependency with devcd-&gt;mutex. (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151901/">https://patchwork.freedesktop.org/series/151901/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151901v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151901v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3466-22160d1b26a745a0a939dbc792485a2404aea536_BAT -&gt; xe-pw-151901v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3466-22160d1b26a745a0a939dbc792485a2404aea536 -&gt; xe-pw-151901v3</li>
</ul>
<p>IGT_8475: 1ddc997191d8aa008b49b5a4c47cf295c9a3c4f4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3466-22160d1b26a745a0a939dbc792485a2404aea536: 22160d1b26a745a0a939dbc792485a2404aea536<br />
  xe-pw-151901v3: 151901v3</p>

</body>
</html>

--===============8059429688465554109==--
