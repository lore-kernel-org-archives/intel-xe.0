Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C843C54E58
	for <intel-xe@archiver.kernel.org>; Tue, 19 Mar 2024 03:12:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B3AFA10E855;
	Tue, 19 Mar 2024 03:12:56 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 420FF10E855;
 Tue, 19 Mar 2024 03:12:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4815821829886188645=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/display=3A_Mark_dpt_and_r?=
 =?utf-8?q?elated_vma_as_uncached?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Juha-Pekka Heikkila" <juhapekka.heikkila@gmail.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 19 Mar 2024 03:12:56 -0000
Message-ID: <171081797626.900422.5138475293840785362@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240318201850.127785-1-juhapekka.heikkila@gmail.com>
In-Reply-To: <20240318201850.127785-1-juhapekka.heikkila@gmail.com>
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

--===============4815821829886188645==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: Mark dpt and related vma as uncached
URL   : https://patchwork.freedesktop.org/series/131286/
State : success

== Summary ==

CI Bug Log - changes from xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9_BAT -> xe-pw-131286v1_BAT
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

  * Linux: xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9 -> xe-pw-131286v1

  IGT_7769: 7769
  xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9: e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9
  xe-pw-131286v1: 131286v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131286v1/index.html

--===============4815821829886188645==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: Mark dpt and related vma as uncached</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131286/">https://patchwork.freedesktop.org/series/131286/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131286v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131286v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9_BAT -&gt; xe-pw-131286v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9 -&gt; xe-pw-131286v1</li>
</ul>
<p>IGT_7769: 7769<br />
  xe-953-e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9: e8f2ef9ff5486b3bbfc599bf89e10e3bdecd96b9<br />
  xe-pw-131286v1: 131286v1</p>

</body>
</html>

--===============4815821829886188645==--
