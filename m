Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E37CC61CE8
	for <intel-xe@archiver.kernel.org>; Tue, 10 Jun 2025 01:33:51 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0708110E45C;
	Tue, 10 Jun 2025 01:33:46 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79FEF10E051;
 Tue, 10 Jun 2025 01:33:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7924272287718433706=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_early_wedge_o?=
 =?utf-8?q?n_GuC_load_failure_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Daniele Ceraolo Spurio" <daniele.ceraolospurio@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 10 Jun 2025 01:33:45 -0000
Message-ID: <174951922548.62288.6111750553548067277@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250610002245.1056576-2-daniele.ceraolospurio@intel.com>
In-Reply-To: <20250610002245.1056576-2-daniele.ceraolospurio@intel.com>
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

--===============7924272287718433706==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix early wedge on GuC load failure (rev2)
URL   : https://patchwork.freedesktop.org/series/149906/
State : success

== Summary ==

CI Bug Log - changes from xe-3225-52ecbb6a68785860c776b29f58792d9807243979_BAT -> xe-pw-149906v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3225-52ecbb6a68785860c776b29f58792d9807243979 -> xe-pw-149906v2

  IGT_8401: 8401
  xe-3225-52ecbb6a68785860c776b29f58792d9807243979: 52ecbb6a68785860c776b29f58792d9807243979
  xe-pw-149906v2: 149906v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149906v2/index.html

--===============7924272287718433706==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix early wedge on GuC load failure (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149906/">https://patchwork.freedesktop.org/series/149906/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149906v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149906v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3225-52ecbb6a68785860c776b29f58792d9807243979_BAT -&gt; xe-pw-149906v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3225-52ecbb6a68785860c776b29f58792d9807243979 -&gt; xe-pw-149906v2</li>
</ul>
<p>IGT_8401: 8401<br />
  xe-3225-52ecbb6a68785860c776b29f58792d9807243979: 52ecbb6a68785860c776b29f58792d9807243979<br />
  xe-pw-149906v2: 149906v2</p>

</body>
</html>

--===============7924272287718433706==--
