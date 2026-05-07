Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAB1CCD3442
	for <intel-xe@archiver.kernel.org>; Thu,  7 May 2026 10:27:30 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6A68D10F050;
	Thu,  7 May 2026 10:27:30 +0000 (UTC)
Received: from 5ab824fced77 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D99CD10E1FC;
 Thu,  7 May 2026 10:27:29 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============6206337098595602106=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm=3A_Drop_HPAGE=5FPMD=5FS?=
 =?utf-8?q?IZE_dependency_in_dma=5Fiova=5Ftry=5Falloc_calls?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Francois Dugast" <francois.dugast@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 07 May 2026 10:27:29 -0000
Message-ID: <177814964988.47093.4875777136904334030@5ab824fced77>
X-Patchwork-Hint: ignore
References: <20260507091606.1067973-1-francois.dugast@intel.com>
In-Reply-To: <20260507091606.1067973-1-francois.dugast@intel.com>
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

--===============6206337098595602106==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm: Drop HPAGE_PMD_SIZE dependency in dma_iova_try_alloc calls
URL   : https://patchwork.freedesktop.org/series/166117/
State : success

== Summary ==

CI Bug Log - changes from xe-5009-87b47564361c80e696221c1685fe72e637b38955_BAT -> xe-pw-166117v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5009-87b47564361c80e696221c1685fe72e637b38955 -> xe-pw-166117v1

  IGT_8899: 3e5747e536f148bf232049e49a00e2b683f91a83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5009-87b47564361c80e696221c1685fe72e637b38955: 87b47564361c80e696221c1685fe72e637b38955
  xe-pw-166117v1: 166117v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166117v1/index.html

--===============6206337098595602106==
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
<tr><td><b>Series:</b></td><td>drm: Drop HPAGE_PMD_SIZE dependency in dma_iova_try_alloc calls</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/166117/">https://patchwork.freedesktop.org/series/166117/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166117v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-166117v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5009-87b47564361c80e696221c1685fe72e637b38955_BAT -&gt; xe-pw-166117v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5009-87b47564361c80e696221c1685fe72e637b38955 -&gt; xe-pw-166117v1</li>
</ul>
<p>IGT_8899: 3e5747e536f148bf232049e49a00e2b683f91a83 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5009-87b47564361c80e696221c1685fe72e637b38955: 87b47564361c80e696221c1685fe72e637b38955<br />
  xe-pw-166117v1: 166117v1</p>

</body>
</html>

--===============6206337098595602106==--
