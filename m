Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B7FCCD192
	for <intel-xe@archiver.kernel.org>; Wed, 15 Oct 2025 13:07:37 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2932410E7DD;
	Wed, 15 Oct 2025 13:07:37 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 98DB810E184;
 Wed, 15 Oct 2025 13:07:35 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6972536976620872116=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_PF=3A_Update_auto-provision?=
 =?utf-8?q?ing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 15 Oct 2025 13:07:35 -0000
Message-ID: <176053365561.16661.6772211080997682127@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251015091211.592-1-michal.wajdeczko@intel.com>
In-Reply-To: <20251015091211.592-1-michal.wajdeczko@intel.com>
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

--===============6972536976620872116==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PF: Update auto-provisioning
URL   : https://patchwork.freedesktop.org/series/155971/
State : success

== Summary ==

CI Bug Log - changes from xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a_BAT -> xe-pw-155971v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 10)
------------------------------

  Missing    (1): bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a -> xe-pw-155971v1

  IGT_8585: 8585
  xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a: 6a9cafb6723c47062cc4d593804d5bb69155d81a
  xe-pw-155971v1: 155971v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/index.html

--===============6972536976620872116==
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
<tr><td><b>Series:</b></td><td>PF: Update auto-provisioning</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155971/">https://patchwork.freedesktop.org/series/155971/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155971v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a_BAT -&gt; xe-pw-155971v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 10)</h2>
<p>Missing    (1): bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a -&gt; xe-pw-155971v1</li>
</ul>
<p>IGT_8585: 8585<br />
  xe-3924-6a9cafb6723c47062cc4d593804d5bb69155d81a: 6a9cafb6723c47062cc4d593804d5bb69155d81a<br />
  xe-pw-155971v1: 155971v1</p>

</body>
</html>

--===============6972536976620872116==--
