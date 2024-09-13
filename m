Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42252FC6181
	for <intel-xe@archiver.kernel.org>; Fri, 13 Sep 2024 21:42:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D192910EDB8;
	Fri, 13 Sep 2024 21:42:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7F7F10EDB7;
 Fri, 13 Sep 2024 21:42:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8822664283748690324=="
MIME-Version: 1.0
Subject: =?utf-8?b?4pyTIENJLkJBVDogc3VjY2VzcyBmb3IgZHJtL3hlOiB1c2UgZGV2bV9hZGRfYWN0?=
 =?utf-8?b?aW9uX29yX3Jlc2V0KCkgaGVscGVy?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "HeLuang" <helugang@uniontech.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Sep 2024 21:42:37 -0000
Message-ID: <172626375767.998495.15912253557120533873@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <9631BC17D1E028A2+20240911102215.84865-1-helugang@uniontech.com>
In-Reply-To: <9631BC17D1E028A2+20240911102215.84865-1-helugang@uniontech.com>
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

--===============8822664283748690324==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: use devm_add_action_or_reset() helper
URL   : https://patchwork.freedesktop.org/series/138672/
State : success

== Summary ==

CI Bug Log - changes from xe-1950-2530827ab017894f2339dd308356366d6e87a72d_BAT -> xe-pw-138672v1_BAT
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

  * Linux: xe-1950-2530827ab017894f2339dd308356366d6e87a72d -> xe-pw-138672v1

  IGT_8019: 8019
  xe-1950-2530827ab017894f2339dd308356366d6e87a72d: 2530827ab017894f2339dd308356366d6e87a72d
  xe-pw-138672v1: 138672v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138672v1/index.html

--===============8822664283748690324==
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
<tr><td><b>Series:</b></td><td>drm/xe: use devm_add_action_or_reset() helper</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138672/">https://patchwork.freedesktop.org/series/138672/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138672v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138672v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1950-2530827ab017894f2339dd308356366d6e87a72d_BAT -&gt; xe-pw-138672v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1950-2530827ab017894f2339dd308356366d6e87a72d -&gt; xe-pw-138672v1</li>
</ul>
<p>IGT_8019: 8019<br />
  xe-1950-2530827ab017894f2339dd308356366d6e87a72d: 2530827ab017894f2339dd308356366d6e87a72d<br />
  xe-pw-138672v1: 138672v1</p>

</body>
</html>

--===============8822664283748690324==--
