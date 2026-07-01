Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E673AC43458
	for <intel-xe@archiver.kernel.org>; Wed,  1 Jul 2026 06:46:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8B66110EDC8;
	Wed,  1 Jul 2026 06:46:33 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 599FD10EDC8;
 Wed,  1 Jul 2026 06:46:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============9188987051685306285=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/ttm=3A_Fix_UAF_on_dma-b?=
 =?utf-8?q?uf_attach_failure_for_sg_BOs_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 01 Jul 2026 06:46:32 -0000
Message-ID: <178288839236.135317.13627823476852730371@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260701062559.3731993-2-nitin.r.gote@intel.com>
In-Reply-To: <20260701062559.3731993-2-nitin.r.gote@intel.com>
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

--===============9188987051685306285==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/ttm: Fix UAF on dma-buf attach failure for sg BOs (rev2)
URL   : https://patchwork.freedesktop.org/series/169129/
State : success

== Summary ==

CI Bug Log - changes from xe-5316-7100870965845da8c31005c07fd1b390bbe96b20_BAT -> xe-pw-169129v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 12)
------------------------------

  Missing    (1): bat-bmg-2 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5316-7100870965845da8c31005c07fd1b390bbe96b20 -> xe-pw-169129v2

  IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5316-7100870965845da8c31005c07fd1b390bbe96b20: 7100870965845da8c31005c07fd1b390bbe96b20
  xe-pw-169129v2: 169129v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169129v2/index.html

--===============9188987051685306285==
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
<tr><td><b>Series:</b></td><td>drm/ttm: Fix UAF on dma-buf attach failure for sg BOs (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/169129/">https://patchwork.freedesktop.org/series/169129/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169129v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-169129v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5316-7100870965845da8c31005c07fd1b390bbe96b20_BAT -&gt; xe-pw-169129v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 12)</h2>
<p>Missing    (1): bat-bmg-2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5316-7100870965845da8c31005c07fd1b390bbe96b20 -&gt; xe-pw-169129v2</li>
</ul>
<p>IGT_8989: a8e2cbd2854d7980a9eccecc6e0c801d0824b88f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5316-7100870965845da8c31005c07fd1b390bbe96b20: 7100870965845da8c31005c07fd1b390bbe96b20<br />
  xe-pw-169129v2: 169129v2</p>

</body>
</html>

--===============9188987051685306285==--
