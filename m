Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0EECEC48BC3
	for <intel-xe@archiver.kernel.org>; Mon, 19 Feb 2024 18:33:43 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A966310E0F9;
	Mon, 19 Feb 2024 18:33:43 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7391410E0F9;
 Mon, 19 Feb 2024 18:33:42 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7982833684492111565=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_series_starting_with_=5BCI=2C1/4?=
 =?utf-8?q?=5D_drm/xe/guc=3A_Allocate_GuC_data_structures_in_system_memory_f?=
 =?utf-8?q?or_initial_load_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Micha=C5=82_Winiarski?= <michal.winiarski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 19 Feb 2024 18:33:42 -0000
Message-ID: <170836762247.107368.4049984566950020351@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240219130530.1406044-1-michal.winiarski@intel.com>
In-Reply-To: <20240219130530.1406044-1-michal.winiarski@intel.com>
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

--===============7982833684492111565==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: series starting with [CI,1/4] drm/xe/guc: Allocate GuC data structures in system memory for initial load (rev2)
URL   : https://patchwork.freedesktop.org/series/130079/
State : success

== Summary ==

CI Bug Log - changes from xe-803-f12bce6493b6443870b55f36b1462d65e450d29d_BAT -> xe-pw-130079v2_BAT
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

  * IGT: IGT_7716 -> IGT_7718
  * Linux: xe-803-f12bce6493b6443870b55f36b1462d65e450d29d -> xe-pw-130079v2

  IGT_7716: 7716
  IGT_7718: 40e8b9122853f455c84afcfa56469a6bc9a0d564 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-803-f12bce6493b6443870b55f36b1462d65e450d29d: f12bce6493b6443870b55f36b1462d65e450d29d
  xe-pw-130079v2: 130079v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130079v2/index.html

--===============7982833684492111565==
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
<tr><td><b>Series:</b></td><td>series starting with [CI,1/4] drm/xe/guc: Allocate GuC data structures in system memory for initial load (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/130079/">https://patchwork.freedesktop.org/series/130079/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130079v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-130079v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-803-f12bce6493b6443870b55f36b1462d65e450d29d_BAT -&gt; xe-pw-130079v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7716 -&gt; IGT_7718</li>
<li>Linux: xe-803-f12bce6493b6443870b55f36b1462d65e450d29d -&gt; xe-pw-130079v2</li>
</ul>
<p>IGT_7716: 7716<br />
  IGT_7718: 40e8b9122853f455c84afcfa56469a6bc9a0d564 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-803-f12bce6493b6443870b55f36b1462d65e450d29d: f12bce6493b6443870b55f36b1462d65e450d29d<br />
  xe-pw-130079v2: 130079v2</p>

</body>
</html>

--===============7982833684492111565==--
