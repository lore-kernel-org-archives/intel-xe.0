Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D28CCD3445
	for <intel-xe@archiver.kernel.org>; Fri,  8 May 2026 20:57:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB48C10E341;
	Fri,  8 May 2026 20:57:40 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5FC5F10E341;
 Fri,  8 May 2026 20:57:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9133081422673527584=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/multi=5Fqueue=3A_Cod?=
 =?utf-8?q?e_refactor_and_cleanup?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 08 May 2026 20:57:39 -0000
Message-ID: <177827385938.53705.3766412193656758210@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260508194428.61819-4-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20260508194428.61819-4-niranjana.vishwanathapura@intel.com>
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

--===============9133081422673527584==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/multi_queue: Code refactor and cleanup
URL   : https://patchwork.freedesktop.org/series/166240/
State : success

== Summary ==

CI Bug Log - changes from xe-5030-32e3e7a9b5d137996e6f57a4aa0c248f12db9544_BAT -> xe-pw-166240v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5030-32e3e7a9b5d137996e6f57a4aa0c248f12db9544 -> xe-pw-166240v1

  IGT_8900: 529869b7d0fba64ed67819111079ff269bc8159a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5030-32e3e7a9b5d137996e6f57a4aa0c248f12db9544: 32e3e7a9b5d137996e6f57a4aa0c248f12db9544
  xe-pw-166240v1: 166240v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166240v1/index.html

--===============9133081422673527584==
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
<tr><td><b>Series:</b></td><td>drm/xe/multi_queue: Code refactor and cleanup</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166240/">https://patchwork.freedesktop.org/series/166240/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166240v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166240v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5030-32e3e7a9b5d137996e6f57a4aa0c248f12db9544_BAT -&gt; xe-pw-166240v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5030-32e3e7a9b5d137996e6f57a4aa0c248f12db9544 -&gt; xe-pw-166240v1</li>
</ul>
<p>IGT_8900: 529869b7d0fba64ed67819111079ff269bc8159a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5030-32e3e7a9b5d137996e6f57a4aa0c248f12db9544: 32e3e7a9b5d137996e6f57a4aa0c248f12db9544<br />
  xe-pw-166240v1: 166240v1</p>

</body>
</html>

--===============9133081422673527584==--
