Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CBF5C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 08:56:26 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A55610E697;
	Mon, 25 Mar 2024 08:56:26 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BEEAE10E697;
 Mon, 25 Mar 2024 08:56:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4716929903452656225=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Fix_static_analysis_to?=
 =?utf-8?q?ol_reported_errors_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Mar 2024 08:56:24 -0000
Message-ID: <171135698478.1035680.10161165477226552100@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240325080550.3217836-1-karthik.poosa@intel.com>
In-Reply-To: <20240325080550.3217836-1-karthik.poosa@intel.com>
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

--===============4716929903452656225==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix static analysis tool reported errors (rev5)
URL   : https://patchwork.freedesktop.org/series/131529/
State : success

== Summary ==

CI Bug Log - changes from xe-984-093d82c02921344d8d400989af156aaf79b9d961_BAT -> xe-pw-131529v5_BAT
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

  * IGT: IGT_7779 -> IGT_7780
  * Linux: xe-984-093d82c02921344d8d400989af156aaf79b9d961 -> xe-pw-131529v5

  IGT_7779: 7779
  IGT_7780: 93a5298ac980333738cf75da6b66fa6f3769205f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-984-093d82c02921344d8d400989af156aaf79b9d961: 093d82c02921344d8d400989af156aaf79b9d961
  xe-pw-131529v5: 131529v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131529v5/index.html

--===============4716929903452656225==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix static analysis tool reported errors (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131529/">https://patchwork.freedesktop.org/series/131529/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131529v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131529v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-984-093d82c02921344d8d400989af156aaf79b9d961_BAT -&gt; xe-pw-131529v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7779 -&gt; IGT_7780</li>
<li>Linux: xe-984-093d82c02921344d8d400989af156aaf79b9d961 -&gt; xe-pw-131529v5</li>
</ul>
<p>IGT_7779: 7779<br />
  IGT_7780: 93a5298ac980333738cf75da6b66fa6f3769205f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-984-093d82c02921344d8d400989af156aaf79b9d961: 093d82c02921344d8d400989af156aaf79b9d961<br />
  xe-pw-131529v5: 131529v5</p>

</body>
</html>

--===============4716929903452656225==--
