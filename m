Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6E515CAC5B8
	for <intel-xe@archiver.kernel.org>; Thu,  2 Oct 2025 16:18:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2AF2810E1C5;
	Thu,  2 Oct 2025 16:18:57 +0000 (UTC)
Received: from 6aec98b87f92 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8EE8110E1C5;
 Thu,  2 Oct 2025 16:18:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5241303342008215343=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/guc=3A_Cleanup_GuC_l?=
 =?utf-8?q?og_buffer_macros_and_helpers?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 02 Oct 2025 16:18:55 -0000
Message-ID: <175942193557.56.6889832504681956169@6aec98b87f92>
X-Patchwork-Hint: ignore
References: <20251002150302.99524-1-zhanjun.dong@intel.com>
In-Reply-To: <20251002150302.99524-1-zhanjun.dong@intel.com>
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

--===============5241303342008215343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/guc: Cleanup GuC log buffer macros and helpers
URL   : https://patchwork.freedesktop.org/series/155338/
State : success

== Summary ==

CI Bug Log - changes from xe-3855-84ca7020309a0416ee72fd8e12f40d7654496b2f_BAT -> xe-pw-155338v1_BAT
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

  * Linux: xe-3855-84ca7020309a0416ee72fd8e12f40d7654496b2f -> xe-pw-155338v1

  IGT_8570: 8570
  xe-3855-84ca7020309a0416ee72fd8e12f40d7654496b2f: 84ca7020309a0416ee72fd8e12f40d7654496b2f
  xe-pw-155338v1: 155338v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v1/index.html

--===============5241303342008215343==
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
<tr><td><b>Series:</b></td><td>drm/xe/guc: Cleanup GuC log buffer macros and helpers</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155338/">https://patchwork.freedesktop.org/series/155338/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155338v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3855-84ca7020309a0416ee72fd8e12f40d7654496b2f_BAT -&gt; xe-pw-155338v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3855-84ca7020309a0416ee72fd8e12f40d7654496b2f -&gt; xe-pw-155338v1</li>
</ul>
<p>IGT_8570: 8570<br />
  xe-3855-84ca7020309a0416ee72fd8e12f40d7654496b2f: 84ca7020309a0416ee72fd8e12f40d7654496b2f<br />
  xe-pw-155338v1: 155338v1</p>

</body>
</html>

--===============5241303342008215343==--
