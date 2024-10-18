Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BE9BD2FFF4
	for <intel-xe@archiver.kernel.org>; Fri, 18 Oct 2024 11:25:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2677F10E8F7;
	Fri, 18 Oct 2024 11:25:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F62E10E905;
 Fri, 18 Oct 2024 11:25:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1214606668217978738=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/mmap=3A_Add_mmap_support_?=
 =?utf-8?q?for_PCI_memory_barrier_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 18 Oct 2024 11:25:00 -0000
Message-ID: <172925070031.1281878.14858169783214522260@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20241018104639.855216-1-tejas.upadhyay@intel.com>
In-Reply-To: <20241018104639.855216-1-tejas.upadhyay@intel.com>
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

--===============1214606668217978738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/mmap: Add mmap support for PCI memory barrier (rev2)
URL   : https://patchwork.freedesktop.org/series/139769/
State : success

== Summary ==

CI Bug Log - changes from xe-2091-c1837d4e9af4e9df3109960341105c035b441667_BAT -> xe-pw-139769v2_BAT
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

  * IGT: IGT_8078 -> IGT_8079
  * Linux: xe-2091-c1837d4e9af4e9df3109960341105c035b441667 -> xe-pw-139769v2

  IGT_8078: 175bddf20141ccad40130719ca46bde5140f4872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8079: 31475ea8fdeef38b5ae6b4b8ca6d4e42f8285b42 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2091-c1837d4e9af4e9df3109960341105c035b441667: c1837d4e9af4e9df3109960341105c035b441667
  xe-pw-139769v2: 139769v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/index.html

--===============1214606668217978738==
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
<tr><td><b>Series:</b></td><td>drm/xe/mmap: Add mmap support for PCI memory barrier (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/139769/">https://patchwork.freedesktop.org/series/139769/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-139769v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2091-c1837d4e9af4e9df3109960341105c035b441667_BAT -&gt; xe-pw-139769v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8078 -&gt; IGT_8079</li>
<li>Linux: xe-2091-c1837d4e9af4e9df3109960341105c035b441667 -&gt; xe-pw-139769v2</li>
</ul>
<p>IGT_8078: 175bddf20141ccad40130719ca46bde5140f4872 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8079: 31475ea8fdeef38b5ae6b4b8ca6d4e42f8285b42 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2091-c1837d4e9af4e9df3109960341105c035b441667: c1837d4e9af4e9df3109960341105c035b441667<br />
  xe-pw-139769v2: 139769v2</p>

</body>
</html>

--===============1214606668217978738==--
