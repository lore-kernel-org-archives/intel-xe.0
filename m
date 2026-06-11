Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1A009CD98D2
	for <intel-xe@archiver.kernel.org>; Thu, 11 Jun 2026 08:49:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CDEE810ED9C;
	Thu, 11 Jun 2026 08:49:14 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A16C10ED99;
 Thu, 11 Jun 2026 08:49:14 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5404434082834380091=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pcode=3A_add_default?=
 =?utf-8?q?_timeout_macro_and_pass_read_timeout?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Karthik Poosa" <karthik.poosa@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 11 Jun 2026 08:49:14 -0000
Message-ID: <178116775403.68362.14273663046079764531@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260611074355.3562414-1-karthik.poosa@intel.com>
In-Reply-To: <20260611074355.3562414-1-karthik.poosa@intel.com>
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

--===============5404434082834380091==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pcode: add default timeout macro and pass read timeout
URL   : https://patchwork.freedesktop.org/series/168326/
State : success

== Summary ==

CI Bug Log - changes from xe-5235-b50be9fd86832954f116a099ffbe4ad107df16a5_BAT -> xe-pw-168326v1_BAT
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

  * Linux: xe-5235-b50be9fd86832954f116a099ffbe4ad107df16a5 -> xe-pw-168326v1

  IGT_8958: 8958
  xe-5235-b50be9fd86832954f116a099ffbe4ad107df16a5: b50be9fd86832954f116a099ffbe4ad107df16a5
  xe-pw-168326v1: 168326v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168326v1/index.html

--===============5404434082834380091==
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
<tr><td><b>Series:</b></td><td>drm/xe/pcode: add default timeout macro and pass read timeout</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/168326/">https://patchwork.freedesktop.org/series/168326/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168326v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-168326v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5235-b50be9fd86832954f116a099ffbe4ad107df16a5_BAT -&gt; xe-pw-168326v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5235-b50be9fd86832954f116a099ffbe4ad107df16a5 -&gt; xe-pw-168326v1</li>
</ul>
<p>IGT_8958: 8958<br />
  xe-5235-b50be9fd86832954f116a099ffbe4ad107df16a5: b50be9fd86832954f116a099ffbe4ad107df16a5<br />
  xe-pw-168326v1: 168326v1</p>

</body>
</html>

--===============5404434082834380091==--
