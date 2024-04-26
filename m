Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0121CC4345F
	for <intel-xe@archiver.kernel.org>; Fri, 26 Apr 2024 10:56:07 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B60ED112167;
	Fri, 26 Apr 2024 10:56:07 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6988E112167;
 Fri, 26 Apr 2024 10:56:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8018162549830889987=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5BCI=2C1/5?=
 =?utf-8?q?=5D_drm/xe=3A_Introduce_has=5Fatomic=5Fenable=5Fpte=5Fbit_device_?=
 =?utf-8?q?info?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nirmoy Das" <nirmoy.das@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 26 Apr 2024 10:56:06 -0000
Message-ID: <171412896643.1668691.14818291831796179062@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240426092053.2863-1-nirmoy.das@intel.com>
In-Reply-To: <20240426092053.2863-1-nirmoy.das@intel.com>
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

--===============8018162549830889987==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/5] drm/xe: Introduce has_atomic_enable_pte_bit device info
URL   : https://patchwork.freedesktop.org/series/132947/
State : success

== Summary ==

CI Bug Log - changes from xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f_BAT -> xe-pw-132947v1_BAT
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

  * IGT: IGT_7824 -> IGT_7825
  * Linux: xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f -> xe-pw-132947v1

  IGT_7824: 7824
  IGT_7825: 28b2a1b0be86e33a2fc04a022e04f07bd25b66d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f: f39ba481e5873b7617afc2e8cf618ac9dc85123f
  xe-pw-132947v1: 132947v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132947v1/index.html

--===============8018162549830889987==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/5] drm/xe: Introduce has_atomic_enable_pte_bit device info</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132947/">https://patchwork.freedesktop.org/series/132947/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132947v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132947v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f_BAT -&gt; xe-pw-132947v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7824 -&gt; IGT_7825</li>
<li>Linux: xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f -&gt; xe-pw-132947v1</li>
</ul>
<p>IGT_7824: 7824<br />
  IGT_7825: 28b2a1b0be86e33a2fc04a022e04f07bd25b66d9 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1188-f39ba481e5873b7617afc2e8cf618ac9dc85123f: f39ba481e5873b7617afc2e8cf618ac9dc85123f<br />
  xe-pw-132947v1: 132947v1</p>

</body>
</html>

--===============8018162549830889987==--
