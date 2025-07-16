Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 103BDC83F17
	for <intel-xe@archiver.kernel.org>; Wed, 16 Jul 2025 01:19:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8D0A10E69A;
	Wed, 16 Jul 2025 01:19:27 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3A00610E652;
 Wed, 16 Jul 2025 01:19:27 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6622603324363807228=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_a_NULL_vs_IS?=
 =?utf-8?q?=5FERR=28=29_bug_in_xe=5Fi2c=5Fregister=5Fadapter=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dan Carpenter" <dan.carpenter@linaro.org>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 16 Jul 2025 01:19:27 -0000
Message-ID: <175262876722.165134.17491872594589184672@1538d3639d33>
X-Patchwork-Hint: ignore
References: <65825d00-81ab-4665-af51-4fff6786a250@sabinyo.mountain>
In-Reply-To: <65825d00-81ab-4665-af51-4fff6786a250@sabinyo.mountain>
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

--===============6622603324363807228==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix a NULL vs IS_ERR() bug in xe_i2c_register_adapter()
URL   : https://patchwork.freedesktop.org/series/151675/
State : success

== Summary ==

CI Bug Log - changes from xe-3419-394c972916ad8aa294c31fee993bde243b786bac_BAT -> xe-pw-151675v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3419-394c972916ad8aa294c31fee993bde243b786bac -> xe-pw-151675v1

  IGT_8460: 8460
  xe-3419-394c972916ad8aa294c31fee993bde243b786bac: 394c972916ad8aa294c31fee993bde243b786bac
  xe-pw-151675v1: 151675v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151675v1/index.html

--===============6622603324363807228==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix a NULL vs IS_ERR() bug in xe_i2c_register_adapter()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151675/">https://patchwork.freedesktop.org/series/151675/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151675v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151675v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3419-394c972916ad8aa294c31fee993bde243b786bac_BAT -&gt; xe-pw-151675v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3419-394c972916ad8aa294c31fee993bde243b786bac -&gt; xe-pw-151675v1</li>
</ul>
<p>IGT_8460: 8460<br />
  xe-3419-394c972916ad8aa294c31fee993bde243b786bac: 394c972916ad8aa294c31fee993bde243b786bac<br />
  xe-pw-151675v1: 151675v1</p>

</body>
</html>

--===============6622603324363807228==--
