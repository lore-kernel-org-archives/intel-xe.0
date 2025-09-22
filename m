Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01C9BCA100F
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 21:23:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E63D10E06A;
	Mon, 22 Sep 2025 21:23:45 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7A1810E06A;
 Mon, 22 Sep 2025 21:23:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8460897110136904599=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe/configfs=3A_Correct?=
 =?utf-8?q?_mask_and_pattern_check_in_lookup=5Fengine=5Finfo?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Cavitt, Jonathan" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Sep 2025 21:23:44 -0000
Message-ID: <175857622467.355661.5800529977693568968@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250922155544.67712-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250922155544.67712-1-jonathan.cavitt@intel.com>
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

--===============8460897110136904599==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/configfs: Correct mask and pattern check in lookup_engine_info
URL   : https://patchwork.freedesktop.org/series/154852/
State : success

== Summary ==

CI Bug Log - changes from xe-3812-c4d19320a0e2f7d8dec97d4a59309349a3a63ec0_FULL -> xe-pw-154852v1_FULL
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

  * IGT: IGT_8546 -> IGT_8547
  * Linux: xe-3812-c4d19320a0e2f7d8dec97d4a59309349a3a63ec0 -> xe-pw-154852v1

  IGT_8546: 8546
  IGT_8547: 8547
  xe-3812-c4d19320a0e2f7d8dec97d4a59309349a3a63ec0: c4d19320a0e2f7d8dec97d4a59309349a3a63ec0
  xe-pw-154852v1: 154852v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154852v1/index.html

--===============8460897110136904599==
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
<tr><td><b>Series:</b></td><td>drm/xe/configfs: Correct mask and pattern check in lookup_engine_info</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154852/">https://patchwork.freedesktop.org/series/154852/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154852v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154852v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3812-c4d19320a0e2f7d8dec97d4a59309349a3a63ec0_FULL -&gt; xe-pw-154852v1_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8546 -&gt; IGT_8547</li>
<li>Linux: xe-3812-c4d19320a0e2f7d8dec97d4a59309349a3a63ec0 -&gt; xe-pw-154852v1</li>
</ul>
<p>IGT_8546: 8546<br />
  IGT_8547: 8547<br />
  xe-3812-c4d19320a0e2f7d8dec97d4a59309349a3a63ec0: c4d19320a0e2f7d8dec97d4a59309349a3a63ec0<br />
  xe-pw-154852v1: 154852v1</p>

</body>
</html>

--===============8460897110136904599==--
