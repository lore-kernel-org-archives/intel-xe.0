Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 010DFC282C6
	for <intel-xe@archiver.kernel.org>; Mon,  3 Mar 2025 19:22:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C277F10E3CE;
	Mon,  3 Mar 2025 19:22:45 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCA510E3CE;
 Mon,  3 Mar 2025 19:22:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6693203496344356896=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_UAPI_support_for_low_la?=
 =?utf-8?q?tency_hint_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Upadhyay, Tejas" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 03 Mar 2025 19:22:44 -0000
Message-ID: <174102976425.231783.13681278812697412103@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228070224.739295-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250228070224.739295-1-tejas.upadhyay@intel.com>
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

--===============6693203496344356896==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add UAPI support for low latency hint (rev4)
URL   : https://patchwork.freedesktop.org/series/143257/
State : success

== Summary ==

CI Bug Log - changes from xe-2747-413ae464b8021542ad90cb1fbb15f8efc5050a5d_BAT -> xe-pw-143257v4_BAT
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

  * IGT: IGT_8255 -> IGT_8257
  * Linux: xe-2747-413ae464b8021542ad90cb1fbb15f8efc5050a5d -> xe-pw-143257v4

  IGT_8255: 4ef742fae97d2f4af680f9e29f7ea45920f939b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8257: 8257
  xe-2747-413ae464b8021542ad90cb1fbb15f8efc5050a5d: 413ae464b8021542ad90cb1fbb15f8efc5050a5d
  xe-pw-143257v4: 143257v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v4/index.html

--===============6693203496344356896==
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
<tr><td><b>Series:</b></td><td>Add UAPI support for low latency hint (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143257/">https://patchwork.freedesktop.org/series/143257/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143257v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2747-413ae464b8021542ad90cb1fbb15f8efc5050a5d_BAT -&gt; xe-pw-143257v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8255 -&gt; IGT_8257</li>
<li>Linux: xe-2747-413ae464b8021542ad90cb1fbb15f8efc5050a5d -&gt; xe-pw-143257v4</li>
</ul>
<p>IGT_8255: 4ef742fae97d2f4af680f9e29f7ea45920f939b7 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8257: 8257<br />
  xe-2747-413ae464b8021542ad90cb1fbb15f8efc5050a5d: 413ae464b8021542ad90cb1fbb15f8efc5050a5d<br />
  xe-pw-143257v4: 143257v4</p>

</body>
</html>

--===============6693203496344356896==--
