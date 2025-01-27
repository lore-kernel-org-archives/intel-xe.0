Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBFA7C02188
	for <intel-xe@archiver.kernel.org>; Mon, 27 Jan 2025 12:51:27 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 73CA410E238;
	Mon, 27 Jan 2025 12:51:27 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 66DC410E300;
 Mon, 27 Jan 2025 12:51:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5005962953338236377=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/uapi=3A_Use_hint_for?=
 =?utf-8?q?_guc_to_set_GT_frequency_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Tejas Upadhyay" <tejas.upadhyay@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 27 Jan 2025 12:51:26 -0000
Message-ID: <173798228641.1386903.3345676661846296888@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250127110751.1548253-1-tejas.upadhyay@intel.com>
In-Reply-To: <20250127110751.1548253-1-tejas.upadhyay@intel.com>
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

--===============5005962953338236377==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uapi: Use hint for guc to set GT frequency (rev4)
URL   : https://patchwork.freedesktop.org/series/143793/
State : success

== Summary ==

CI Bug Log - changes from xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8_BAT -> xe-pw-143793v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 6)
------------------------------

  Missing    (2): bat-adlp-vm bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8 -> xe-pw-143793v4

  IGT_8209: 07ec14a8b00849e82a6ee7aff433c8f564787bf0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8: 006a892140827b356eb4ad5a5e9b947477791ba8
  xe-pw-143793v4: 143793v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v4/index.html

--===============5005962953338236377==
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
<tr><td><b>Series:</b></td><td>drm/xe/uapi: Use hint for guc to set GT frequency (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143793/">https://patchwork.freedesktop.org/series/143793/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143793v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8_BAT -&gt; xe-pw-143793v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 6)</h2>
<p>Missing    (2): bat-adlp-vm bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8 -&gt; xe-pw-143793v4</li>
</ul>
<p>IGT_8209: 07ec14a8b00849e82a6ee7aff433c8f564787bf0 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2554-006a892140827b356eb4ad5a5e9b947477791ba8: 006a892140827b356eb4ad5a5e9b947477791ba8<br />
  xe-pw-143793v4: 143793v4</p>

</body>
</html>

--===============5005962953338236377==--
