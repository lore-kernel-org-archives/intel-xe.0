Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC402EF4EC8
	for <intel-xe@archiver.kernel.org>; Mon,  6 Apr 2026 09:54:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8E8A010E24D;
	Mon,  6 Apr 2026 09:54:12 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4BCF210E24D;
 Mon,  6 Apr 2026 09:54:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4536893969512978923=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/svm=3A_Add_MMU_notif?=
 =?utf-8?q?ier-based_madvise_autoreset_on_munmap_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 06 Apr 2026 09:54:11 -0000
Message-ID: <177546925129.433781.15731420396607083009@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260406085830.1118431-1-arvind.yadav@intel.com>
In-Reply-To: <20260406085830.1118431-1-arvind.yadav@intel.com>
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

--===============4536893969512978923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/svm: Add MMU notifier-based madvise autoreset on munmap (rev2)
URL   : https://patchwork.freedesktop.org/series/161815/
State : success

== Summary ==

CI Bug Log - changes from xe-4852-d873f0156bd08a3031097d459e2d3604bfe1b1bf_BAT -> xe-pw-161815v2_BAT
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

  * IGT: IGT_8847 -> IGT_8848
  * Linux: xe-4852-d873f0156bd08a3031097d459e2d3604bfe1b1bf -> xe-pw-161815v2

  IGT_8847: 8847
  IGT_8848: 8848
  xe-4852-d873f0156bd08a3031097d459e2d3604bfe1b1bf: d873f0156bd08a3031097d459e2d3604bfe1b1bf
  xe-pw-161815v2: 161815v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161815v2/index.html

--===============4536893969512978923==
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
<tr><td><b>Series:</b></td><td>drm/xe/svm: Add MMU notifier-based madvise autoreset on munmap (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161815/">https://patchwork.freedesktop.org/series/161815/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161815v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161815v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4852-d873f0156bd08a3031097d459e2d3604bfe1b1bf_BAT -&gt; xe-pw-161815v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8847 -&gt; IGT_8848</li>
<li>Linux: xe-4852-d873f0156bd08a3031097d459e2d3604bfe1b1bf -&gt; xe-pw-161815v2</li>
</ul>
<p>IGT_8847: 8847<br />
  IGT_8848: 8848<br />
  xe-4852-d873f0156bd08a3031097d459e2d3604bfe1b1bf: d873f0156bd08a3031097d459e2d3604bfe1b1bf<br />
  xe-pw-161815v2: 161815v2</p>

</body>
</html>

--===============4536893969512978923==--
