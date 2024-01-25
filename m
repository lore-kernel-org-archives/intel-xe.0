Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34060C48260
	for <intel-xe@archiver.kernel.org>; Thu, 25 Jan 2024 12:40:42 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E65F410EC5F;
	Thu, 25 Jan 2024 12:40:41 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 192B310F8BB;
 Thu, 25 Jan 2024 12:40:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2848798206873719032=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Add_xe_mocs_suspend_re?=
 =?utf-8?q?sume_kunit?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Janga Rahul Kumar" <janga.rahul.kumar@intel.com>
Date: Thu, 25 Jan 2024 12:40:40 -0000
Message-ID: <170618644010.710554.2476978988549910253@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240125111637.3476519-1-janga.rahul.kumar@intel.com>
In-Reply-To: <20240125111637.3476519-1-janga.rahul.kumar@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============2848798206873719032==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add xe mocs suspend resume kunit
URL   : https://patchwork.freedesktop.org/series/129161/
State : success

== Summary ==

CI Bug Log - changes from xe-684-cad255f28ccca6529104b9497a8d7302ae7eb88a_BAT -> xe-pw-129161v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7691 -> IGT_7692
  * Linux: xe-684-cad255f28ccca6529104b9497a8d7302ae7eb88a -> xe-pw-129161v1

  IGT_7691: 7691
  IGT_7692: 5d9c29c620701497323bf3721146da57efa50952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-684-cad255f28ccca6529104b9497a8d7302ae7eb88a: cad255f28ccca6529104b9497a8d7302ae7eb88a
  xe-pw-129161v1: 129161v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129161v1/index.html

--===============2848798206873719032==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add xe mocs suspend resume kunit</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129161/">https://patchwork.freedesktop.org/series/129161/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129161v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129161v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-684-cad255f28ccca6529104b9497a8d7302ae7eb88a_BAT -&gt; xe-pw-129161v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7691 -&gt; IGT_7692</li>
<li>Linux: xe-684-cad255f28ccca6529104b9497a8d7302ae7eb88a -&gt; xe-pw-129161v1</li>
</ul>
<p>IGT_7691: 7691<br />
  IGT_7692: 5d9c29c620701497323bf3721146da57efa50952 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-684-cad255f28ccca6529104b9497a8d7302ae7eb88a: cad255f28ccca6529104b9497a8d7302ae7eb88a<br />
  xe-pw-129161v1: 129161v1</p>

</body>
</html>

--===============2848798206873719032==--
