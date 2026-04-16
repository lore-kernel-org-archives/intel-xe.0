Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75F15F8E489
	for <intel-xe@archiver.kernel.org>; Thu, 16 Apr 2026 22:44:14 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3B25810E243;
	Thu, 16 Apr 2026 22:44:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D9FB10E240;
 Thu, 16 Apr 2026 22:44:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5530948661160341867=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Drop_skip=5Fmtcfg?=
 =?utf-8?q?_descriptor_flag?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Matt Roper" <matthew.d.roper@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 16 Apr 2026 22:44:13 -0000
Message-ID: <177637945350.470125.13406267917464358466@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260416-no-skip-mtcfg-v1-1-c8ea26d81530@intel.com>
In-Reply-To: <20260416-no-skip-mtcfg-v1-1-c8ea26d81530@intel.com>
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

--===============5530948661160341867==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Drop skip_mtcfg descriptor flag
URL   : https://patchwork.freedesktop.org/series/165025/
State : success

== Summary ==

CI Bug Log - changes from xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454_BAT -> xe-pw-165025v1_BAT
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

  * IGT: IGT_8862 -> IGT_8863
  * Linux: xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454 -> xe-pw-165025v1

  IGT_8862: 9b95600c4ae2cb683a8a19ad2a7c006263811a8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8863: 5b279a8b71dc1672099205a1a9e8135c7c7fadb5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454: ff84b38d86b994ebb03d940be1c73a63e231f454
  xe-pw-165025v1: 165025v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/index.html

--===============5530948661160341867==
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
<tr><td><b>Series:</b></td><td>drm/xe: Drop skip_mtcfg descriptor flag</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/165025/">https://patchwork.freedesktop.org/series/165025/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-165025v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454_BAT -&gt; xe-pw-165025v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8862 -&gt; IGT_8863</li>
<li>Linux: xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454 -&gt; xe-pw-165025v1</li>
</ul>
<p>IGT_8862: 9b95600c4ae2cb683a8a19ad2a7c006263811a8f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8863: 5b279a8b71dc1672099205a1a9e8135c7c7fadb5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4917-ff84b38d86b994ebb03d940be1c73a63e231f454: ff84b38d86b994ebb03d940be1c73a63e231f454<br />
  xe-pw-165025v1: 165025v1</p>

</body>
</html>

--===============5530948661160341867==--
