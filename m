Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83E88C54E64
	for <intel-xe@archiver.kernel.org>; Mon, 25 Mar 2024 20:06:59 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077B910E2BB;
	Mon, 25 Mar 2024 20:06:59 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0E45F10E2BB;
 Mon, 25 Mar 2024 20:06:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8880559954711017010=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5B1/3=5D_d?=
 =?utf-8?q?rm/xe=3A_Store_xe=5Fhe=5Fengine_in_xe=5Fhw=5Fengine=5Fsnapshot?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Jos=C3=A9_Roberto_de_Souza?= <jose.souza@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 Mar 2024 20:06:58 -0000
Message-ID: <171139721805.1038098.5434788452429125008@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240325190643.150648-1-jose.souza@intel.com>
In-Reply-To: <20240325190643.150648-1-jose.souza@intel.com>
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

--===============8880559954711017010==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [1/3] drm/xe: Store xe_he_engine in xe_hw_engine_snapshot
URL   : https://patchwork.freedesktop.org/series/131599/
State : success

== Summary ==

CI Bug Log - changes from xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14_BAT -> xe-pw-131599v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (4 -> 3)
------------------------------

  Missing    (1): bat-dg2-oem2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7781 -> IGT_7782
  * Linux: xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14 -> xe-pw-131599v1

  IGT_7781: 7781
  IGT_7782: a404f73182948e843640d00cc279883391cf6ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14: d1ecfbbbb194e8f7941bd84f77f7c938b461ce14
  xe-pw-131599v1: 131599v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131599v1/index.html

--===============8880559954711017010==
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
<tr><td><b>Series:</b></td><td>series starting with [1/3] drm/xe: Store xe_he_engine in xe_hw_engine_snapshot</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/131599/">https://patchwork.freedesktop.org/series/131599/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131599v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-131599v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14_BAT -&gt; xe-pw-131599v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 3)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7781 -&gt; IGT_7782</li>
<li>Linux: xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14 -&gt; xe-pw-131599v1</li>
</ul>
<p>IGT_7781: 7781<br />
  IGT_7782: a404f73182948e843640d00cc279883391cf6ef4 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-988-d1ecfbbbb194e8f7941bd84f77f7c938b461ce14: d1ecfbbbb194e8f7941bd84f77f7c938b461ce14<br />
  xe-pw-131599v1: 131599v1</p>

</body>
</html>

--===============8880559954711017010==--
