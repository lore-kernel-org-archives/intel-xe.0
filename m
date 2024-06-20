Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC78C2BA18
	for <intel-xe@archiver.kernel.org>; Thu, 20 Jun 2024 07:01:28 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC0FF10E6AB;
	Thu, 20 Jun 2024 07:01:27 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 99ADF10E6AB;
 Thu, 20 Jun 2024 07:01:26 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3772018607622905813=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Adapt_the_driver_to_boot_on_the_?=
 =?utf-8?q?VF_device_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 20 Jun 2024 07:01:26 -0000
Message-ID: <171886688662.127478.10211681707863249525@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240619214557.905-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240619214557.905-1-michal.wajdeczko@intel.com>
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

--===============3772018607622905813==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Adapt the driver to boot on the VF device (rev2)
URL   : https://patchwork.freedesktop.org/series/135080/
State : success

== Summary ==

CI Bug Log - changes from xe-1500-66d8ec4c6e7d124a021a3a8d038ed9e739cc9359_BAT -> xe-pw-135080v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 4)
------------------------------

  Missing    (1): bat-pvc-2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_7892 -> IGT_7893
  * Linux: xe-1500-66d8ec4c6e7d124a021a3a8d038ed9e739cc9359 -> xe-pw-135080v2

  IGT_7892: 7892
  IGT_7893: a1840ca4270b765883d3b71a710b6af85ded8235 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1500-66d8ec4c6e7d124a021a3a8d038ed9e739cc9359: 66d8ec4c6e7d124a021a3a8d038ed9e739cc9359
  xe-pw-135080v2: 135080v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v2/index.html

--===============3772018607622905813==
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
<tr><td><b>Series:</b></td><td>Adapt the driver to boot on the VF device (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/135080/">https://patchwork.freedesktop.org/series/135080/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-135080v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1500-66d8ec4c6e7d124a021a3a8d038ed9e739cc9359_BAT -&gt; xe-pw-135080v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 4)</h2>
<p>Missing    (1): bat-pvc-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_7892 -&gt; IGT_7893</li>
<li>Linux: xe-1500-66d8ec4c6e7d124a021a3a8d038ed9e739cc9359 -&gt; xe-pw-135080v2</li>
</ul>
<p>IGT_7892: 7892<br />
  IGT_7893: a1840ca4270b765883d3b71a710b6af85ded8235 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1500-66d8ec4c6e7d124a021a3a8d038ed9e739cc9359: 66d8ec4c6e7d124a021a3a8d038ed9e739cc9359<br />
  xe-pw-135080v2: 135080v2</p>

</body>
</html>

--===============3772018607622905813==--
