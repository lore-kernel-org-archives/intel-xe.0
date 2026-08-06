Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38347C55838
	for <intel-xe@archiver.kernel.org>; Thu,  6 Aug 2026 04:16:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BFA0010E280;
	Thu,  6 Aug 2026 04:16:40 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B775010E280;
 Thu,  6 Aug 2026 04:16:39 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3518687497002893616=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Skip_GT_TLB_inval?=
 =?utf-8?q?idation_when_VM_has_no_queues_mapped?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 06 Aug 2026 04:16:39 -0000
Message-ID: <178598979974.22834.15716498106352286867@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260806033205.3858054-1-matthew.brost@intel.com>
In-Reply-To: <20260806033205.3858054-1-matthew.brost@intel.com>
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

--===============3518687497002893616==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Skip GT TLB invalidation when VM has no queues mapped
URL   : https://patchwork.freedesktop.org/series/171687/
State : success

== Summary ==

CI Bug Log - changes from xe-5550-4cbb5eb24c6169972847aa946c5206f97c4880a5_BAT -> xe-pw-171687v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5550-4cbb5eb24c6169972847aa946c5206f97c4880a5 -> xe-pw-171687v1

  IGT_9040: 9040
  xe-5550-4cbb5eb24c6169972847aa946c5206f97c4880a5: 4cbb5eb24c6169972847aa946c5206f97c4880a5
  xe-pw-171687v1: 171687v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171687v1/index.html

--===============3518687497002893616==
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
<tr><td><b>Series:</b></td><td>drm/xe: Skip GT TLB invalidation when VM has no queues mapped</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171687/">https://patchwork.freedesktop.org/series/171687/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171687v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171687v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5550-4cbb5eb24c6169972847aa946c5206f97c4880a5_BAT -&gt; xe-pw-171687v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5550-4cbb5eb24c6169972847aa946c5206f97c4880a5 -&gt; xe-pw-171687v1</li>
</ul>
<p>IGT_9040: 9040<br />
  xe-5550-4cbb5eb24c6169972847aa946c5206f97c4880a5: 4cbb5eb24c6169972847aa946c5206f97c4880a5<br />
  xe-pw-171687v1: 171687v1</p>

</body>
</html>

--===============3518687497002893616==--
