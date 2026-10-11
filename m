Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53B89CA9EC7
	for <intel-xe@archiver.kernel.org>; Sun, 11 Oct 2026 03:41:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C47D10E2A2;
	Sun, 11 Oct 2026 03:41:54 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F145D10E2A2;
 Sun, 11 Oct 2026 03:41:52 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1394807616715012495=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_don=27t_dereferen?=
 =?utf-8?q?ce_a_NULL_resource_in_xe=5Fevict=5Fflags=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Niranjana Vishwanathapura" <niranjana.vishwanathapura@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 11 Oct 2026 03:41:52 -0000
Message-ID: <179169011296.7908.12315850796209794661@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261010054041.1327217-4-niranjana.vishwanathapura@intel.com>
In-Reply-To: <20261010054041.1327217-4-niranjana.vishwanathapura@intel.com>
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

--===============1394807616715012495==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: don't dereference a NULL resource in xe_evict_flags() (rev2)
URL   : https://patchwork.freedesktop.org/series/175869/
State : success

== Summary ==

CI Bug Log - changes from xe-5923-dbaec5af2925b3807685f98669edf8b11ed1ccd4_BAT -> xe-pw-175869v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5923-dbaec5af2925b3807685f98669edf8b11ed1ccd4 -> xe-pw-175869v2

  IGT_9138: 9138
  xe-5923-dbaec5af2925b3807685f98669edf8b11ed1ccd4: dbaec5af2925b3807685f98669edf8b11ed1ccd4
  xe-pw-175869v2: 175869v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175869v2/index.html

--===============1394807616715012495==
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
<tr><td><b>Series:</b></td><td>drm/xe: don&#x27;t dereference a NULL resource in xe_evict_flags() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175869/">https://patchwork.freedesktop.org/series/175869/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175869v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175869v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5923-dbaec5af2925b3807685f98669edf8b11ed1ccd4_BAT -&gt; xe-pw-175869v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5923-dbaec5af2925b3807685f98669edf8b11ed1ccd4 -&gt; xe-pw-175869v2</li>
</ul>
<p>IGT_9138: 9138<br />
  xe-5923-dbaec5af2925b3807685f98669edf8b11ed1ccd4: dbaec5af2925b3807685f98669edf8b11ed1ccd4<br />
  xe-pw-175869v2: 175869v2</p>

</body>
</html>

--===============1394807616715012495==--
