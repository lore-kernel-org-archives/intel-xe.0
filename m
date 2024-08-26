Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 320F2C5321D
	for <intel-xe@archiver.kernel.org>; Mon, 26 Aug 2024 11:57:01 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03B8510E18F;
	Mon, 26 Aug 2024 11:57:01 +0000 (UTC)
Received: from 2413ebb6fbb6 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EB9110E18F;
 Mon, 26 Aug 2024 11:56:59 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2784696638921786467=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Consolidation_of_DSS_Control_in_?=
 =?utf-8?q?Separate_Files?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 26 Aug 2024 11:56:59 -0000
Message-ID: <172467341951.784198.16261739337580715340@2413ebb6fbb6>
X-Patchwork-Hint: ignore
References: <20240826111527.1113622-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20240826111527.1113622-1-ankit.k.nautiyal@intel.com>
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

--===============2784696638921786467==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Consolidation of DSS Control in Separate Files
URL   : https://patchwork.freedesktop.org/series/137788/
State : success

== Summary ==

CI Bug Log - changes from xe-1825-16bd1e79da2f0236cc5df0bad83e05dc44a31774_BAT -> xe-pw-137788v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 9)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1825-16bd1e79da2f0236cc5df0bad83e05dc44a31774 -> xe-pw-137788v1

  IGT_7991: e5cbe548dbd6ee44200a83745a605643a1a4c714 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1825-16bd1e79da2f0236cc5df0bad83e05dc44a31774: 16bd1e79da2f0236cc5df0bad83e05dc44a31774
  xe-pw-137788v1: 137788v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137788v1/index.html

--===============2784696638921786467==
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
<tr><td><b>Series:</b></td><td>Consolidation of DSS Control in Separate Files</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/137788/">https://patchwork.freedesktop.org/series/137788/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137788v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-137788v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1825-16bd1e79da2f0236cc5df0bad83e05dc44a31774_BAT -&gt; xe-pw-137788v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 9)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1825-16bd1e79da2f0236cc5df0bad83e05dc44a31774 -&gt; xe-pw-137788v1</li>
</ul>
<p>IGT_7991: e5cbe548dbd6ee44200a83745a605643a1a4c714 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1825-16bd1e79da2f0236cc5df0bad83e05dc44a31774: 16bd1e79da2f0236cc5df0bad83e05dc44a31774<br />
  xe-pw-137788v1: 137788v1</p>

</body>
</html>

--===============2784696638921786467==--
