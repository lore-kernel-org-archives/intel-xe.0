Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE54AC43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 07:30:54 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AAFCD10EE13;
	Wed,  1 Jul 2026 07:30:54 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D694010EE11;
 Wed,  1 Jul 2026 07:30:53 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5203653291810956094=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/gpusvm=3A_fix_IOVA/DMA_?=
 =?utf-8?q?unmap_leaks_in_=5F=5Fdrm=5Fgpusvm=5Funmap=5Fpages=28=29_=28rev3?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Honglei Huang" <honghuan@amd.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Jul 2026 07:30:53 -0000
Message-ID: <178289105387.135317.8378462977939723451@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260701062800.409248-1-honghuan@amd.com>
In-Reply-To: <20260701062800.409248-1-honghuan@amd.com>
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

--===============5203653291810956094==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/gpusvm: fix IOVA/DMA unmap leaks in __drm_gpusvm_unmap_pages() (rev3)
URL   : https://patchwork.freedesktop.org/series/169467/
State : success

== Summary ==

CI Bug Log - changes from xe-5316-7100870965845da8c31005c07fd1b390bbe96b20_BAT -> xe-pw-169467v3_BAT
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

  * Linux: xe-5316-7100870965845da8c31005c07fd1b390bbe96b20 -> xe-pw-169467v3

  IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5316-7100870965845da8c31005c07fd1b390bbe96b20: 7100870965845da8c31005c07fd1b390bbe96b20
  xe-pw-169467v3: 169467v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169467v3/index.html

--===============5203653291810956094==
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
<tr><td><b>Series:</b></td><td>drm/gpusvm: fix IOVA/DMA unmap leaks in __drm_gpusvm_unmap_pages() (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169467/">https://patchwork.freedesktop.org/series/169467/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169467v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169467v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5316-7100870965845da8c31005c07fd1b390bbe96b20_BAT -&gt; xe-pw-169467v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5316-7100870965845da8c31005c07fd1b390bbe96b20 -&gt; xe-pw-169467v3</li>
</ul>
<p>IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5316-7100870965845da8c31005c07fd1b390bbe96b20: 7100870965845da8c31005c07fd1b390bbe96b20<br />
  xe-pw-169467v3: 169467v3</p>

</body>
</html>

--===============5203653291810956094==--
