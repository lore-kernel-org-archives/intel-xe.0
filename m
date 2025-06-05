Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30837C5AE59
	for <intel-xe@archiver.kernel.org>; Thu,  5 Jun 2025 17:52:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D037A10E314;
	Thu,  5 Jun 2025 17:52:16 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 55FAA10E2F4;
 Thu,  5 Jun 2025 17:52:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0130968336924377193=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_CCS_save_restore_for_IGPU_?=
 =?utf-8?q?=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "K V P, Satyanarayana" <satyanarayana.k.v.p@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Jun 2025 17:52:16 -0000
Message-ID: <174914593634.52551.15397196609732406976@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250605122956.10685-1-satyanarayana.k.v.p@intel.com>
In-Reply-To: <20250605122956.10685-1-satyanarayana.k.v.p@intel.com>
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

--===============0130968336924377193==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: CCS save restore for IGPU (rev5)
URL   : https://patchwork.freedesktop.org/series/149108/
State : success

== Summary ==

CI Bug Log - changes from xe-3199-4a82dcabe4230c77b75d4d4d10829458c6acb311_BAT -> xe-pw-149108v5_BAT
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

  * Linux: xe-3199-4a82dcabe4230c77b75d4d4d10829458c6acb311 -> xe-pw-149108v5

  IGT_8396: 8396
  xe-3199-4a82dcabe4230c77b75d4d4d10829458c6acb311: 4a82dcabe4230c77b75d4d4d10829458c6acb311
  xe-pw-149108v5: 149108v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v5/index.html

--===============0130968336924377193==
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
<tr><td><b>Series:</b></td><td>CCS save restore for IGPU (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149108/">https://patchwork.freedesktop.org/series/149108/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149108v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3199-4a82dcabe4230c77b75d4d4d10829458c6acb311_BAT -&gt; xe-pw-149108v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3199-4a82dcabe4230c77b75d4d4d10829458c6acb311 -&gt; xe-pw-149108v5</li>
</ul>
<p>IGT_8396: 8396<br />
  xe-3199-4a82dcabe4230c77b75d4d4d10829458c6acb311: 4a82dcabe4230c77b75d4d4d10829458c6acb311<br />
  xe-pw-149108v5: 149108v5</p>

</body>
</html>

--===============0130968336924377193==--
