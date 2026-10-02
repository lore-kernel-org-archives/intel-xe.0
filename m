Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 97700CA5FE6
	for <intel-xe@archiver.kernel.org>; Fri,  2 Oct 2026 21:52:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3809110E6B2;
	Fri,  2 Oct 2026 21:52:27 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 88DFA10E6B2;
 Fri,  2 Oct 2026 21:52:25 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2080353285517634973=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtL3hlOiB1c2UgcmVzb3VyY2Vf?=
 =?utf-8?b?c2l6ZSgpIGluIHhlX3BhZ2VtYXBfY3JlYXRlKCkgKHJldjMp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aryan Sinha" <sinha.aryan03@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 02 Oct 2026 21:52:25 -0000
Message-ID: <179097794555.234894.3275227901570813455@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261002080731.13992-1-sinha.aryan03@gmail.com>
In-Reply-To: <20261002080731.13992-1-sinha.aryan03@gmail.com>
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

--===============2080353285517634973==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: use resource_size() in xe_pagemap_create() (rev3)
URL   : https://patchwork.freedesktop.org/series/175458/
State : success

== Summary ==

CI Bug Log - changes from xe-5883-28a2edb89a25a41d2a45e27d74dfd946872d0faf_BAT -> xe-pw-175458v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5883-28a2edb89a25a41d2a45e27d74dfd946872d0faf -> xe-pw-175458v3

  IGT_9126: 4b27241425f55826ff2df54686e8e709f5baf9dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5883-28a2edb89a25a41d2a45e27d74dfd946872d0faf: 28a2edb89a25a41d2a45e27d74dfd946872d0faf
  xe-pw-175458v3: 175458v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175458v3/index.html

--===============2080353285517634973==
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
<tr><td><b>Series:</b></td><td>drm/xe: use resource_size() in xe_pagemap_create() (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175458/">https://patchwork.freedesktop.org/series/175458/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175458v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175458v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5883-28a2edb89a25a41d2a45e27d74dfd946872d0faf_BAT -&gt; xe-pw-175458v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5883-28a2edb89a25a41d2a45e27d74dfd946872d0faf -&gt; xe-pw-175458v3</li>
</ul>
<p>IGT_9126: 4b27241425f55826ff2df54686e8e709f5baf9dc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5883-28a2edb89a25a41d2a45e27d74dfd946872d0faf: 28a2edb89a25a41d2a45e27d74dfd946872d0faf<br />
  xe-pw-175458v3: 175458v3</p>

</body>
</html>

--===============2080353285517634973==--
