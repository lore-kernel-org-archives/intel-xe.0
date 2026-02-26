Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3FEAFD4606
	for <intel-xe@archiver.kernel.org>; Thu, 26 Feb 2026 02:02:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 903E510E049;
	Thu, 26 Feb 2026 02:02:23 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1D8CD10E049;
 Thu, 26 Feb 2026 02:02:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1359186528332527318=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/vf=3A_Fix_exec_queue?=
 =?utf-8?q?_creation_during_post-migration_recovery_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tomasz Lis" <tomasz.lis@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 26 Feb 2026 02:02:22 -0000
Message-ID: <177207134208.288682.17478788193517376134@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260225235447.2772383-1-tomasz.lis@intel.com>
In-Reply-To: <20260225235447.2772383-1-tomasz.lis@intel.com>
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

--===============1359186528332527318==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/vf: Fix exec queue creation during post-migration recovery (rev3)
URL   : https://patchwork.freedesktop.org/series/161287/
State : success

== Summary ==

CI Bug Log - changes from xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440_BAT -> xe-pw-161287v3_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440 -> xe-pw-161287v3

  IGT_8772: 8772
  xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440: f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440
  xe-pw-161287v3: 161287v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v3/index.html

--===============1359186528332527318==
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
<tr><td><b>Series:</b></td><td>drm/xe/vf: Fix exec queue creation during post-migration recovery (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161287/">https://patchwork.freedesktop.org/series/161287/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161287v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440_BAT -&gt; xe-pw-161287v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440 -&gt; xe-pw-161287v3</li>
</ul>
<p>IGT_8772: 8772<br />
  xe-4620-f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440: f0ec6252eb6d9a4f0cb5a437f5c21fec16d0a440<br />
  xe-pw-161287v3: 161287v3</p>

</body>
</html>

--===============1359186528332527318==--
