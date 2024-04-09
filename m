Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A68E5CD1284
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 09:48:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4552A10E4A5;
	Tue,  9 Apr 2024 09:48:08 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2EA3E112C30;
 Tue,  9 Apr 2024 09:47:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4158493315298294494=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5BCI-only?=
 =?utf-8?q?=2C1/4=5D_drm=3A_Add_drm=5Fvblank=5Fwork=5Fflush=5Fall=28=29=2E?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Apr 2024 09:47:57 -0000
Message-ID: <171265607718.1300822.18444020979258687280@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240409083140.27711-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240409083140.27711-1-maarten.lankhorst@linux.intel.com>
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

--===============4158493315298294494==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI-only,1/4] drm: Add drm_vblank_work_flush_all().
URL   : https://patchwork.freedesktop.org/series/132197/
State : success

== Summary ==

CI Bug Log - changes from xe-1058-2417474ba0be0f6b5838349e9f44419f530511e4_BAT -> xe-pw-132197v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1058-2417474ba0be0f6b5838349e9f44419f530511e4 -> xe-pw-132197v1

  IGT_7802: 7802
  xe-1058-2417474ba0be0f6b5838349e9f44419f530511e4: 2417474ba0be0f6b5838349e9f44419f530511e4
  xe-pw-132197v1: 132197v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132197v1/index.html

--===============4158493315298294494==
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
<tr><td><b>Series:</b></td><td>series starting with [CI-only,1/4] drm: Add drm_vblank_work_flush_all().</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132197/">https://patchwork.freedesktop.org/series/132197/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132197v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132197v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1058-2417474ba0be0f6b5838349e9f44419f530511e4_BAT -&gt; xe-pw-132197v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1058-2417474ba0be0f6b5838349e9f44419f530511e4 -&gt; xe-pw-132197v1</li>
</ul>
<p>IGT_7802: 7802<br />
  xe-1058-2417474ba0be0f6b5838349e9f44419f530511e4: 2417474ba0be0f6b5838349e9f44419f530511e4<br />
  xe-pw-132197v1: 132197v1</p>

</body>
</html>

--===============4158493315298294494==--
