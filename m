Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D50A6C3ABC9
	for <intel-xe@archiver.kernel.org>; Fri, 16 May 2025 12:17:13 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 94DB310EA88;
	Fri, 16 May 2025 12:17:13 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9971910EA87;
 Fri, 16 May 2025 12:17:11 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8205412450596430330=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_CCS_save_restore_for_IGPU?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Satyanarayana K V P" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 16 May 2025 12:17:11 -0000
Message-ID: <174739783161.88034.17928503326720095912@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250516114832.19046-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250516114832.19046-1-satyanarayana.k.v.p@intel.com>
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

--===============8205412450596430330==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: CCS save restore for IGPU
URL   : https://patchwork.freedesktop.org/series/149108/
State : success

== Summary ==

CI Bug Log - changes from xe-3099-3e12fd2f2885242aa951ffc05c3c7bbb63e20d8e_BAT -> xe-pw-149108v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3099-3e12fd2f2885242aa951ffc05c3c7bbb63e20d8e -> xe-pw-149108v1

  IGT_8365: 8365
  xe-3099-3e12fd2f2885242aa951ffc05c3c7bbb63e20d8e: 3e12fd2f2885242aa951ffc05c3c7bbb63e20d8e
  xe-pw-149108v1: 149108v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v1/index.html

--===============8205412450596430330==
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
<tr><td><b>Series:</b></td><td>CCS save restore for IGPU</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149108/">https://patchwork.freedesktop.org/series/149108/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3099-3e12fd2f2885242aa951ffc05c3c7bbb63e20d8e_BAT -&gt; xe-pw-149108v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3099-3e12fd2f2885242aa951ffc05c3c7bbb63e20d8e -&gt; xe-pw-149108v1</li>
</ul>
<p>IGT_8365: 8365<br />
  xe-3099-3e12fd2f2885242aa951ffc05c3c7bbb63e20d8e: 3e12fd2f2885242aa951ffc05c3c7bbb63e20d8e<br />
  xe-pw-149108v1: 149108v1</p>

</body>
</html>

--===============8205412450596430330==--
