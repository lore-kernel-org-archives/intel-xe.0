Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9516EA4E2F
	for <intel-xe@archiver.kernel.org>; Mon,  2 Mar 2026 16:05:23 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 628BF10E528;
	Mon,  2 Mar 2026 16:05:23 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9E39910E528;
 Mon,  2 Mar 2026 16:05:22 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1309256307351586284=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/lrc=3A_Refactor_cont?=
 =?utf-8?q?ext_init_into_xe=5Flrc=5Fctx=5Finit=28=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Raag Jadav" <raag.jadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 02 Mar 2026 16:05:22 -0000
Message-ID: <177246752262.303983.8902330959939356916@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260302082757.3516577-1-raag.jadav@intel.com>
In-Reply-To: <20260302082757.3516577-1-raag.jadav@intel.com>
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

--===============1309256307351586284==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/lrc: Refactor context init into xe_lrc_ctx_init()
URL   : https://patchwork.freedesktop.org/series/162400/
State : success

== Summary ==

CI Bug Log - changes from xe-4638-200559e195414731c83ff6da6b34209dbef51227_BAT -> xe-pw-162400v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 13)
------------------------------

  Missing    (1): bat-atsm-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4638-200559e195414731c83ff6da6b34209dbef51227 -> xe-pw-162400v1

  IGT_8776: 8776
  xe-4638-200559e195414731c83ff6da6b34209dbef51227: 200559e195414731c83ff6da6b34209dbef51227
  xe-pw-162400v1: 162400v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162400v1/index.html

--===============1309256307351586284==
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
<tr><td><b>Series:</b></td><td>drm/xe/lrc: Refactor context init into xe_lrc_ctx_init()</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/162400/">https://patchwork.freedesktop.org/series/162400/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162400v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-162400v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4638-200559e195414731c83ff6da6b34209dbef51227_BAT -&gt; xe-pw-162400v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 13)</h2>
<p>Missing    (1): bat-atsm-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4638-200559e195414731c83ff6da6b34209dbef51227 -&gt; xe-pw-162400v1</li>
</ul>
<p>IGT_8776: 8776<br />
  xe-4638-200559e195414731c83ff6da6b34209dbef51227: 200559e195414731c83ff6da6b34209dbef51227<br />
  xe-pw-162400v1: 162400v1</p>

</body>
</html>

--===============1309256307351586284==--
