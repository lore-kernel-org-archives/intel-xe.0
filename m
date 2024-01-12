Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3056AC4706C
	for <intel-xe@archiver.kernel.org>; Fri, 12 Jan 2024 16:43:57 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8AAB10E0CB;
	Fri, 12 Jan 2024 16:43:56 +0000 (UTC)
Received: from 5338d5abeb45 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11D2610E0CB;
 Fri, 12 Jan 2024 16:43:55 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8542357018131860125=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe=3A_Use_kstrdup_while_crea?=
 =?utf-8?q?ting_snapshot?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Date: Fri, 12 Jan 2024 16:43:55 -0000
Message-ID: <170507783506.338258.3165324737547320767@5338d5abeb45>
X-Patchwork-Hint: ignore
References: <20240112160652.893-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240112160652.893-1-michal.wajdeczko@intel.com>
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

--===============8542357018131860125==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Use kstrdup while creating snapshot
URL   : https://patchwork.freedesktop.org/series/128732/
State : success

== Summary ==

CI Bug Log - changes from xe-624-7a20187068bed91b523795a18219e570f1e84eb1_BAT -> xe-pw-128732v1_BAT
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

  * IGT: IGT_7671 -> IGT_7672
  * Linux: xe-624-7a20187068bed91b523795a18219e570f1e84eb1 -> xe-pw-128732v1

  IGT_7671: 7671
  IGT_7672: 16d7484a28cc1aaf2dfb9e9c73c011daf602d926 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-624-7a20187068bed91b523795a18219e570f1e84eb1: 7a20187068bed91b523795a18219e570f1e84eb1
  xe-pw-128732v1: 128732v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128732v1/index.html

--===============8542357018131860125==
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
<tr><td><b>Series:</b></td><td>drm/xe: Use kstrdup while creating snapshot</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/128732/">https://patchwork.freedesktop.org/series/128732/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128732v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-128732v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-624-7a20187068bed91b523795a18219e570f1e84eb1_BAT -&gt; xe-pw-128732v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7671 -&gt; IGT_7672</li>
<li>Linux: xe-624-7a20187068bed91b523795a18219e570f1e84eb1 -&gt; xe-pw-128732v1</li>
</ul>
<p>IGT_7671: 7671<br />
  IGT_7672: 16d7484a28cc1aaf2dfb9e9c73c011daf602d926 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-624-7a20187068bed91b523795a18219e570f1e84eb1: 7a20187068bed91b523795a18219e570f1e84eb1<br />
  xe-pw-128732v1: 128732v1</p>

</body>
</html>

--===============8542357018131860125==--
