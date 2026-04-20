Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 314ECF5A8AD
	for <intel-xe@archiver.kernel.org>; Mon, 20 Apr 2026 19:05:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E7D4410EB31;
	Mon, 20 Apr 2026 19:04:59 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6A6B410EB31;
 Mon, 20 Apr 2026 19:04:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1079443639355248232=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Add_clear-error-counter_com?=
 =?utf-8?q?mand_to_drm=5Fras_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tauro, Riana" <riana.tauro@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Apr 2026 19:04:58 -0000
Message-ID: <177671189842.477004.4385569992950150796@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260409073318.2909379-4-riana.tauro@intel.com>
In-Reply-To: <20260409073318.2909379-4-riana.tauro@intel.com>
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

--===============1079443639355248232==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Add clear-error-counter command to drm_ras (rev2)
URL   : https://patchwork.freedesktop.org/series/164601/
State : success

== Summary ==

CI Bug Log - changes from xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201_BAT -> xe-pw-164601v2_BAT
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

  * Linux: xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201 -> xe-pw-164601v2

  IGT_8863: 5b279a8b71dc1672099205a1a9e8135c7c7fadb5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201: da91cb4e6137507f74e4da41c39d0260b4cd1201
  xe-pw-164601v2: 164601v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/index.html

--===============1079443639355248232==
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
<tr><td><b>Series:</b></td><td>Add clear-error-counter command to drm_ras (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/164601/">https://patchwork.freedesktop.org/series/164601/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-164601v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201_BAT -&gt; xe-pw-164601v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201 -&gt; xe-pw-164601v2</li>
</ul>
<p>IGT_8863: 5b279a8b71dc1672099205a1a9e8135c7c7fadb5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-4920-da91cb4e6137507f74e4da41c39d0260b4cd1201: da91cb4e6137507f74e4da41c39d0260b4cd1201<br />
  xe-pw-164601v2: 164601v2</p>

</body>
</html>

--===============1079443639355248232==--
