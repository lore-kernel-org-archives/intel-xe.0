Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E40DD34092
	for <intel-xe@archiver.kernel.org>; Tue, 27 Jan 2026 15:46:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3DD6F10E0CB;
	Tue, 27 Jan 2026 15:46:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3480010E0CB;
 Tue, 27 Jan 2026 15:46:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7671784707678823530=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Apply_WA=5F160280?=
 =?utf-8?q?05424_to_Media?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Balasubramani Vivekanandan" <balasubramani.vivekanandan@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 27 Jan 2026 15:46:57 -0000
Message-ID: <176952881720.197081.16114120214285134861@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260127144340.1396752-2-balasubramani.vivekanandan@intel.com>
In-Reply-To: <20260127144340.1396752-2-balasubramani.vivekanandan@intel.com>
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

--===============7671784707678823530==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Apply WA_16028005424 to Media
URL   : https://patchwork.freedesktop.org/series/160712/
State : success

== Summary ==

CI Bug Log - changes from xe-4451-ad8c37855805baaa6d835e520e802c950b0491ac_BAT -> xe-pw-160712v1_BAT
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

  * IGT: IGT_8719 -> IGT_8720
  * Linux: xe-4451-ad8c37855805baaa6d835e520e802c950b0491ac -> xe-pw-160712v1

  IGT_8719: 399f1e1cd9d38f0d0ab2c55a9ade415cc8248959 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8720: b37a4d70080afd7426cb249787545df75f762dc0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4451-ad8c37855805baaa6d835e520e802c950b0491ac: ad8c37855805baaa6d835e520e802c950b0491ac
  xe-pw-160712v1: 160712v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160712v1/index.html

--===============7671784707678823530==
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
<tr><td><b>Series:</b></td><td>drm/xe: Apply WA_16028005424 to Media</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160712/">https://patchwork.freedesktop.org/series/160712/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160712v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160712v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4451-ad8c37855805baaa6d835e520e802c950b0491ac_BAT -&gt; xe-pw-160712v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8719 -&gt; IGT_8720</li>
<li>Linux: xe-4451-ad8c37855805baaa6d835e520e802c950b0491ac -&gt; xe-pw-160712v1</li>
</ul>
<p>IGT_8719: 399f1e1cd9d38f0d0ab2c55a9ade415cc8248959 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8720: b37a4d70080afd7426cb249787545df75f762dc0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4451-ad8c37855805baaa6d835e520e802c950b0491ac: ad8c37855805baaa6d835e520e802c950b0491ac<br />
  xe-pw-160712v1: 160712v1</p>

</body>
</html>

--===============7671784707678823530==--
