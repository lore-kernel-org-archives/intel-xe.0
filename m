Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6571BC48BC3
	for <intel-xe@archiver.kernel.org>; Wed, 14 Feb 2024 12:47:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1885B10E0D3;
	Wed, 14 Feb 2024 12:47:08 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 02EDE10E0D3;
 Wed, 14 Feb 2024 12:47:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9108312607983926401=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Refactor_GT_debugfs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Feb 2024 12:47:06 -0000
Message-ID: <170791482601.1238604.16570959834470969229@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240214115756.1525-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240214115756.1525-1-michal.wajdeczko@intel.com>
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

--===============9108312607983926401==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Refactor GT debugfs
URL   : https://patchwork.freedesktop.org/series/129890/
State : success

== Summary ==

CI Bug Log - changes from xe-776-403e424a8684b55d90b90f293a992e54f37892b3_BAT -> xe-pw-129890v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-adlp-7 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-776-403e424a8684b55d90b90f293a992e54f37892b3 -> xe-pw-129890v1

  IGT_7711: 7711
  xe-776-403e424a8684b55d90b90f293a992e54f37892b3: 403e424a8684b55d90b90f293a992e54f37892b3
  xe-pw-129890v1: 129890v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129890v1/index.html

--===============9108312607983926401==
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
<tr><td><b>Series:</b></td><td>Refactor GT debugfs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/129890/">https://patchwork.freedesktop.org/series/129890/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129890v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-129890v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-776-403e424a8684b55d90b90f293a992e54f37892b3_BAT -&gt; xe-pw-129890v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-adlp-7 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-776-403e424a8684b55d90b90f293a992e54f37892b3 -&gt; xe-pw-129890v1</li>
</ul>
<p>IGT_7711: 7711<br />
  xe-776-403e424a8684b55d90b90f293a992e54f37892b3: 403e424a8684b55d90b90f293a992e54f37892b3<br />
  xe-pw-129890v1: 129890v1</p>

</body>
</html>

--===============9108312607983926401==--
