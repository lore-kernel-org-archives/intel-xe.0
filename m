Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19A39CD98E4
	for <intel-xe@archiver.kernel.org>; Wed, 17 Jun 2026 14:56:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 99F7510EA4C;
	Wed, 17 Jun 2026 14:56:18 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 142EA10EA4C;
 Wed, 17 Jun 2026 14:56:17 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4132735734862086270=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Return_error_on_n?=
 =?utf-8?q?on-migratable_faults_requiring_devmem?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 17 Jun 2026 14:56:17 -0000
Message-ID: <178170817706.90143.14951933623743505808@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260617135101.1245574-1-matthew.brost@intel.com>
In-Reply-To: <20260617135101.1245574-1-matthew.brost@intel.com>
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

--===============4132735734862086270==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Return error on non-migratable faults requiring devmem
URL   : https://patchwork.freedesktop.org/series/168716/
State : success

== Summary ==

CI Bug Log - changes from xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b_BAT -> xe-pw-168716v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b -> xe-pw-168716v1

  IGT_8969: 5a8fa64e48c3c30af9afa2824d6adb5ad2bcc5a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b: 1f1e03ee0c160129c336e9301aeed557f406153b
  xe-pw-168716v1: 168716v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/index.html

--===============4132735734862086270==
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
<tr><td><b>Series:</b></td><td>drm/xe: Return error on non-migratable faults requiring devmem</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168716/">https://patchwork.freedesktop.org/series/168716/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168716v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b_BAT -&gt; xe-pw-168716v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b -&gt; xe-pw-168716v1</li>
</ul>
<p>IGT_8969: 5a8fa64e48c3c30af9afa2824d6adb5ad2bcc5a3 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5273-1f1e03ee0c160129c336e9301aeed557f406153b: 1f1e03ee0c160129c336e9301aeed557f406153b<br />
  xe-pw-168716v1: 168716v1</p>

</body>
</html>

--===============4132735734862086270==--
