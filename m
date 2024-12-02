Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A52FE69E82
	for <intel-xe@archiver.kernel.org>; Mon,  2 Dec 2024 18:22:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BA77410E301;
	Mon,  2 Dec 2024 18:22:58 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 78BBC10E80C;
 Mon,  2 Dec 2024 18:22:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8636829801969832396=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIFhlLkNJLkJBVDogc3VjY2VzcyBmb3IgZHJtL3hlL2Rpc3BsYXk6IGZpeCB0?=
 =?utf-8?b?dG1fYm9fYWNjZXNzKCkgdXNhZ2UgKHJldjIp?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Dec 2024 18:22:57 -0000
Message-ID: <173316377748.1712534.14188582708749329086@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20241202170102.88893-2-matthew.auld@intel.com>
In-Reply-To: <20241202170102.88893-2-matthew.auld@intel.com>
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

--===============8636829801969832396==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: fix ttm_bo_access() usage (rev2)
URL   : https://patchwork.freedesktop.org/series/141996/
State : success

== Summary ==

CI Bug Log - changes from xe-2302-77777471ae59ce2f0d0e74d55c60014cf02bd4df_BAT -> xe-pw-141996v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (10 -> 8)
------------------------------

  Missing    (2): bat-adlp-vm bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8132 -> IGT_8133
  * Linux: xe-2302-77777471ae59ce2f0d0e74d55c60014cf02bd4df -> xe-pw-141996v2

  IGT_8132: 7675e070cb74c6808050764367f978f6b74ebc36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8133: 16f2bfe294cc103df8ebb208aa2e64415262f534 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2302-77777471ae59ce2f0d0e74d55c60014cf02bd4df: 77777471ae59ce2f0d0e74d55c60014cf02bd4df
  xe-pw-141996v2: 141996v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v2/index.html

--===============8636829801969832396==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: fix ttm_bo_access() usage (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141996/">https://patchwork.freedesktop.org/series/141996/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141996v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2302-77777471ae59ce2f0d0e74d55c60014cf02bd4df_BAT -&gt; xe-pw-141996v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (10 -&gt; 8)</h2>
<p>Missing    (2): bat-adlp-vm bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8132 -&gt; IGT_8133</li>
<li>Linux: xe-2302-77777471ae59ce2f0d0e74d55c60014cf02bd4df -&gt; xe-pw-141996v2</li>
</ul>
<p>IGT_8132: 7675e070cb74c6808050764367f978f6b74ebc36 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8133: 16f2bfe294cc103df8ebb208aa2e64415262f534 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2302-77777471ae59ce2f0d0e74d55c60014cf02bd4df: 77777471ae59ce2f0d0e74d55c60014cf02bd4df<br />
  xe-pw-141996v2: 141996v2</p>

</body>
</html>

--===============8636829801969832396==--
