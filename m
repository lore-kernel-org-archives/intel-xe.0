Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93FA0C369DC
	for <intel-xe@archiver.kernel.org>; Tue, 29 Apr 2025 10:27:15 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5D36510E41A;
	Tue, 29 Apr 2025 10:27:15 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CBC6610E41A;
 Tue, 29 Apr 2025 10:27:13 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4184020837365734980=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_impleme?=
 =?utf-8?q?nt_wa=5F14022269668_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 29 Apr 2025 10:27:13 -0000
Message-ID: <174592243383.23884.368557551268645946@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250428115554.116780-1-vinod.govindapillai@intel.com>
In-Reply-To: <20250428115554.116780-1-vinod.govindapillai@intel.com>
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

--===============4184020837365734980==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: implement wa_14022269668 (rev2)
URL   : https://patchwork.freedesktop.org/series/147006/
State : success

== Summary ==

CI Bug Log - changes from xe-2997-22d29c516450a3931a8e0b1346ab9f334c19ab9c_BAT -> xe-pw-147006v2_BAT
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

  * IGT: IGT_8336 -> IGT_8340
  * Linux: xe-2997-22d29c516450a3931a8e0b1346ab9f334c19ab9c -> xe-pw-147006v2

  IGT_8336: 8336
  IGT_8340: 9eda33fedff747e846671328a19fa516b5bd7015 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2997-22d29c516450a3931a8e0b1346ab9f334c19ab9c: 22d29c516450a3931a8e0b1346ab9f334c19ab9c
  xe-pw-147006v2: 147006v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147006v2/index.html

--===============4184020837365734980==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: implement wa_14022269668 (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/147006/">https://patchwork.freedesktop.org/series/147006/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147006v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-147006v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2997-22d29c516450a3931a8e0b1346ab9f334c19ab9c_BAT -&gt; xe-pw-147006v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8336 -&gt; IGT_8340</li>
<li>Linux: xe-2997-22d29c516450a3931a8e0b1346ab9f334c19ab9c -&gt; xe-pw-147006v2</li>
</ul>
<p>IGT_8336: 8336<br />
  IGT_8340: 9eda33fedff747e846671328a19fa516b5bd7015 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2997-22d29c516450a3931a8e0b1346ab9f334c19ab9c: 22d29c516450a3931a8e0b1346ab9f334c19ab9c<br />
  xe-pw-147006v2: 147006v2</p>

</body>
</html>

--===============4184020837365734980==--
