Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BA79CCA5FFC
	for <intel-xe@archiver.kernel.org>; Wed,  7 Oct 2026 15:50:48 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7AE4610E607;
	Wed,  7 Oct 2026 15:50:48 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25E6A10E607;
 Wed,  7 Oct 2026 15:50:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4681722998370423339=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/cx0=3A_request_TCS?=
 =?utf-8?q?S_power_for_the_non-TC_C20_PHY_on_PTL_port_B?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Burak_G=C3=B6nc=C3=BC_via_B4_Relay?=
 <devnull+burakgon12.gmail.com@kernel.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 07 Oct 2026 15:50:47 -0000
Message-ID: <179138824714.249253.3973532513344507229@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20261006-ptl-port-b-tcss-v1-1-240670342cd3@gmail.com>
In-Reply-To: <20261006-ptl-port-b-tcss-v1-1-240670342cd3@gmail.com>
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

--===============4681722998370423339==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/cx0: request TCSS power for the non-TC C20 PHY on PTL port B
URL   : https://patchwork.freedesktop.org/series/175691/
State : success

== Summary ==

CI Bug Log - changes from xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05_BAT -> xe-pw-175691v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-bmg-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05 -> xe-pw-175691v1

  IGT_9132: 9132
  xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05: 5dc178a4563d8d2ee7fc3a81d005700cbfa04c05
  xe-pw-175691v1: 175691v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/index.html

--===============4681722998370423339==
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
<tr><td><b>Series:</b></td><td>drm/i915/cx0: request TCSS power for the non-TC C20 PHY on PTL port B</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175691/">https://patchwork.freedesktop.org/series/175691/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175691v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05_BAT -&gt; xe-pw-175691v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-bmg-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05 -&gt; xe-pw-175691v1</li>
</ul>
<p>IGT_9132: 9132<br />
  xe-5901-5dc178a4563d8d2ee7fc3a81d005700cbfa04c05: 5dc178a4563d8d2ee7fc3a81d005700cbfa04c05<br />
  xe-pw-175691v1: 175691v1</p>

</body>
</html>

--===============4681722998370423339==--
