Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53069C5DF74
	for <intel-xe@archiver.kernel.org>; Tue, 18 Aug 2026 05:06:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0F93210E49F;
	Tue, 18 Aug 2026 05:06:00 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC61B10E49F;
 Tue, 18 Aug 2026 05:05:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4464981630991157553=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Skip_CLEANUP_?=
 =?utf-8?q?message_when_GuC_is_stopped?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Varun Gupta" <varun.gupta@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 18 Aug 2026 05:05:58 -0000
Message-ID: <178702955889.61185.57196850204766624@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260818040733.135964-1-varun.gupta@intel.com>
In-Reply-To: <20260818040733.135964-1-varun.gupta@intel.com>
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

--===============4464981630991157553==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Skip CLEANUP message when GuC is stopped
URL   : https://patchwork.freedesktop.org/series/172367/
State : success

== Summary ==

CI Bug Log - changes from xe-5609-775a898c77eec44922595e8f318cd359c98944fd_BAT -> xe-pw-172367v1_BAT
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

  * Linux: xe-5609-775a898c77eec44922595e8f318cd359c98944fd -> xe-pw-172367v1

  IGT_9059: f5a4ff79434df36db1d6b13deb37c90a6602565e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5609-775a898c77eec44922595e8f318cd359c98944fd: 775a898c77eec44922595e8f318cd359c98944fd
  xe-pw-172367v1: 172367v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172367v1/index.html

--===============4464981630991157553==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Skip CLEANUP message when GuC is stopped</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/172367/">https://patchwork.freedesktop.org/series/172367/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172367v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-172367v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5609-775a898c77eec44922595e8f318cd359c98944fd_BAT -&gt; xe-pw-172367v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5609-775a898c77eec44922595e8f318cd359c98944fd -&gt; xe-pw-172367v1</li>
</ul>
<p>IGT_9059: f5a4ff79434df36db1d6b13deb37c90a6602565e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5609-775a898c77eec44922595e8f318cd359c98944fd: 775a898c77eec44922595e8f318cd359c98944fd<br />
  xe-pw-172367v1: 172367v1</p>

</body>
</html>

--===============4464981630991157553==--
