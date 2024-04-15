Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B385C4345F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Apr 2024 17:07:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 50DFF10E782;
	Mon, 15 Apr 2024 17:07:57 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DB2A110E22E;
 Mon, 15 Apr 2024 17:07:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7781187814570713725=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5Bv7=2C1/2?=
 =?utf-8?q?=5D_drm/xe=3A_add_a_new_debugfs_file_-_mmio?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Koby Elbaz" <kelbaz@habana.ai>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Apr 2024 17:07:55 -0000
Message-ID: <171320087589.1404431.17306823741964186640@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240414081105.1199559-1-kelbaz@habana.ai>
In-Reply-To: <20240414081105.1199559-1-kelbaz@habana.ai>
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

--===============7781187814570713725==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v7,1/2] drm/xe: add a new debugfs file - mmio
URL   : https://patchwork.freedesktop.org/series/132409/
State : success

== Summary ==

CI Bug Log - changes from xe-1088-40c465bb2f01d38693dd2ef3ed84b89f95f493f4_BAT -> xe-pw-132409v1_BAT
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

  * Linux: xe-1088-40c465bb2f01d38693dd2ef3ed84b89f95f493f4 -> xe-pw-132409v1

  IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1088-40c465bb2f01d38693dd2ef3ed84b89f95f493f4: 40c465bb2f01d38693dd2ef3ed84b89f95f493f4
  xe-pw-132409v1: 132409v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v1/index.html

--===============7781187814570713725==
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
<tr><td><b>Series:</b></td><td>series starting with [v7,1/2] drm/xe: add a new debugfs file - mmio</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132409/">https://patchwork.freedesktop.org/series/132409/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132409v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1088-40c465bb2f01d38693dd2ef3ed84b89f95f493f4_BAT -&gt; xe-pw-132409v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1088-40c465bb2f01d38693dd2ef3ed84b89f95f493f4 -&gt; xe-pw-132409v1</li>
</ul>
<p>IGT_7806: 849cd963ce7e8222dcf17cc872d355181fd2c2a2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1088-40c465bb2f01d38693dd2ef3ed84b89f95f493f4: 40c465bb2f01d38693dd2ef3ed84b89f95f493f4<br />
  xe-pw-132409v1: 132409v1</p>

</body>
</html>

--===============7781187814570713725==--
