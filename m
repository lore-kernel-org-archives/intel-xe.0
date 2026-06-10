Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C2DCD98CC
	for <intel-xe@archiver.kernel.org>; Wed, 10 Jun 2026 18:50:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 935D910EB91;
	Wed, 10 Jun 2026 18:50:38 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 866DD10EB84;
 Wed, 10 Jun 2026 18:50:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0786716821897383592=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_fix_refcount_leak?=
 =?utf-8?q?_in_xe=5Frange=5Ffence=5Finsert=28=29_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Wentao Liang" <vulab@iscas.ac.cn>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 10 Jun 2026 18:50:37 -0000
Message-ID: <178111743754.66528.8226208349985484620@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260610172705.3450560-1-matthew.brost@intel.com>
In-Reply-To: <20260610172705.3450560-1-matthew.brost@intel.com>
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

--===============0786716821897383592==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: fix refcount leak in xe_range_fence_insert() (rev2)
URL   : https://patchwork.freedesktop.org/series/168085/
State : success

== Summary ==

CI Bug Log - changes from xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92_BAT -> xe-pw-168085v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92 -> xe-pw-168085v2

  IGT_8956: 8956
  xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92: 2bfaac2290b880c462bf89fae4fdb1559567af92
  xe-pw-168085v2: 168085v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/index.html

--===============0786716821897383592==
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
<tr><td><b>Series:</b></td><td>drm/xe: fix refcount leak in xe_range_fence_insert() (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168085/">https://patchwork.freedesktop.org/series/168085/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168085v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92_BAT -&gt; xe-pw-168085v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92 -&gt; xe-pw-168085v2</li>
</ul>
<p>IGT_8956: 8956<br />
  xe-5233-2bfaac2290b880c462bf89fae4fdb1559567af92: 2bfaac2290b880c462bf89fae4fdb1559567af92<br />
  xe-pw-168085v2: 168085v2</p>

</body>
</html>

--===============0786716821897383592==--
