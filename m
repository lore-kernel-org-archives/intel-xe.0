Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4981C531F9
	for <intel-xe@archiver.kernel.org>; Fri, 24 Jul 2026 13:08:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 88F5A10E066;
	Fri, 24 Jul 2026 13:08:45 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D41410E066;
 Fri, 24 Jul 2026 13:08:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8905235285346355983=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/gem=3A_Move_pages=5Fto?=
 =?utf-8?q?=5Fsg_helper_into_drm=5Fgem=2Ec?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Adri=C3=A1n_Larumbe?= <adrian.larumbe@collabora.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 24 Jul 2026 13:08:44 -0000
Message-ID: <178489852411.225335.13735700481649723271@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260724-get_pages-v1-1-b10e5d65628e@collabora.com>
In-Reply-To: <20260724-get_pages-v1-1-b10e5d65628e@collabora.com>
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

--===============8905235285346355983==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/gem: Move pages_to_sg helper into drm_gem.c
URL   : https://patchwork.freedesktop.org/series/171076/
State : success

== Summary ==

CI Bug Log - changes from xe-5477-b747a63003130bef1a3d5d6ba97c94d0cee36f55_BAT -> xe-pw-171076v1_BAT
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

  * Linux: xe-5477-b747a63003130bef1a3d5d6ba97c94d0cee36f55 -> xe-pw-171076v1

  IGT_9025: 852c13ddd448fd668c43584ca3ad1aec49c4633c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5477-b747a63003130bef1a3d5d6ba97c94d0cee36f55: b747a63003130bef1a3d5d6ba97c94d0cee36f55
  xe-pw-171076v1: 171076v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171076v1/index.html

--===============8905235285346355983==
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
<tr><td><b>Series:</b></td><td>drm/gem: Move pages_to_sg helper into drm_gem.c</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171076/">https://patchwork.freedesktop.org/series/171076/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171076v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171076v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5477-b747a63003130bef1a3d5d6ba97c94d0cee36f55_BAT -&gt; xe-pw-171076v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5477-b747a63003130bef1a3d5d6ba97c94d0cee36f55 -&gt; xe-pw-171076v1</li>
</ul>
<p>IGT_9025: 852c13ddd448fd668c43584ca3ad1aec49c4633c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5477-b747a63003130bef1a3d5d6ba97c94d0cee36f55: b747a63003130bef1a3d5d6ba97c94d0cee36f55<br />
  xe-pw-171076v1: 171076v1</p>

</body>
</html>

--===============8905235285346355983==--
