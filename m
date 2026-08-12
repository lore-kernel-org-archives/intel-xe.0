Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4771EC5B56A
	for <intel-xe@archiver.kernel.org>; Wed, 12 Aug 2026 13:31:18 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0A4D710EFDF;
	Wed, 12 Aug 2026 13:31:18 +0000 (UTC)
Received: from 61270ab9df2a (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 717B410EFDF;
 Wed, 12 Aug 2026 13:31:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2783089738938366462=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Adopt_xe=5Flog_SI?=
 =?utf-8?q?GID_API_for_structured_error_reporting_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mallesh, Koujalagi" <mallesh.koujalagi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 12 Aug 2026 13:31:16 -0000
Message-ID: <178654147645.43822.15499421423863667445@61270ab9df2a>
X-Patchwork-Hint: ignore
References: <20260812123449.239480-5-mallesh.koujalagi@intel.com>
In-Reply-To: <20260812123449.239480-5-mallesh.koujalagi@intel.com>
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

--===============2783089738938366462==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Adopt xe_log SIGID API for structured error reporting (rev2)
URL   : https://patchwork.freedesktop.org/series/171725/
State : success

== Summary ==

CI Bug Log - changes from xe-5580-96ddbb14986632af742523e68f90d51c138c57f0_BAT -> xe-pw-171725v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5580-96ddbb14986632af742523e68f90d51c138c57f0 -> xe-pw-171725v2

  IGT_9052: 9052
  xe-5580-96ddbb14986632af742523e68f90d51c138c57f0: 96ddbb14986632af742523e68f90d51c138c57f0
  xe-pw-171725v2: 171725v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171725v2/index.html

--===============2783089738938366462==
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
<tr><td><b>Series:</b></td><td>drm/xe: Adopt xe_log SIGID API for structured error reporting (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/171725/">https://patchwork.freedesktop.org/series/171725/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171725v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-171725v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5580-96ddbb14986632af742523e68f90d51c138c57f0_BAT -&gt; xe-pw-171725v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5580-96ddbb14986632af742523e68f90d51c138c57f0 -&gt; xe-pw-171725v2</li>
</ul>
<p>IGT_9052: 9052<br />
  xe-5580-96ddbb14986632af742523e68f90d51c138c57f0: 96ddbb14986632af742523e68f90d51c138c57f0<br />
  xe-pw-171725v2: 171725v2</p>

</body>
</html>

--===============2783089738938366462==--
