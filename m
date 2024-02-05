Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2BB56C48291
	for <intel-xe@archiver.kernel.org>; Mon,  5 Feb 2024 10:37:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EB5921124BD;
	Mon,  5 Feb 2024 10:37:21 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C93371124BD;
 Mon,  5 Feb 2024 10:37:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8652280116129044684=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_drm/xe=3A_A?=
 =?utf-8?q?dd_uapi_for_dumpable_bos_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 05 Feb 2024 10:37:20 -0000
Message-ID: <170712944082.1024443.11056185886585439465@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240202224052.848867-1-maarten.lankhorst@linux.intel.com>
In-Reply-To: <20240202224052.848867-1-maarten.lankhorst@linux.intel.com>
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

--===============8652280116129044684==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with drm/xe: Add uapi for dumpable bos (rev3)
URL   : https://patchwork.freedesktop.org/series/129496/
State : success

== Summary ==

CI Bug Log - changes from xe-724-200b5a40e45282dfa868d4cb363dca46fc2cf60e_BAT -> xe-pw-129496v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-724-200b5a40e45282dfa868d4cb363dca46fc2cf60e -> xe-pw-129496v3

  IGT_7702: bf075a74ece1956fc0e554291591b9da3eab54cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-724-200b5a40e45282dfa868d4cb363dca46fc2cf60e: 200b5a40e45282dfa868d4cb363dca46fc2cf60e
  xe-pw-129496v3: 129496v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v3/index.html

--===============8652280116129044684==
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
<tr><td><b>Series:</b></td><td>series starting with drm/xe: Add uapi for dumpable bos (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129496/">https://patchwork.freedesktop.org/series/129496/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129496v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-724-200b5a40e45282dfa868d4cb363dca46fc2cf60e_BAT -&gt; xe-pw-129496v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-724-200b5a40e45282dfa868d4cb363dca46fc2cf60e -&gt; xe-pw-129496v3</li>
</ul>
<p>IGT_7702: bf075a74ece1956fc0e554291591b9da3eab54cf @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-724-200b5a40e45282dfa868d4cb363dca46fc2cf60e: 200b5a40e45282dfa868d4cb363dca46fc2cf60e<br />
  xe-pw-129496v3: 129496v3</p>

</body>
</html>

--===============8652280116129044684==--
