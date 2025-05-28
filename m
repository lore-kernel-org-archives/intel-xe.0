Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1D51C3ABB2
	for <intel-xe@archiver.kernel.org>; Wed, 28 May 2025 18:17:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 946C910E684;
	Wed, 28 May 2025 18:17:01 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EA33710E684;
 Wed, 28 May 2025 18:17:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7801162474409428375=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/sched=3A_stop_re-su?=
 =?utf-8?q?bmitting_signalled_jobs_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Auld" <matthew.auld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 28 May 2025 18:17:00 -0000
Message-ID: <174845622093.29549.4382443138971035132@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250528113328.289392-2-matthew.auld@intel.com>
In-Reply-To: <20250528113328.289392-2-matthew.auld@intel.com>
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

--===============7801162474409428375==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/sched: stop re-submitting signalled jobs (rev4)
URL   : https://patchwork.freedesktop.org/series/149426/
State : success

== Summary ==

CI Bug Log - changes from xe-3151-56d2b14961751a677ff1f7ff8b93a6c814ce2be3_FULL -> xe-pw-149426v4_FULL
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

  * Linux: xe-3151-56d2b14961751a677ff1f7ff8b93a6c814ce2be3 -> xe-pw-149426v4

  IGT_8381: 8381
  xe-3151-56d2b14961751a677ff1f7ff8b93a6c814ce2be3: 56d2b14961751a677ff1f7ff8b93a6c814ce2be3
  xe-pw-149426v4: 149426v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v4/index.html

--===============7801162474409428375==
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
<tr><td><b>Series:</b></td><td>drm/xe/sched: stop re-submitting signalled jobs (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149426/">https://patchwork.freedesktop.org/series/149426/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149426v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3151-56d2b14961751a677ff1f7ff8b93a6c814ce2be3_FULL -&gt; xe-pw-149426v4_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3151-56d2b14961751a677ff1f7ff8b93a6c814ce2be3 -&gt; xe-pw-149426v4</li>
</ul>
<p>IGT_8381: 8381<br />
  xe-3151-56d2b14961751a677ff1f7ff8b93a6c814ce2be3: 56d2b14961751a677ff1f7ff8b93a6c814ce2be3<br />
  xe-pw-149426v4: 149426v4</p>

</body>
</html>

--===============7801162474409428375==--
