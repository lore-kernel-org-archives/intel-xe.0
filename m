Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00970C83F17
	for <intel-xe@archiver.kernel.org>; Mon, 14 Jul 2025 16:35:04 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 995F410E2A3;
	Mon, 14 Jul 2025 16:35:04 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6FBEF10E02F;
 Mon, 14 Jul 2025 16:35:03 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7923672303471461982=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915=3A_PREEMPT=5FRT_re?=
 =?utf-8?q?lated_fixups=2E_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Sebastian Andrzej Siewior" <bigeasy@linutronix.de>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 14 Jul 2025 16:35:03 -0000
Message-ID: <175251090345.159840.8031610412423956989@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250714153954.629393-1-bigeasy@linutronix.de>
In-Reply-To: <20250714153954.629393-1-bigeasy@linutronix.de>
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

--===============7923672303471461982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: PREEMPT_RT related fixups. (rev6)
URL   : https://patchwork.freedesktop.org/series/132082/
State : success

== Summary ==

CI Bug Log - changes from xe-3407-addfee6c7e234dca2b07de3a628af4e0d1779343_BAT -> xe-pw-132082v6_BAT
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

  * Linux: xe-3407-addfee6c7e234dca2b07de3a628af4e0d1779343 -> xe-pw-132082v6

  IGT_8457: 756ebdbf0e4c75f0680c0a36db206a9f6ff126ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3407-addfee6c7e234dca2b07de3a628af4e0d1779343: addfee6c7e234dca2b07de3a628af4e0d1779343
  xe-pw-132082v6: 132082v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132082v6/index.html

--===============7923672303471461982==
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
<tr><td><b>Series:</b></td><td>drm/i915: PREEMPT_RT related fixups. (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/132082/">https://patchwork.freedesktop.org/series/132082/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132082v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-132082v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3407-addfee6c7e234dca2b07de3a628af4e0d1779343_BAT -&gt; xe-pw-132082v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3407-addfee6c7e234dca2b07de3a628af4e0d1779343 -&gt; xe-pw-132082v6</li>
</ul>
<p>IGT_8457: 756ebdbf0e4c75f0680c0a36db206a9f6ff126ce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3407-addfee6c7e234dca2b07de3a628af4e0d1779343: addfee6c7e234dca2b07de3a628af4e0d1779343<br />
  xe-pw-132082v6: 132082v6</p>

</body>
</html>

--===============7923672303471461982==--
