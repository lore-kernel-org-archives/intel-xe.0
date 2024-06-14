Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0230C27C6E
	for <intel-xe@archiver.kernel.org>; Fri, 14 Jun 2024 10:28:50 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4C0A610E099;
	Fri, 14 Jun 2024 10:28:50 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4910610ED03;
 Fri, 14 Jun 2024 10:28:49 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3860817765847630239=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/sched=5Fjob=3A_Promote_xe?=
 =?utf-8?q?=5Fsched=5Fjob=5Fadd=5Fdeps=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Jun 2024 10:28:49 -0000
Message-ID: <171836092929.77189.15538246448399314383@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240614094433.775866-1-francois.dugast@intel.com>
In-Reply-To: <20240614094433.775866-1-francois.dugast@intel.com>
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

--===============3860817765847630239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/sched_job: Promote xe_sched_job_add_deps()
URL   : https://patchwork.freedesktop.org/series/134880/
State : success

== Summary ==

CI Bug Log - changes from xe-1468-134eae3a249beff1ff5f3a4326e89cceb458fb8a_BAT -> xe-pw-134880v1_BAT
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

  * Linux: xe-1468-134eae3a249beff1ff5f3a4326e89cceb458fb8a -> xe-pw-134880v1

  IGT_7888: 021538d059575eb9f93d36fea36015cd3f9fca7d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1468-134eae3a249beff1ff5f3a4326e89cceb458fb8a: 134eae3a249beff1ff5f3a4326e89cceb458fb8a
  xe-pw-134880v1: 134880v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134880v1/index.html

--===============3860817765847630239==
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
<tr><td><b>Series:</b></td><td>drm/xe/sched_job: Promote xe_sched_job_add_deps()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134880/">https://patchwork.freedesktop.org/series/134880/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134880v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134880v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1468-134eae3a249beff1ff5f3a4326e89cceb458fb8a_BAT -&gt; xe-pw-134880v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1468-134eae3a249beff1ff5f3a4326e89cceb458fb8a -&gt; xe-pw-134880v1</li>
</ul>
<p>IGT_7888: 021538d059575eb9f93d36fea36015cd3f9fca7d @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1468-134eae3a249beff1ff5f3a4326e89cceb458fb8a: 134eae3a249beff1ff5f3a4326e89cceb458fb8a<br />
  xe-pw-134880v1: 134880v1</p>

</body>
</html>

--===============3860817765847630239==--
