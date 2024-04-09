Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B196CD1284
	for <intel-xe@archiver.kernel.org>; Tue,  9 Apr 2024 08:53:56 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 66E58112BD2;
	Tue,  9 Apr 2024 08:53:55 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 984FE112BCD;
 Tue,  9 Apr 2024 08:53:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6267119728102964889=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/=7Bi915=2Cxe=7D=3A_Convert_f?=
 =?utf-8?q?bdev_to_DRM_client?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Thomas Zimmermann" <tzimmermann@suse.de>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 09 Apr 2024 08:53:52 -0000
Message-ID: <171265283261.1300822.17154659664951609685@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240409081029.17843-1-tzimmermann@suse.de>
In-Reply-To: <20240409081029.17843-1-tzimmermann@suse.de>
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

--===============6267119728102964889==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/{i915,xe}: Convert fbdev to DRM client
URL   : https://patchwork.freedesktop.org/series/132193/
State : success

== Summary ==

CI Bug Log - changes from xe-1058-2417474ba0be0f6b5838349e9f44419f530511e4_BAT -> xe-pw-132193v1_BAT
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

  * Linux: xe-1058-2417474ba0be0f6b5838349e9f44419f530511e4 -> xe-pw-132193v1

  IGT_7802: 7802
  xe-1058-2417474ba0be0f6b5838349e9f44419f530511e4: 2417474ba0be0f6b5838349e9f44419f530511e4
  xe-pw-132193v1: 132193v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132193v1/index.html

--===============6267119728102964889==
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
<tr><td><b>Series:</b></td><td>drm/{i915,xe}: Convert fbdev to DRM client</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132193/">https://patchwork.freedesktop.org/series/132193/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132193v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132193v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1058-2417474ba0be0f6b5838349e9f44419f530511e4_BAT -&gt; xe-pw-132193v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1058-2417474ba0be0f6b5838349e9f44419f530511e4 -&gt; xe-pw-132193v1</li>
</ul>
<p>IGT_7802: 7802<br />
  xe-1058-2417474ba0be0f6b5838349e9f44419f530511e4: 2417474ba0be0f6b5838349e9f44419f530511e4<br />
  xe-pw-132193v1: 132193v1</p>

</body>
</html>

--===============6267119728102964889==--
