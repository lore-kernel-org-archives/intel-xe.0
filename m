Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0E2F7CCF9F8
	for <intel-xe@archiver.kernel.org>; Fri, 31 Oct 2025 14:37:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B652E10EBB1;
	Fri, 31 Oct 2025 14:37:37 +0000 (UTC)
Received: from 10055242dc62 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C5E1210EBB1;
 Fri, 31 Oct 2025 14:37:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0057105052794280738=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Do_clean_shutdown?=
 =?utf-8?q?_also_when_using_flr?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jouni_H=C3=B6gander?= <jouni.hogander@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 31 Oct 2025 14:37:36 -0000
Message-ID: <176192145676.5608.7903858508547864661@10055242dc62>
X-Patchwork-Hint: ignore
References: <20251031122312.1836534-1-jouni.hogander@intel.com>
In-Reply-To: <20251031122312.1836534-1-jouni.hogander@intel.com>
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

--===============0057105052794280738==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Do clean shutdown also when using flr
URL   : https://patchwork.freedesktop.org/series/156838/
State : success

== Summary ==

CI Bug Log - changes from xe-4021-e2df6bac5c3868532a64c869ff7546587aa3dbad_BAT -> xe-pw-156838v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4021-e2df6bac5c3868532a64c869ff7546587aa3dbad -> xe-pw-156838v1

  IGT_8604: 8604
  xe-4021-e2df6bac5c3868532a64c869ff7546587aa3dbad: e2df6bac5c3868532a64c869ff7546587aa3dbad
  xe-pw-156838v1: 156838v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156838v1/index.html

--===============0057105052794280738==
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
<tr><td><b>Series:</b></td><td>drm/xe: Do clean shutdown also when using flr</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/156838/">https://patchwork.freedesktop.org/series/156838/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156838v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-156838v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4021-e2df6bac5c3868532a64c869ff7546587aa3dbad_BAT -&gt; xe-pw-156838v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4021-e2df6bac5c3868532a64c869ff7546587aa3dbad -&gt; xe-pw-156838v1</li>
</ul>
<p>IGT_8604: 8604<br />
  xe-4021-e2df6bac5c3868532a64c869ff7546587aa3dbad: e2df6bac5c3868532a64c869ff7546587aa3dbad<br />
  xe-pw-156838v1: 156838v1</p>

</body>
</html>

--===============0057105052794280738==--
