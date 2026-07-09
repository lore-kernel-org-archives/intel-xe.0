Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92529C43458
	for <intel-xe@archiver.kernel.org>; Thu,  9 Jul 2026 23:48:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D7FBC10E0ED;
	Thu,  9 Jul 2026 23:48:23 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 24BA610E0ED;
 Thu,  9 Jul 2026 23:48:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0583351942211393420=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Flush_L2_asynchro?=
 =?utf-8?q?nously_in_xe=5Fbo=5Ftrigger=5Frebind=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matthew Brost" <matthew.brost@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 09 Jul 2026 23:48:23 -0000
Message-ID: <178364090314.172905.13675170721041494470@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260709225309.2056268-1-matthew.brost@intel.com>
In-Reply-To: <20260709225309.2056268-1-matthew.brost@intel.com>
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

--===============0583351942211393420==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Flush L2 asynchronously in xe_bo_trigger_rebind() (rev2)
URL   : https://patchwork.freedesktop.org/series/170046/
State : success

== Summary ==

CI Bug Log - changes from xe-5379-e6db87755f42426899dd6ca45f97eb1b98e2f9fc_BAT -> xe-pw-170046v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5379-e6db87755f42426899dd6ca45f97eb1b98e2f9fc -> xe-pw-170046v2

  IGT_8997: 8997
  xe-5379-e6db87755f42426899dd6ca45f97eb1b98e2f9fc: e6db87755f42426899dd6ca45f97eb1b98e2f9fc
  xe-pw-170046v2: 170046v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v2/index.html

--===============0583351942211393420==
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
<tr><td><b>Series:</b></td><td>drm/xe: Flush L2 asynchronously in xe_bo_trigger_rebind() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/170046/">https://patchwork.freedesktop.org/series/170046/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-170046v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5379-e6db87755f42426899dd6ca45f97eb1b98e2f9fc_BAT -&gt; xe-pw-170046v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5379-e6db87755f42426899dd6ca45f97eb1b98e2f9fc -&gt; xe-pw-170046v2</li>
</ul>
<p>IGT_8997: 8997<br />
  xe-5379-e6db87755f42426899dd6ca45f97eb1b98e2f9fc: e6db87755f42426899dd6ca45f97eb1b98e2f9fc<br />
  xe-pw-170046v2: 170046v2</p>

</body>
</html>

--===============0583351942211393420==--
