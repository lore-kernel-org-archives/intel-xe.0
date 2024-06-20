Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CB79CC27C79
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 22:08:32 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 85D9F10E28C;
	Thu, 20 Jun 2024 22:08:32 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31A3D10E26B;
 Thu, 20 Jun 2024 22:08:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6336976948648237163=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Support_PMT_features_in_Xe_=28re?=
 =?utf-8?q?v2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michael J. Ruhl" <michael.j.ruhl@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Jun 2024 22:08:31 -0000
Message-ID: <171892131119.130458.4735852977704423183@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240620212055.3314064-1-michael.j.ruhl@intel.com>
In-Reply-To: <20240620212055.3314064-1-michael.j.ruhl@intel.com>
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

--===============6336976948648237163==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Support PMT features in Xe (rev2)
URL   : https://patchwork.freedesktop.org/series/133472/
State : success

== Summary ==

CI Bug Log - changes from xe-1508-300968fc8a02f50ce96efdc9be4f1f17f3a486d4_BAT -> xe-pw-133472v2_BAT
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

  * Linux: xe-1508-300968fc8a02f50ce96efdc9be4f1f17f3a486d4 -> xe-pw-133472v2

  IGT_7894: 7894
  xe-1508-300968fc8a02f50ce96efdc9be4f1f17f3a486d4: 300968fc8a02f50ce96efdc9be4f1f17f3a486d4
  xe-pw-133472v2: 133472v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133472v2/index.html

--===============6336976948648237163==
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
<tr><td><b>Series:</b></td><td>Support PMT features in Xe (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133472/">https://patchwork.freedesktop.org/series/133472/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133472v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133472v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1508-300968fc8a02f50ce96efdc9be4f1f17f3a486d4_BAT -&gt; xe-pw-133472v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1508-300968fc8a02f50ce96efdc9be4f1f17f3a486d4 -&gt; xe-pw-133472v2</li>
</ul>
<p>IGT_7894: 7894<br />
  xe-1508-300968fc8a02f50ce96efdc9be4f1f17f3a486d4: 300968fc8a02f50ce96efdc9be4f1f17f3a486d4<br />
  xe-pw-133472v2: 133472v2</p>

</body>
</html>

--===============6336976948648237163==--
