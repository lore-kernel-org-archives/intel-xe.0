Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 38007CA0ED1
	for <intel-xe@archiver.kernel.org>; Mon, 18 Aug 2025 08:42:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EEC6B10E3ED;
	Mon, 18 Aug 2025 08:42:23 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9F0D210E1BE;
 Mon, 18 Aug 2025 08:42:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4118230748867959959=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Optimize_vrr=2Eguardband_an?=
 =?utf-8?q?d_fix_LRR_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Ankit Nautiyal" <ankit.k.nautiyal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 18 Aug 2025 08:42:23 -0000
Message-ID: <175550654364.243319.7152859683312911643@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250818073128.2319762-1-ankit.k.nautiyal@intel.com>
In-Reply-To: <20250818073128.2319762-1-ankit.k.nautiyal@intel.com>
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

--===============4118230748867959959==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Optimize vrr.guardband and fix LRR (rev5)
URL   : https://patchwork.freedesktop.org/series/151244/
State : success

== Summary ==

CI Bug Log - changes from xe-3566-e96ac495247bb459351af3e70cad06769afbb1a2_BAT -> xe-pw-151244v5_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (11 -> 9)
------------------------------

  Missing    (2): bat-adlp-vm bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3566-e96ac495247bb459351af3e70cad06769afbb1a2 -> xe-pw-151244v5

  IGT_8495: b412b144685feadfd5675f3108de3d6820a4d1db @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3566-e96ac495247bb459351af3e70cad06769afbb1a2: e96ac495247bb459351af3e70cad06769afbb1a2
  xe-pw-151244v5: 151244v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v5/index.html

--===============4118230748867959959==
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
<tr><td><b>Series:</b></td><td>Optimize vrr.guardband and fix LRR (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151244/">https://patchwork.freedesktop.org/series/151244/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151244v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3566-e96ac495247bb459351af3e70cad06769afbb1a2_BAT -&gt; xe-pw-151244v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (11 -&gt; 9)</h2>
<p>Missing    (2): bat-adlp-vm bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3566-e96ac495247bb459351af3e70cad06769afbb1a2 -&gt; xe-pw-151244v5</li>
</ul>
<p>IGT_8495: b412b144685feadfd5675f3108de3d6820a4d1db @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3566-e96ac495247bb459351af3e70cad06769afbb1a2: e96ac495247bb459351af3e70cad06769afbb1a2<br />
  xe-pw-151244v5: 151244v5</p>

</body>
</html>

--===============4118230748867959959==--
