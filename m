Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF1B2C83030
	for <intel-xe@archiver.kernel.org>; Mon, 30 Jun 2025 23:43:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 93C3010E4D1;
	Mon, 30 Jun 2025 23:43:25 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E72010E4D1;
 Mon, 30 Jun 2025 23:43:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8258337999404470222=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Introduce_helper_for_displa?=
 =?utf-8?q?y_workarounds_and_add_Wa=5F16025573575?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nautiyal, Ankit K" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 30 Jun 2025 23:43:24 -0000
Message-ID: <175132700403.121990.10755312214341943684@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250630054918.2823537-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250630054918.2823537-1-ankit.k.nautiyal@intel.com>
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

--===============8258337999404470222==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Introduce helper for display workarounds and add Wa_16025573575
URL   : https://patchwork.freedesktop.org/series/150935/
State : success

== Summary ==

CI Bug Log - changes from xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86_BAT -> xe-pw-150935v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 8)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8431 -> IGT_8432
  * Linux: xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86 -> xe-pw-150935v1

  IGT_8431: 8431
  IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86: d9007d535ea106181346f9988c97aa73a9cdfb86
  xe-pw-150935v1: 150935v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150935v1/index.html

--===============8258337999404470222==
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
<tr><td><b>Series:</b></td><td>Introduce helper for display workarounds and add Wa_16025573575</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150935/">https://patchwork.freedesktop.org/series/150935/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150935v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150935v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86_BAT -&gt; xe-pw-150935v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 8)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8431 -&gt; IGT_8432</li>
<li>Linux: xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86 -&gt; xe-pw-150935v1</li>
</ul>
<p>IGT_8431: 8431<br />
  IGT_8432: 4871829d8b7117553eb2dc1bdb9a0d18de428a98 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3325-d9007d535ea106181346f9988c97aa73a9cdfb86: d9007d535ea106181346f9988c97aa73a9cdfb86<br />
  xe-pw-150935v1: 150935v1</p>

</body>
</html>

--===============8258337999404470222==--
