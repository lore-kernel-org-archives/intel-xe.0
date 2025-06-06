Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3836FC61CE7
	for <intel-xe@archiver.kernel.org>; Fri,  6 Jun 2025 21:28:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DE94210EBB4;
	Fri,  6 Jun 2025 21:28:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A0A9110EC69;
 Fri,  6 Jun 2025 21:28:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5434743514194994038=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_WildCat_Lake_support_?=
 =?utf-8?q?=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dnyaneshwar Bhadane" <dnyaneshwar.bhadane@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 06 Jun 2025 21:28:45 -0000
Message-ID: <174924532565.57475.13823901724085961034@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
In-Reply-To: <20250606195104.1771715-1-dnyaneshwar.bhadane@intel.com>
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

--===============5434743514194994038==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add WildCat Lake support (rev3)
URL   : https://patchwork.freedesktop.org/series/149794/
State : success

== Summary ==

CI Bug Log - changes from xe-3213-16851de7bfa7920ffdc16679920dc1af73e835ec_BAT -> xe-pw-149794v3_BAT
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

  * Linux: xe-3213-16851de7bfa7920ffdc16679920dc1af73e835ec -> xe-pw-149794v3

  IGT_8401: 8401
  xe-3213-16851de7bfa7920ffdc16679920dc1af73e835ec: 16851de7bfa7920ffdc16679920dc1af73e835ec
  xe-pw-149794v3: 149794v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149794v3/index.html

--===============5434743514194994038==
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
<tr><td><b>Series:</b></td><td>Add WildCat Lake support (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149794/">https://patchwork.freedesktop.org/series/149794/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149794v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149794v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3213-16851de7bfa7920ffdc16679920dc1af73e835ec_BAT -&gt; xe-pw-149794v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3213-16851de7bfa7920ffdc16679920dc1af73e835ec -&gt; xe-pw-149794v3</li>
</ul>
<p>IGT_8401: 8401<br />
  xe-3213-16851de7bfa7920ffdc16679920dc1af73e835ec: 16851de7bfa7920ffdc16679920dc1af73e835ec<br />
  xe-pw-149794v3: 149794v3</p>

</body>
</html>

--===============5434743514194994038==--
