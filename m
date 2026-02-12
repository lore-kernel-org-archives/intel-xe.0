Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A29E2EE369F
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 16:41:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54CB510E76D;
	Thu, 12 Feb 2026 16:41:21 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E12CB10E76D;
 Thu, 12 Feb 2026 16:41:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5682596876867363818=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5Bv3?=
 =?utf-8?q?=2C1/1=5D_drm/xe/gsc=3A_Fix_GSC_proxy_cleanup_on_early_initializa?=
 =?utf-8?q?tion_failure_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Feb 2026 16:41:19 -0000
Message-ID: <177091447990.250235.1537479517968444941@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260129231141.512831-1-zhanjun.dong@intel.com>
In-Reply-To: <20260129231141.512831-1-zhanjun.dong@intel.com>
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

--===============5682596876867363818==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [v3,1/1] drm/xe/gsc: Fix GSC proxy cleanup on early initialization failure (rev2)
URL   : https://patchwork.freedesktop.org/series/160867/
State : success

== Summary ==

CI Bug Log - changes from xe-4549-3d7aee9ade34df29041a249fe10c9f5326d2a337_BAT -> xe-pw-160867v2_BAT
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

  * Linux: xe-4549-3d7aee9ade34df29041a249fe10c9f5326d2a337 -> xe-pw-160867v2

  IGT_8753: 8753
  xe-4549-3d7aee9ade34df29041a249fe10c9f5326d2a337: 3d7aee9ade34df29041a249fe10c9f5326d2a337
  xe-pw-160867v2: 160867v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160867v2/index.html

--===============5682596876867363818==
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
<tr><td><b>Series:</b></td><td>series starting with [v3,1/1] drm/xe/gsc: Fix GSC proxy cleanup on early initialization failure (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/160867/">https://patchwork.freedesktop.org/series/160867/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160867v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-160867v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4549-3d7aee9ade34df29041a249fe10c9f5326d2a337_BAT -&gt; xe-pw-160867v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4549-3d7aee9ade34df29041a249fe10c9f5326d2a337 -&gt; xe-pw-160867v2</li>
</ul>
<p>IGT_8753: 8753<br />
  xe-4549-3d7aee9ade34df29041a249fe10c9f5326d2a337: 3d7aee9ade34df29041a249fe10c9f5326d2a337<br />
  xe-pw-160867v2: 160867v2</p>

</body>
</html>

--===============5682596876867363818==--
