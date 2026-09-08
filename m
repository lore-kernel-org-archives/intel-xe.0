Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C324CC79F9E
	for <intel-xe@archiver.kernel.org>; Tue,  8 Sep 2026 15:25:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 791C210ECA2;
	Tue,  8 Sep 2026 15:25:29 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 15A9A10ECA2;
 Tue,  8 Sep 2026 15:25:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4959463298596515590=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/mmio=5Fgem=3A_fix_fa?=
 =?utf-8?q?ult_handler_and_destroy_path_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Levi, Ilia" <ilia.levi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Sep 2026 15:25:28 -0000
Message-ID: <178888112807.134370.11411857074765304621@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260908134955.1344429-10-matthew.auld@intel.com>
In-Reply-To: <20260908134955.1344429-10-matthew.auld@intel.com>
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

--===============4959463298596515590==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/mmio_gem: fix fault handler and destroy path (rev4)
URL   : https://patchwork.freedesktop.org/series/167217/
State : success

== Summary ==

CI Bug Log - changes from xe-5706-408d923f7b468d9e5cc7bbc62c716ca07f7b7d9b_BAT -> xe-pw-167217v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5706-408d923f7b468d9e5cc7bbc62c716ca07f7b7d9b -> xe-pw-167217v4

  IGT_9085: 9085
  xe-5706-408d923f7b468d9e5cc7bbc62c716ca07f7b7d9b: 408d923f7b468d9e5cc7bbc62c716ca07f7b7d9b
  xe-pw-167217v4: 167217v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167217v4/index.html

--===============4959463298596515590==
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
<tr><td><b>Series:</b></td><td>drm/xe/mmio_gem: fix fault handler and destroy path (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167217/">https://patchwork.freedesktop.org/series/167217/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167217v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167217v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5706-408d923f7b468d9e5cc7bbc62c716ca07f7b7d9b_BAT -&gt; xe-pw-167217v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5706-408d923f7b468d9e5cc7bbc62c716ca07f7b7d9b -&gt; xe-pw-167217v4</li>
</ul>
<p>IGT_9085: 9085<br />
  xe-5706-408d923f7b468d9e5cc7bbc62c716ca07f7b7d9b: 408d923f7b468d9e5cc7bbc62c716ca07f7b7d9b<br />
  xe-pw-167217v4: 167217v4</p>

</body>
</html>

--===============4959463298596515590==--
