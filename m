Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D2D9CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 15 Sep 2025 22:34:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C7F4F10E5BF;
	Mon, 15 Sep 2025 22:34:44 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AC07E10E5BA;
 Mon, 15 Sep 2025 22:34:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4631397752718473735=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fdevice=5Fsysfs?=
 =?utf-8?q?=3A_add_cleanup_action_in_xe=5Fdevice=5Fsysfs=5Finit_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zongyao Bai" <zongyao.bai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Sep 2025 22:34:43 -0000
Message-ID: <175797568369.335794.15075481845634758586@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250910183233.3971054-1-zongyao.bai@intel.com>
In-Reply-To: <20250910183233.3971054-1-zongyao.bai@intel.com>
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

--===============4631397752718473735==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_device_sysfs: add cleanup action in xe_device_sysfs_init (rev3)
URL   : https://patchwork.freedesktop.org/series/154116/
State : success

== Summary ==

CI Bug Log - changes from xe-3765-4b2a554c1553f8de414acede44c326055ae2833c_BAT -> xe-pw-154116v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3765-4b2a554c1553f8de414acede44c326055ae2833c -> xe-pw-154116v3

  IGT_8540: 8540
  xe-3765-4b2a554c1553f8de414acede44c326055ae2833c: 4b2a554c1553f8de414acede44c326055ae2833c
  xe-pw-154116v3: 154116v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154116v3/index.html

--===============4631397752718473735==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_device_sysfs: add cleanup action in xe_device_sysfs_init (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154116/">https://patchwork.freedesktop.org/series/154116/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154116v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154116v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3765-4b2a554c1553f8de414acede44c326055ae2833c_BAT -&gt; xe-pw-154116v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3765-4b2a554c1553f8de414acede44c326055ae2833c -&gt; xe-pw-154116v3</li>
</ul>
<p>IGT_8540: 8540<br />
  xe-3765-4b2a554c1553f8de414acede44c326055ae2833c: 4b2a554c1553f8de414acede44c326055ae2833c<br />
  xe-pw-154116v3: 154116v3</p>

</body>
</html>

--===============4631397752718473735==--
