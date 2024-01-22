Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 24D1BC4725D
	for <intel-xe@archiver.kernel.org>; Mon, 22 Jan 2024 09:33:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B2FFF10EBE1;
	Mon, 22 Jan 2024 09:33:25 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A5DE310EBDE;
 Mon, 22 Jan 2024 09:33:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3374727300744882647=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/irq=3A_allocate_all_possi?=
 =?utf-8?q?ble_msix_interrupts_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dani Liberman" <dliberman@habana.ai>
Date: Mon, 22 Jan 2024 09:33:24 -0000
Message-ID: <170591600467.646097.17749046740770547114@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240121090214.2072923-1-dliberman@habana.ai>
In-Reply-To: <20240121090214.2072923-1-dliberman@habana.ai>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============3374727300744882647==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/irq: allocate all possible msix interrupts (rev3)
URL   : https://patchwork.freedesktop.org/series/128832/
State : success

== Summary ==

CI Bug Log - changes from xe-657-36703044a630ac1119ddf628677d7ced5ff6afc2_BAT -> xe-pw-128832v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 4)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-657-36703044a630ac1119ddf628677d7ced5ff6afc2 -> xe-pw-128832v3

  IGT_7683: 7683
  xe-657-36703044a630ac1119ddf628677d7ced5ff6afc2: 36703044a630ac1119ddf628677d7ced5ff6afc2
  xe-pw-128832v3: 128832v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128832v3/index.html

--===============3374727300744882647==
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
<tr><td><b>Series:</b></td><td>drm/xe/irq: allocate all possible msix interrupts (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128832/">https://patchwork.freedesktop.org/series/128832/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128832v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128832v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-657-36703044a630ac1119ddf628677d7ced5ff6afc2_BAT -&gt; xe-pw-128832v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-657-36703044a630ac1119ddf628677d7ced5ff6afc2 -&gt; xe-pw-128832v3</li>
</ul>
<p>IGT_7683: 7683<br />
  xe-657-36703044a630ac1119ddf628677d7ced5ff6afc2: 36703044a630ac1119ddf628677d7ced5ff6afc2<br />
  xe-pw-128832v3: 128832v3</p>

</body>
</html>

--===============3374727300744882647==--
