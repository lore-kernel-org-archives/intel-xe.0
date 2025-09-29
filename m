Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B756CAC5B5
	for <intel-xe@archiver.kernel.org>; Mon, 29 Sep 2025 12:45:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D3CE310E405;
	Mon, 29 Sep 2025 12:45:04 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 427E210E404;
 Mon, 29 Sep 2025 12:45:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5520579765337426107=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/bo=3A_Fix_an_idle_as?=
 =?utf-8?q?sertion_for_local_bos?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 29 Sep 2025 12:45:04 -0000
Message-ID: <175914990426.375141.14333197222837438152@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250929112649.6131-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250929112649.6131-1-thomas.hellstrom@linux.intel.com>
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

--===============5520579765337426107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/bo: Fix an idle assertion for local bos
URL   : https://patchwork.freedesktop.org/series/155164/
State : success

== Summary ==

CI Bug Log - changes from xe-3837-63576a67d36e0d55003b5eb4d13055eee675bd0e_BAT -> xe-pw-155164v1_BAT
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

  * Linux: xe-3837-63576a67d36e0d55003b5eb4d13055eee675bd0e -> xe-pw-155164v1

  IGT_8556: e5eda2a187432a54f5e6fada18e4187e5175a10c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3837-63576a67d36e0d55003b5eb4d13055eee675bd0e: 63576a67d36e0d55003b5eb4d13055eee675bd0e
  xe-pw-155164v1: 155164v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155164v1/index.html

--===============5520579765337426107==
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
<tr><td><b>Series:</b></td><td>drm/xe/bo: Fix an idle assertion for local bos</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/155164/">https://patchwork.freedesktop.org/series/155164/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155164v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-155164v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3837-63576a67d36e0d55003b5eb4d13055eee675bd0e_BAT -&gt; xe-pw-155164v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 11)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3837-63576a67d36e0d55003b5eb4d13055eee675bd0e -&gt; xe-pw-155164v1</li>
</ul>
<p>IGT_8556: e5eda2a187432a54f5e6fada18e4187e5175a10c @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3837-63576a67d36e0d55003b5eb4d13055eee675bd0e: 63576a67d36e0d55003b5eb4d13055eee675bd0e<br />
  xe-pw-155164v1: 155164v1</p>

</body>
</html>

--===============5520579765337426107==--
