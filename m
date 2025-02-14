Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E7B1C02198
	for <intel-xe@archiver.kernel.org>; Fri, 14 Feb 2025 19:06:17 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2A0EF10E079;
	Fri, 14 Feb 2025 19:06:17 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1B41710E079;
 Fri, 14 Feb 2025 19:06:16 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1910962007737626115=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_series_starting_with_=5B1/2?=
 =?utf-8?q?=5D_drm/xe/guc=5Fpc=3A_Do_not_stop_probe_or_resume_if_GuC_PC_fail?=
 =?utf-8?q?s?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Rodrigo Vivi" <rodrigo.vivi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 14 Feb 2025 19:06:16 -0000
Message-ID: <173955997610.2132955.7690894119438447894@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250214172503.502320-1-rodrigo.vivi@intel.com>
In-Reply-To: <20250214172503.502320-1-rodrigo.vivi@intel.com>
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

--===============1910962007737626115==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC fails
URL   : https://patchwork.freedesktop.org/series/144897/
State : success

== Summary ==

CI Bug Log - changes from xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36_BAT -> xe-pw-144897v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36 -> xe-pw-144897v1

  IGT_8230: 8230
  xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36: 371df966fcc8fbfb21725c2e5eb32b5c1eb12b36
  xe-pw-144897v1: 144897v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144897v1/index.html

--===============1910962007737626115==
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
<tr><td><b>Series:</b></td><td>series starting with [1/2] drm/xe/guc_pc: Do not stop probe or resume if GuC PC fails</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/144897/">https://patchwork.freedesktop.org/series/144897/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144897v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-144897v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36_BAT -&gt; xe-pw-144897v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36 -&gt; xe-pw-144897v1</li>
</ul>
<p>IGT_8230: 8230<br />
  xe-2667-371df966fcc8fbfb21725c2e5eb32b5c1eb12b36: 371df966fcc8fbfb21725c2e5eb32b5c1eb12b36<br />
  xe-pw-144897v1: 144897v1</p>

</body>
</html>

--===============1910962007737626115==--
