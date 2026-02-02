Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B01DCE7FDE0
	for <intel-xe@archiver.kernel.org>; Mon,  2 Feb 2026 21:53:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E04E10E3DE;
	Mon,  2 Feb 2026 21:53:21 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B75D10E3DB;
 Mon,  2 Feb 2026 21:53:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7651436763955419083=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Remove_device_private_pages?=
 =?utf-8?q?_from_physical_address_space_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jordan Niethe" <jniethe@nvidia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Feb 2026 21:53:20 -0000
Message-ID: <177006920028.217225.17433851177881923603@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260202113642.59295-1-jniethe@nvidia.com>
In-Reply-To: <20260202113642.59295-1-jniethe@nvidia.com>
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

--===============7651436763955419083==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Remove device private pages from physical address space (rev9)
URL   : https://patchwork.freedesktop.org/series/159738/
State : success

== Summary ==

CI Bug Log - changes from xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3_BAT -> xe-pw-159738v9_BAT
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

  * Linux: xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3 -> xe-pw-159738v9

  IGT_8729: 8729
  xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3: a68485eec77211a46da7bdb6a0f862e4b365f1e3
  xe-pw-159738v9: 159738v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v9/index.html

--===============7651436763955419083==
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
<tr><td><b>Series:</b></td><td>Remove device private pages from physical address space (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/159738/">https://patchwork.freedesktop.org/series/159738/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-159738v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3_BAT -&gt; xe-pw-159738v9_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3 -&gt; xe-pw-159738v9</li>
</ul>
<p>IGT_8729: 8729<br />
  xe-4484-a68485eec77211a46da7bdb6a0f862e4b365f1e3: a68485eec77211a46da7bdb6a0f862e4b365f1e3<br />
  xe-pw-159738v9: 159738v9</p>

</body>
</html>

--===============7651436763955419083==--
