Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C7ECC71130
	for <intel-xe@archiver.kernel.org>; Tue,  8 Jul 2025 01:37:24 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 39A7010E57E;
	Tue,  8 Jul 2025 01:37:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C16D610E119;
 Tue,  8 Jul 2025 01:37:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3592228710519914604=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/uc=3A_Disable_GuC_co?=
 =?utf-8?q?mmunication_on_hardware_initialization_error=2E_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Zhanjun Dong" <zhanjun.dong@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 08 Jul 2025 01:37:23 -0000
Message-ID: <175193864378.141890.12484192049939334847@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250707231108.3217573-1-zhanjun.dong@intel.com>
In-Reply-To: <20250707231108.3217573-1-zhanjun.dong@intel.com>
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

--===============3592228710519914604==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/uc: Disable GuC communication on hardware initialization error. (rev7)
URL   : https://patchwork.freedesktop.org/series/150488/
State : success

== Summary ==

CI Bug Log - changes from xe-3367-02069d358330d2c30eb66590736f360964d88612_BAT -> xe-pw-150488v7_BAT
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

  * Linux: xe-3367-02069d358330d2c30eb66590736f360964d88612 -> xe-pw-150488v7

  IGT_8445: 8445
  xe-3367-02069d358330d2c30eb66590736f360964d88612: 02069d358330d2c30eb66590736f360964d88612
  xe-pw-150488v7: 150488v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/index.html

--===============3592228710519914604==
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
<tr><td><b>Series:</b></td><td>drm/xe/uc: Disable GuC communication on hardware initialization error. (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/150488/">https://patchwork.freedesktop.org/series/150488/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-150488v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3367-02069d358330d2c30eb66590736f360964d88612_BAT -&gt; xe-pw-150488v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3367-02069d358330d2c30eb66590736f360964d88612 -&gt; xe-pw-150488v7</li>
</ul>
<p>IGT_8445: 8445<br />
  xe-3367-02069d358330d2c30eb66590736f360964d88612: 02069d358330d2c30eb66590736f360964d88612<br />
  xe-pw-150488v7: 150488v7</p>

</body>
</html>

--===============3592228710519914604==--
