Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FA19C55838
	for <intel-xe@archiver.kernel.org>; Tue,  4 Aug 2026 11:46:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 553D510E9C5;
	Tue,  4 Aug 2026 11:46:01 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 51DD910E13F;
 Tue,  4 Aug 2026 11:46:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8383212060001992727=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_Use_array_si?=
 =?utf-8?q?ze_for_intersect=5Frates=28=29_bound_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Suraj Kandpal" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Aug 2026 11:46:00 -0000
Message-ID: <178584396033.17167.12456877979075865355@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260804085658.1306761-1-suraj.kandpal@intel.com>
In-Reply-To: <20260804085658.1306761-1-suraj.kandpal@intel.com>
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

--===============8383212060001992727==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Use array size for intersect_rates() bound (rev2)
URL   : https://patchwork.freedesktop.org/series/171568/
State : success

== Summary ==

CI Bug Log - changes from xe-5535-f8d080b47819f01011c1b9c3c875badbb67ec955_BAT -> xe-pw-171568v2_BAT
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

  * Linux: xe-5535-f8d080b47819f01011c1b9c3c875badbb67ec955 -> xe-pw-171568v2

  IGT_9036: 9036
  xe-5535-f8d080b47819f01011c1b9c3c875badbb67ec955: f8d080b47819f01011c1b9c3c875badbb67ec955
  xe-pw-171568v2: 171568v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171568v2/index.html

--===============8383212060001992727==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Use array size for intersect_rates() bound (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171568/">https://patchwork.freedesktop.org/series/171568/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171568v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171568v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5535-f8d080b47819f01011c1b9c3c875badbb67ec955_BAT -&gt; xe-pw-171568v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5535-f8d080b47819f01011c1b9c3c875badbb67ec955 -&gt; xe-pw-171568v2</li>
</ul>
<p>IGT_9036: 9036<br />
  xe-5535-f8d080b47819f01011c1b9c3c875badbb67ec955: f8d080b47819f01011c1b9c3c875badbb67ec955<br />
  xe-pw-171568v2: 171568v2</p>

</body>
</html>

--===============8383212060001992727==--
