Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A7E64C47422
	for <intel-xe@archiver.kernel.org>; Thu, 18 Jan 2024 22:26:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A61D10E907;
	Thu, 18 Jan 2024 22:26:58 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 772CF10E8FD;
 Thu, 18 Jan 2024 22:26:57 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7777652175796869556=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Do_not_flood_dmesg_wit?=
 =?utf-8?q?h_guc_log_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Date: Thu, 18 Jan 2024 22:26:57 -0000
Message-ID: <170561681748.558566.8891214948313380978@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240117204059.345143-1-rodrigo.vivi@intel.com>
In-Reply-To: <20240117204059.345143-1-rodrigo.vivi@intel.com>
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
Cc: intel-xe@lists.freedesktop.org
Errors-To: intel-xe-bounces@lists.freedesktop.org
Sender: "Intel-xe" <intel-xe-bounces@lists.freedesktop.org>

--===============7777652175796869556==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Do not flood dmesg with guc log (rev3)
URL   : https://patchwork.freedesktop.org/series/128903/
State : success

== Summary ==

CI Bug Log - changes from xe-646-776dc1588b4b329dba41ded2db883fbc1bf77950_BAT -> xe-pw-128903v3_BAT
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

  * Linux: xe-646-776dc1588b4b329dba41ded2db883fbc1bf77950 -> xe-pw-128903v3

  IGT_7683: 7683
  xe-646-776dc1588b4b329dba41ded2db883fbc1bf77950: 776dc1588b4b329dba41ded2db883fbc1bf77950
  xe-pw-128903v3: 128903v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128903v3/index.html

--===============7777652175796869556==
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
<tr><td><b>Series:</b></td><td>drm/xe: Do not flood dmesg with guc log (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128903/">https://patchwork.freedesktop.org/series/128903/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128903v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128903v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-646-776dc1588b4b329dba41ded2db883fbc1bf77950_BAT -&gt; xe-pw-128903v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-646-776dc1588b4b329dba41ded2db883fbc1bf77950 -&gt; xe-pw-128903v3</li>
</ul>
<p>IGT_7683: 7683<br />
  xe-646-776dc1588b4b329dba41ded2db883fbc1bf77950: 776dc1588b4b329dba41ded2db883fbc1bf77950<br />
  xe-pw-128903v3: 128903v3</p>

</body>
</html>

--===============7777652175796869556==--
