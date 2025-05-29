Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96B0C5AE59
	for <intel-xe@archiver.kernel.org>; Thu, 29 May 2025 04:19:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7846510E1C6;
	Thu, 29 May 2025 04:19:22 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3AE8D10E1C6;
 Thu, 29 May 2025 04:19:21 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0524306953728056150=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EFull=3A_success_for_drm/xe=3A_Add_configfs_to_?=
 =?utf-8?q?load_with_fewer_engines_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lucas De Marchi" <lucas.demarchi@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 29 May 2025 04:19:21 -0000
Message-ID: <174849236123.30676.9358974283119977618@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
In-Reply-To: <20250528-engine-mask-v4-0-f4636d2a890a@intel.com>
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

--===============0524306953728056150==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add configfs to load with fewer engines (rev4)
URL   : https://patchwork.freedesktop.org/series/149259/
State : success

== Summary ==

CI Bug Log - changes from xe-3155-76d59d6988dc9194cbd7d3c551c11f47f56f4020_FULL -> xe-pw-149259v4_FULL
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

  * Linux: xe-3155-76d59d6988dc9194cbd7d3c551c11f47f56f4020 -> xe-pw-149259v4

  IGT_8382: 8382
  xe-3155-76d59d6988dc9194cbd7d3c551c11f47f56f4020: 76d59d6988dc9194cbd7d3c551c11f47f56f4020
  xe-pw-149259v4: 149259v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v4/index.html

--===============0524306953728056150==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add configfs to load with fewer engines (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/149259/">https://patchwork.freedesktop.org/series/149259/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-149259v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3155-76d59d6988dc9194cbd7d3c551c11f47f56f4020_FULL -&gt; xe-pw-149259v4_FULL</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (4 -&gt; 4)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3155-76d59d6988dc9194cbd7d3c551c11f47f56f4020 -&gt; xe-pw-149259v4</li>
</ul>
<p>IGT_8382: 8382<br />
  xe-3155-76d59d6988dc9194cbd7d3c551c11f47f56f4020: 76d59d6988dc9194cbd7d3c551c11f47f56f4020<br />
  xe-pw-149259v4: 149259v4</p>

</body>
</html>

--===============0524306953728056150==--
