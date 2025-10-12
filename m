Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CC3FCCD187
	for <intel-xe@archiver.kernel.org>; Sun, 12 Oct 2025 13:35:08 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B571210E15F;
	Sun, 12 Oct 2025 13:35:07 +0000 (UTC)
Received: from 97596180aaec (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9AD1A10E15C;
 Sun, 12 Oct 2025 13:35:06 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1331636461803024335=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Avoid_crash_during_dump_whe?=
 =?utf-8?q?n_finding_an_evicted_BO?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Simon Richter" <simon.richter@hogyros.de>
Cc: intel-xe@lists.freedesktop.org
Date: Sun, 12 Oct 2025 13:35:06 -0000
Message-ID: <176027610653.3035.9997128709535718027@97596180aaec>
X-Patchwork-Hint: ignore
References: <20251012124544.1325125-1-Simon.Richter@hogyros.de>
In-Reply-To: <20251012124544.1325125-1-Simon.Richter@hogyros.de>
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

--===============1331636461803024335==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Avoid crash during dump when finding an evicted BO
URL   : https://patchwork.freedesktop.org/series/155787/
State : success

== Summary ==

CI Bug Log - changes from xe-3902-8fcdbd2480bd7d0f6ce819561685462e94c4ed48_BAT -> xe-pw-155787v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 11)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3902-8fcdbd2480bd7d0f6ce819561685462e94c4ed48 -> xe-pw-155787v1

  IGT_8582: 8582
  xe-3902-8fcdbd2480bd7d0f6ce819561685462e94c4ed48: 8fcdbd2480bd7d0f6ce819561685462e94c4ed48
  xe-pw-155787v1: 155787v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v1/index.html

--===============1331636461803024335==
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
<tr><td><b>Series:</b></td><td>Avoid crash during dump when finding an evicted BO</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155787/">https://patchwork.freedesktop.org/series/155787/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155787v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3902-8fcdbd2480bd7d0f6ce819561685462e94c4ed48_BAT -&gt; xe-pw-155787v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3902-8fcdbd2480bd7d0f6ce819561685462e94c4ed48 -&gt; xe-pw-155787v1</li>
</ul>
<p>IGT_8582: 8582<br />
  xe-3902-8fcdbd2480bd7d0f6ce819561685462e94c4ed48: 8fcdbd2480bd7d0f6ce819561685462e94c4ed48<br />
  xe-pw-155787v1: 155787v1</p>

</body>
</html>

--===============1331636461803024335==--
