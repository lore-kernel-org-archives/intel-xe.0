Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9AF01C2BBCA
	for <intel-xe@archiver.kernel.org>; Tue, 25 Jun 2024 20:32:41 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5637F10E2F3;
	Tue, 25 Jun 2024 20:32:41 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0EDA310E2F3;
 Tue, 25 Jun 2024 20:32:40 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6146087013792403438=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_PF=3A_Trigger_explicit_FLR_while?=
 =?utf-8?q?_disabling_VFs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 25 Jun 2024 20:32:40 -0000
Message-ID: <171934756005.157680.4993277048998756672@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240625194546.1301-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240625194546.1301-1-michal.wajdeczko@intel.com>
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

--===============6146087013792403438==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: PF: Trigger explicit FLR while disabling VFs
URL   : https://patchwork.freedesktop.org/series/135380/
State : success

== Summary ==

CI Bug Log - changes from xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328_BAT -> xe-pw-135380v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328 -> xe-pw-135380v1

  IGT_7900: cec03bdc0e810e09dc7d632ef340f704069d316c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328: c7f3ccc0f957750deeba044da72581ec1bf5e328
  xe-pw-135380v1: 135380v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/index.html

--===============6146087013792403438==
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
<tr><td><b>Series:</b></td><td>PF: Trigger explicit FLR while disabling VFs</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135380/">https://patchwork.freedesktop.org/series/135380/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135380v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328_BAT -&gt; xe-pw-135380v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328 -&gt; xe-pw-135380v1</li>
</ul>
<p>IGT_7900: cec03bdc0e810e09dc7d632ef340f704069d316c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1526-c7f3ccc0f957750deeba044da72581ec1bf5e328: c7f3ccc0f957750deeba044da72581ec1bf5e328<br />
  xe-pw-135380v1: 135380v1</p>

</body>
</html>

--===============6146087013792403438==--
