Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C025EDF152
	for <intel-xe@archiver.kernel.org>; Fri, 13 Feb 2026 11:11:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E112710E7E3;
	Fri, 13 Feb 2026 11:11:14 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A590E10E7F8;
 Fri, 13 Feb 2026 11:11:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4505432705104145310=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_convert?=
 =?utf-8?q?_a_bunch_of_W/A_checks_to_the_new_framework_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Luca Coelho" <luciano.coelho@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 13 Feb 2026 11:11:13 -0000
Message-ID: <177098107365.252230.6833089279886704345@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260213102500.406925-1-luciano.coelho@intel.com>
In-Reply-To: <20260213102500.406925-1-luciano.coelho@intel.com>
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

--===============4505432705104145310==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: convert a bunch of W/A checks to the new framework (rev2)
URL   : https://patchwork.freedesktop.org/series/161555/
State : success

== Summary ==

CI Bug Log - changes from xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07_BAT -> xe-pw-161555v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 10)
------------------------------

  Missing    (4): bat-adlp-vm bat-bmg-2 bat-ptl-vm bat-bmg-3 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07 -> xe-pw-161555v2

  IGT_8753: 8753
  xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07: cd76e45b9a192aa3d4f7a2efb8ee46767f098e07
  xe-pw-161555v2: 161555v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161555v2/index.html

--===============4505432705104145310==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: convert a bunch of W/A checks to the new framework (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/161555/">https://patchwork.freedesktop.org/series/161555/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161555v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-161555v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07_BAT -&gt; xe-pw-161555v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 10)</h2>
<p>Missing    (4): bat-adlp-vm bat-bmg-2 bat-ptl-vm bat-bmg-3 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07 -&gt; xe-pw-161555v2</li>
</ul>
<p>IGT_8753: 8753<br />
  xe-4552-cd76e45b9a192aa3d4f7a2efb8ee46767f098e07: cd76e45b9a192aa3d4f7a2efb8ee46767f098e07<br />
  xe-pw-161555v2: 161555v2</p>

</body>
</html>

--===============4505432705104145310==--
