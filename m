Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AD660CD5BD1
	for <intel-xe@archiver.kernel.org>; Tue,  2 Jun 2026 23:07:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5B1DA113B73;
	Tue,  2 Jun 2026 23:07:01 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12F96113B6D;
 Tue,  2 Jun 2026 23:07:00 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5064095671361871794=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/atomic=3A_track_individ?=
 =?utf-8?q?ual_colorop_updates?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Melissa Wen" <mwen@igalia.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 02 Jun 2026 23:07:00 -0000
Message-ID: <178044162007.36136.13639601865599155028@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260602215743.914265-1-mwen@igalia.com>
In-Reply-To: <20260602215743.914265-1-mwen@igalia.com>
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

--===============5064095671361871794==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/atomic: track individual colorop updates
URL   : https://patchwork.freedesktop.org/series/167777/
State : success

== Summary ==

CI Bug Log - changes from xe-5183-694cb596b23bda042a8c1a9b0d16aa99e850b8d8_BAT -> xe-pw-167777v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5183-694cb596b23bda042a8c1a9b0d16aa99e850b8d8 -> xe-pw-167777v1

  IGT_8946: 8946
  xe-5183-694cb596b23bda042a8c1a9b0d16aa99e850b8d8: 694cb596b23bda042a8c1a9b0d16aa99e850b8d8
  xe-pw-167777v1: 167777v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167777v1/index.html

--===============5064095671361871794==
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
<tr><td><b>Series:</b></td><td>drm/atomic: track individual colorop updates</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167777/">https://patchwork.freedesktop.org/series/167777/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167777v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167777v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5183-694cb596b23bda042a8c1a9b0d16aa99e850b8d8_BAT -&gt; xe-pw-167777v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5183-694cb596b23bda042a8c1a9b0d16aa99e850b8d8 -&gt; xe-pw-167777v1</li>
</ul>
<p>IGT_8946: 8946<br />
  xe-5183-694cb596b23bda042a8c1a9b0d16aa99e850b8d8: 694cb596b23bda042a8c1a9b0d16aa99e850b8d8<br />
  xe-pw-167777v1: 167777v1</p>

</body>
</html>

--===============5064095671361871794==--
