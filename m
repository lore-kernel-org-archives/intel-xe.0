Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4EEFEA794C
	for <intel-xe@archiver.kernel.org>; Thu,  5 Feb 2026 01:23:05 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C04010E0FF;
	Thu,  5 Feb 2026 01:23:05 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8FAD910E0FF;
 Thu,  5 Feb 2026 01:23:04 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4554887151162062238=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/uapi=3A_Introduce_a_?=
 =?utf-8?q?flag_to_disallow_vm_overcommit_in_fault_mode?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 05 Feb 2026 01:23:04 -0000
Message-ID: <177025458457.225549.6077133798422052361@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260204153320.17989-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20260204153320.17989-1-thomas.hellstrom@linux.intel.com>
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

--===============4554887151162062238==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Introduce a flag to disallow vm overcommit in fault mode
URL   : https://patchwork.freedesktop.org/series/161148/
State : success

== Summary ==

CI Bug Log - changes from xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3_BAT -> xe-pw-161148v1_BAT
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

  * Linux: xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3 -> xe-pw-161148v1

  IGT_8737: 8737
  xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3: 55e3e3aeecf80d9fd2536acd8ed785282be5a7b3
  xe-pw-161148v1: 161148v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161148v1/index.html

--===============4554887151162062238==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Introduce a flag to disallow vm overcommit in fault mode</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161148/">https://patchwork.freedesktop.org/series/161148/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161148v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161148v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3_BAT -&gt; xe-pw-161148v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3 -&gt; xe-pw-161148v1</li>
</ul>
<p>IGT_8737: 8737<br />
  xe-4500-55e3e3aeecf80d9fd2536acd8ed785282be5a7b3: 55e3e3aeecf80d9fd2536acd8ed785282be5a7b3<br />
  xe-pw-161148v1: 161148v1</p>

</body>
</html>

--===============4554887151162062238==--
