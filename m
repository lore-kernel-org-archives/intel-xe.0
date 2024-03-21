Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE42FC54E58
	for <intel-xe@archiver.kernel.org>; Thu, 21 Mar 2024 07:35:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7ACE510EE21;
	Thu, 21 Mar 2024 07:35:15 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2C8D510F105;
 Thu, 21 Mar 2024 07:35:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2615019230709102463=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/display=3A_check_for_erro?=
 =?utf-8?q?r_on_drmm=5Fmutex=5Finit_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arun R Murthy" <arun.r.murthy@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 21 Mar 2024 07:35:14 -0000
Message-ID: <171100651418.938898.10455193175094198302@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240321060124.4074773-1-arun.r.murthy@intel.com>
In-Reply-To: <20240321060124.4074773-1-arun.r.murthy@intel.com>
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

--===============2615019230709102463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/display: check for error on drmm_mutex_init (rev2)
URL   : https://patchwork.freedesktop.org/series/131300/
State : success

== Summary ==

CI Bug Log - changes from xe-968-b8290992108644cb99d7d9db2921bb25369ead3c_BAT -> xe-pw-131300v2_BAT
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

  * IGT: IGT_7772 -> IGT_7773
  * Linux: xe-968-b8290992108644cb99d7d9db2921bb25369ead3c -> xe-pw-131300v2

  IGT_7772: 7772
  IGT_7773: 7773
  xe-968-b8290992108644cb99d7d9db2921bb25369ead3c: b8290992108644cb99d7d9db2921bb25369ead3c
  xe-pw-131300v2: 131300v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v2/index.html

--===============2615019230709102463==
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
<tr><td><b>Series:</b></td><td>drm/xe/display: check for error on drmm_mutex_init (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131300/">https://patchwork.freedesktop.org/series/131300/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131300v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-968-b8290992108644cb99d7d9db2921bb25369ead3c_BAT -&gt; xe-pw-131300v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7772 -&gt; IGT_7773</li>
<li>Linux: xe-968-b8290992108644cb99d7d9db2921bb25369ead3c -&gt; xe-pw-131300v2</li>
</ul>
<p>IGT_7772: 7772<br />
  IGT_7773: 7773<br />
  xe-968-b8290992108644cb99d7d9db2921bb25369ead3c: b8290992108644cb99d7d9db2921bb25369ead3c<br />
  xe-pw-131300v2: 131300v2</p>

</body>
</html>

--===============2615019230709102463==--
