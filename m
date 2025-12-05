Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44F7DD2F7EF
	for <intel-xe@archiver.kernel.org>; Fri,  5 Dec 2025 13:34:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0BF3A10E18A;
	Fri,  5 Dec 2025 13:34:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D549B10E18A;
 Fri,  5 Dec 2025 13:34:12 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1906244974140690917=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vf=3A_fix_return_typ?=
 =?utf-8?q?e_in_vf=5Fmigration=5Finit=5Flate=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 05 Dec 2025 13:34:12 -0000
Message-ID: <176494165285.62152.15662010852833308289@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <aTK9pwJ_roc8vpDi@stanley.mountain>
In-Reply-To: <aTK9pwJ_roc8vpDi@stanley.mountain>
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

--===============1906244974140690917==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: fix return type in vf_migration_init_late()
URL   : https://patchwork.freedesktop.org/series/158555/
State : success

== Summary ==

CI Bug Log - changes from xe-4198-0949b969da10a9fc389d255f398653eb9bc4ffaf_BAT -> xe-pw-158555v1_BAT
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

  * Linux: xe-4198-0949b969da10a9fc389d255f398653eb9bc4ffaf -> xe-pw-158555v1

  IGT_8655: 8655
  xe-4198-0949b969da10a9fc389d255f398653eb9bc4ffaf: 0949b969da10a9fc389d255f398653eb9bc4ffaf
  xe-pw-158555v1: 158555v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158555v1/index.html

--===============1906244974140690917==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: fix return type in vf_migration_init_late()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/158555/">https://patchwork.freedesktop.org/series/158555/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158555v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-158555v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4198-0949b969da10a9fc389d255f398653eb9bc4ffaf_BAT -&gt; xe-pw-158555v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4198-0949b969da10a9fc389d255f398653eb9bc4ffaf -&gt; xe-pw-158555v1</li>
</ul>
<p>IGT_8655: 8655<br />
  xe-4198-0949b969da10a9fc389d255f398653eb9bc4ffaf: 0949b969da10a9fc389d255f398653eb9bc4ffaf<br />
  xe-pw-158555v1: 158555v1</p>

</body>
</html>

--===============1906244974140690917==--
