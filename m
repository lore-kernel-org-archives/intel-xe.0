Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C7CCBC3DA61
	for <intel-xe@archiver.kernel.org>; Wed, 24 Jul 2024 17:32:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7656010E772;
	Wed, 24 Jul 2024 17:32:46 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6C87110E772;
 Wed, 24 Jul 2024 17:32:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8401212389702187434=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Fix_possible_UAF_in_gu?=
 =?utf-8?q?c=5Fexec=5Fqueue=5Fprocess=5Fmsg_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 24 Jul 2024 17:32:44 -0000
Message-ID: <172184236443.363238.6311126014441291979@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240724164341.1848954-1-matthew.brost@intel.com>
In-Reply-To: <20240724164341.1848954-1-matthew.brost@intel.com>
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

--===============8401212389702187434==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix possible UAF in guc_exec_queue_process_msg (rev3)
URL   : https://patchwork.freedesktop.org/series/136397/
State : success

== Summary ==

CI Bug Log - changes from xe-1659-d3f0e5757ac089a2e31619da4452dfb3359803a0_BAT -> xe-pw-136397v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1659-d3f0e5757ac089a2e31619da4452dfb3359803a0 -> xe-pw-136397v3

  IGT_7936: 7936
  xe-1659-d3f0e5757ac089a2e31619da4452dfb3359803a0: d3f0e5757ac089a2e31619da4452dfb3359803a0
  xe-pw-136397v3: 136397v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136397v3/index.html

--===============8401212389702187434==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix possible UAF in guc_exec_queue_process_msg (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/136397/">https://patchwork.freedesktop.org/series/136397/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136397v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-136397v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1659-d3f0e5757ac089a2e31619da4452dfb3359803a0_BAT -&gt; xe-pw-136397v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1659-d3f0e5757ac089a2e31619da4452dfb3359803a0 -&gt; xe-pw-136397v3</li>
</ul>
<p>IGT_7936: 7936<br />
  xe-1659-d3f0e5757ac089a2e31619da4452dfb3359803a0: d3f0e5757ac089a2e31619da4452dfb3359803a0<br />
  xe-pw-136397v3: 136397v3</p>

</body>
</html>

--===============8401212389702187434==--
