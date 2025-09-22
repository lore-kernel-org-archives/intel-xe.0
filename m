Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 25F28CAC592
	for <intel-xe@archiver.kernel.org>; Mon, 22 Sep 2025 23:54:58 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D45E810E03A;
	Mon, 22 Sep 2025 23:54:57 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 42AA710E03A;
 Mon, 22 Sep 2025 23:54:56 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4088205690654987023=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/configfs=3A_Fix_engi?=
 =?utf-8?q?ne_class_parsing?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 22 Sep 2025 23:54:56 -0000
Message-ID: <175858529625.355661.9616538747463029202@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250922221209.110737-2-lucas.demarchi@intel.com>
In-Reply-To: <20250922221209.110737-2-lucas.demarchi@intel.com>
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

--===============4088205690654987023==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/configfs: Fix engine class parsing
URL   : https://patchwork.freedesktop.org/series/154870/
State : success

== Summary ==

CI Bug Log - changes from xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1_BAT -> xe-pw-154870v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8547 -> IGT_8548
  * Linux: xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1 -> xe-pw-154870v1

  IGT_8547: 8547
  IGT_8548: 8548
  xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1: 3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1
  xe-pw-154870v1: 154870v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154870v1/index.html

--===============4088205690654987023==
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
<tr><td><b>Series:</b></td><td>drm/xe/configfs: Fix engine class parsing</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/154870/">https://patchwork.freedesktop.org/series/154870/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154870v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-154870v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1_BAT -&gt; xe-pw-154870v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8547 -&gt; IGT_8548</li>
<li>Linux: xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1 -&gt; xe-pw-154870v1</li>
</ul>
<p>IGT_8547: 8547<br />
  IGT_8548: 8548<br />
  xe-3813-3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1: 3ff214d6c6a86025aa3feadcb5bba4abfc2dd8f1<br />
  xe-pw-154870v1: 154870v1</p>

</body>
</html>

--===============4088205690654987023==--
