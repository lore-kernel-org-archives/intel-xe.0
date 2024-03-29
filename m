Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A6D4C6FD1F
	for <intel-xe@archiver.kernel.org>; Fri, 29 Mar 2024 20:00:40 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A05BD112305;
	Fri, 29 Mar 2024 20:00:40 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 10D23112305;
 Fri, 29 Mar 2024 20:00:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2525222276560970970=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/3=5D_d?=
 =?utf-8?q?rm/xe/xe=5Fguc=5Fsubmit=3A_Fix_exec_queue_stop_race_condition?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 29 Mar 2024 20:00:39 -0000
Message-ID: <171174243906.1081134.7438545977348238005@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240329184929.3675256-1-jonathan.cavitt@intel.com>
In-Reply-To: <20240329184929.3675256-1-jonathan.cavitt@intel.com>
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

--===============2525222276560970970==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] drm/xe/xe_guc_submit: Fix exec queue stop race condition
URL   : https://patchwork.freedesktop.org/series/131824/
State : success

== Summary ==

CI Bug Log - changes from xe-1017-15fe5f853b066bf84109866c9a1e4bc0bc15faf0_BAT -> xe-pw-131824v1_BAT
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

  * Linux: xe-1017-15fe5f853b066bf84109866c9a1e4bc0bc15faf0 -> xe-pw-131824v1

  IGT_7791: 7d7be3a56e299d9ad14ac2c6535a7e14b4cfd4df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1017-15fe5f853b066bf84109866c9a1e4bc0bc15faf0: 15fe5f853b066bf84109866c9a1e4bc0bc15faf0
  xe-pw-131824v1: 131824v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131824v1/index.html

--===============2525222276560970970==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] drm/xe/xe_guc_submit: Fix exec queue stop race condition</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131824/">https://patchwork.freedesktop.org/series/131824/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131824v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131824v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1017-15fe5f853b066bf84109866c9a1e4bc0bc15faf0_BAT -&gt; xe-pw-131824v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1017-15fe5f853b066bf84109866c9a1e4bc0bc15faf0 -&gt; xe-pw-131824v1</li>
</ul>
<p>IGT_7791: 7d7be3a56e299d9ad14ac2c6535a7e14b4cfd4df @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1017-15fe5f853b066bf84109866c9a1e4bc0bc15faf0: 15fe5f853b066bf84109866c9a1e4bc0bc15faf0<br />
  xe-pw-131824v1: 131824v1</p>

</body>
</html>

--===============2525222276560970970==--
