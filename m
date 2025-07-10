Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D9691C83F1D
	for <intel-xe@archiver.kernel.org>; Thu, 10 Jul 2025 10:21:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9FCA010E20C;
	Thu, 10 Jul 2025 10:21:00 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 232D310E20C;
 Thu, 10 Jul 2025 10:21:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2445478648889585869=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_SR-IOV_support_for_BMG?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jakub Kolakowski" <jakub1.kolakowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 10 Jul 2025 10:21:00 -0000
Message-ID: <175214286013.150271.13739462073167171916@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250710092630.370341-1-jakub1.kolakowski@intel.com>
In-Reply-To: <20250710092630.370341-1-jakub1.kolakowski@intel.com>
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

--===============2445478648889585869==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add SR-IOV support for BMG
URL   : https://patchwork.freedesktop.org/series/151433/
State : success

== Summary ==

CI Bug Log - changes from xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0_BAT -> xe-pw-151433v1_BAT
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

  * IGT: IGT_8447 -> IGT_8449
  * Linux: xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0 -> xe-pw-151433v1

  IGT_8447: 8447
  IGT_8449: bfa2e7bb44a2e0fe43d2ae474db0dff766080b24 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0: 7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0
  xe-pw-151433v1: 151433v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v1/index.html

--===============2445478648889585869==
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
<tr><td><b>Series:</b></td><td>Add SR-IOV support for BMG</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151433/">https://patchwork.freedesktop.org/series/151433/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151433v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0_BAT -&gt; xe-pw-151433v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8447 -&gt; IGT_8449</li>
<li>Linux: xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0 -&gt; xe-pw-151433v1</li>
</ul>
<p>IGT_8447: 8447<br />
  IGT_8449: bfa2e7bb44a2e0fe43d2ae474db0dff766080b24 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3385-7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0: 7c6cc6e59baa15cc1b10fe5bba36219ae6d227b0<br />
  xe-pw-151433v1: 151433v1</p>

</body>
</html>

--===============2445478648889585869==--
