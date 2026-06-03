Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03BB8CD6E4A
	for <intel-xe@archiver.kernel.org>; Wed,  3 Jun 2026 07:45:34 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B25F010F97E;
	Wed,  3 Jun 2026 07:45:33 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F27D810F97E;
 Wed,  3 Jun 2026 07:45:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2689711744046469567=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_fix_LR_TLB_invalidation_gap?=
 =?utf-8?q?s_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: tilak.tirumalesh.tangudu@intel.com
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 03 Jun 2026 07:45:32 -0000
Message-ID: <178047273298.38614.446279317727356093@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260603065217.3131066-1-tilak.tirumalesh.tangudu@intel.com>
In-Reply-To: <20260603065217.3131066-1-tilak.tirumalesh.tangudu@intel.com>
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

--===============2689711744046469567==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: fix LR TLB invalidation gaps (rev5)
URL   : https://patchwork.freedesktop.org/series/167262/
State : success

== Summary ==

CI Bug Log - changes from xe-5189-ab2d36ce7e67d2825cea19ea956947a21e932f70_BAT -> xe-pw-167262v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5189-ab2d36ce7e67d2825cea19ea956947a21e932f70 -> xe-pw-167262v5

  IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5189-ab2d36ce7e67d2825cea19ea956947a21e932f70: ab2d36ce7e67d2825cea19ea956947a21e932f70
  xe-pw-167262v5: 167262v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167262v5/index.html

--===============2689711744046469567==
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
<tr><td><b>Series:</b></td><td>fix LR TLB invalidation gaps (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167262/">https://patchwork.freedesktop.org/series/167262/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167262v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167262v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5189-ab2d36ce7e67d2825cea19ea956947a21e932f70_BAT -&gt; xe-pw-167262v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5189-ab2d36ce7e67d2825cea19ea956947a21e932f70 -&gt; xe-pw-167262v5</li>
</ul>
<p>IGT_8947: e322bfd77da04314dd310da9a6cf0562b5751f1f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5189-ab2d36ce7e67d2825cea19ea956947a21e932f70: ab2d36ce7e67d2825cea19ea956947a21e932f70<br />
  xe-pw-167262v5: 167262v5</p>

</body>
</html>

--===============2689711744046469567==--
