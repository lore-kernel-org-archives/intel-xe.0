Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58F4DC87FCB
	for <intel-xe@archiver.kernel.org>; Tue,  5 Aug 2025 11:36:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E38AD10E655;
	Tue,  5 Aug 2025 11:36:23 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 365E810E262;
 Tue,  5 Aug 2025 11:36:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4237424326960026515=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915=3A_vlv_clock_clean?=
 =?utf-8?q?ups?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jani Nikula" <jani.nikula@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 05 Aug 2025 11:36:23 -0000
Message-ID: <175439378318.213461.10269770469399159539@1538d3639d33>
X-Patchwork-Hint: ignore
References: <cover.1754385408.git.jani.nikula@intel.com>
In-Reply-To: <cover.1754385408.git.jani.nikula@intel.com>
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

--===============4237424326960026515==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: vlv clock cleanups
URL   : https://patchwork.freedesktop.org/series/152518/
State : success

== Summary ==

CI Bug Log - changes from xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b_BAT -> xe-pw-152518v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (8 -> 7)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8486 -> IGT_8487
  * Linux: xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b -> xe-pw-152518v1

  IGT_8486: 8f22580f497c9e9444cf31f53d990b1333ce40d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8487: 8487
  xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b: c79dfb5e415ae8c63601b02f7b3a2082d1a2345b
  xe-pw-152518v1: 152518v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152518v1/index.html

--===============4237424326960026515==
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
<tr><td><b>Series:</b></td><td>drm/i915: vlv clock cleanups</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/152518/">https://patchwork.freedesktop.org/series/152518/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152518v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-152518v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b_BAT -&gt; xe-pw-152518v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (8 -&gt; 7)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8486 -&gt; IGT_8487</li>
<li>Linux: xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b -&gt; xe-pw-152518v1</li>
</ul>
<p>IGT_8486: 8f22580f497c9e9444cf31f53d990b1333ce40d5 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8487: 8487<br />
  xe-3507-c79dfb5e415ae8c63601b02f7b3a2082d1a2345b: c79dfb5e415ae8c63601b02f7b3a2082d1a2345b<br />
  xe-pw-152518v1: 152518v1</p>

</body>
</html>

--===============4237424326960026515==--
