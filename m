Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7583CC7115A
	for <intel-xe@archiver.kernel.org>; Thu, 19 Jun 2025 15:42:44 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38AEA10E00B;
	Thu, 19 Jun 2025 15:42:44 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4E54F10E00B;
 Thu, 19 Jun 2025 15:42:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8839322277769654786=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/gpusvm=2C_drm/pagemap?=
 =?utf-8?q?=2C_drm/xe=3A_Restructure_migration_in_preparation_for_multi-devi?=
 =?utf-8?q?ce_=28rev6=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 19 Jun 2025 15:42:43 -0000
Message-ID: <175034776331.96475.12680171977225292060@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250619134035.170086-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20250619134035.170086-1-thomas.hellstrom@linux.intel.com>
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

--===============8839322277769654786==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/gpusvm, drm/pagemap, drm/xe: Restructure migration in preparation for multi-device (rev6)
URL   : https://patchwork.freedesktop.org/series/147902/
State : success

== Summary ==

CI Bug Log - changes from xe-3278-192b2df135154d4552710c489d4824d5090f8d2c_BAT -> xe-pw-147902v6_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 8)
------------------------------

  Missing    (1): bat-adlp-vm 

Known issues
------------

  Here are the changes found in xe-pw-147902v6_BAT that come from known issues:

### IGT changes ###

#### Possible fixes ####

  * igt@xe_pat@pat-index-xe2@render:
    - bat-bmg-2:          [FAIL][1] -> [PASS][2] +1 other test pass
   [1]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-3278-192b2df135154d4552710c489d4824d5090f8d2c/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html
   [2]: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147902v6/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html

  


Build changes
-------------

  * Linux: xe-3278-192b2df135154d4552710c489d4824d5090f8d2c -> xe-pw-147902v6

  IGT_8418: 8418
  xe-3278-192b2df135154d4552710c489d4824d5090f8d2c: 192b2df135154d4552710c489d4824d5090f8d2c
  xe-pw-147902v6: 147902v6

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147902v6/index.html

--===============8839322277769654786==
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
<tr><td><b>Series:</b></td><td>drm/gpusvm, drm/pagemap, drm/xe: Restructure migration in preparation for multi-device (rev6)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147902/">https://patchwork.freedesktop.org/series/147902/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147902v6/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147902v6/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3278-192b2df135154d4552710c489d4824d5090f8d2c_BAT -&gt; xe-pw-147902v6_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Known issues</h2>
<p>Here are the changes found in xe-pw-147902v6_BAT that come from known issues:</p>
<h3>IGT changes</h3>
<h4>Possible fixes</h4>
<ul>
<li>igt@xe_pat@pat-index-xe2@render:<ul>
<li>bat-bmg-2:          <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-3278-192b2df135154d4552710c489d4824d5090f8d2c/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">FAIL</a> -&gt; <a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147902v6/bat-bmg-2/igt@xe_pat@pat-index-xe2@render.html">PASS</a> +1 other test pass</li>
</ul>
</li>
</ul>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3278-192b2df135154d4552710c489d4824d5090f8d2c -&gt; xe-pw-147902v6</li>
</ul>
<p>IGT_8418: 8418<br />
  xe-3278-192b2df135154d4552710c489d4824d5090f8d2c: 192b2df135154d4552710c489d4824d5090f8d2c<br />
  xe-pw-147902v6: 147902v6</p>

</body>
</html>

--===============8839322277769654786==--
