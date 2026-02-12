Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49F3BEE369C
	for <intel-xe@archiver.kernel.org>; Thu, 12 Feb 2026 15:54:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 054CB10E769;
	Thu, 12 Feb 2026 15:54:01 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 791C010E76A;
 Thu, 12 Feb 2026 15:53:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4251598226147450310=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/aux=3A_use_polling?=
 =?utf-8?q?_when_irqs_are_unavailable_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Grzelak?= <michal.grzelak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Feb 2026 15:53:59 -0000
Message-ID: <177091163947.250235.2930552520171223906@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260210111952.4138954-1-michal.grzelak@intel.com>
In-Reply-To: <20260210111952.4138954-1-michal.grzelak@intel.com>
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

--===============4251598226147450310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/aux: use polling when irqs are unavailable (rev2)
URL   : https://patchwork.freedesktop.org/series/161431/
State : success

== Summary ==

CI Bug Log - changes from xe-4549-3d7aee9ade34df29041a249fe10c9f5326d2a337_BAT -> xe-pw-161431v2_BAT
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

  * Linux: xe-4549-3d7aee9ade34df29041a249fe10c9f5326d2a337 -> xe-pw-161431v2

  IGT_8753: 8753
  xe-4549-3d7aee9ade34df29041a249fe10c9f5326d2a337: 3d7aee9ade34df29041a249fe10c9f5326d2a337
  xe-pw-161431v2: 161431v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161431v2/index.html

--===============4251598226147450310==
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
<tr><td><b>Series:</b></td><td>drm/i915/aux: use polling when irqs are unavailable (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161431/">https://patchwork.freedesktop.org/series/161431/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161431v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161431v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4549-3d7aee9ade34df29041a249fe10c9f5326d2a337_BAT -&gt; xe-pw-161431v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4549-3d7aee9ade34df29041a249fe10c9f5326d2a337 -&gt; xe-pw-161431v2</li>
</ul>
<p>IGT_8753: 8753<br />
  xe-4549-3d7aee9ade34df29041a249fe10c9f5326d2a337: 3d7aee9ade34df29041a249fe10c9f5326d2a337<br />
  xe-pw-161431v2: 161431v2</p>

</body>
</html>

--===============4251598226147450310==--
