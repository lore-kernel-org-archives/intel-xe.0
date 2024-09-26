Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A5F7CDE032
	for <intel-xe@archiver.kernel.org>; Thu, 26 Sep 2024 19:07:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3F03210E089;
	Thu, 26 Sep 2024 19:07:38 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 33A7710E089;
 Thu, 26 Sep 2024 19:07:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7990318012812740586=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Check_return_values_of?=
 =?utf-8?q?_functions_in_xe=5Fgt=5Fshutdown=28=29_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: apoorva.singh@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Sep 2024 19:07:37 -0000
Message-ID: <172737765720.1108589.11078579911477521479@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240926110026.407383-1-apoorva.singh@intel.com>
In-Reply-To: <20240926110026.407383-1-apoorva.singh@intel.com>
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

--===============7990318012812740586==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Check return values of functions in xe_gt_shutdown() (rev3)
URL   : https://patchwork.freedesktop.org/series/138916/
State : success

== Summary ==

CI Bug Log - changes from xe-1981-f82c02cc01798312082cc41feaa473538e517c7b_BAT -> xe-pw-138916v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1981-f82c02cc01798312082cc41feaa473538e517c7b -> xe-pw-138916v3

  IGT_8034: 73eed10d50c7d1f07df07214ae62924d4e377e12 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1981-f82c02cc01798312082cc41feaa473538e517c7b: f82c02cc01798312082cc41feaa473538e517c7b
  xe-pw-138916v3: 138916v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138916v3/index.html

--===============7990318012812740586==
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
<tr><td><b>Series:</b></td><td>drm/xe: Check return values of functions in xe_gt_shutdown() (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/138916/">https://patchwork.freedesktop.org/series/138916/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138916v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-138916v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1981-f82c02cc01798312082cc41feaa473538e517c7b_BAT -&gt; xe-pw-138916v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1981-f82c02cc01798312082cc41feaa473538e517c7b -&gt; xe-pw-138916v3</li>
</ul>
<p>IGT_8034: 73eed10d50c7d1f07df07214ae62924d4e377e12 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1981-f82c02cc01798312082cc41feaa473538e517c7b: f82c02cc01798312082cc41feaa473538e517c7b<br />
  xe-pw-138916v3: 138916v3</p>

</body>
</html>

--===============7990318012812740586==--
