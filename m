Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A99EFC02181
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jan 2025 19:38:12 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5DDB810E47B;
	Mon, 20 Jan 2025 19:38:12 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 65A0C10E47B;
 Mon, 20 Jan 2025 19:38:10 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4124116227679951713=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_Check_Scaler_and_DSC_Prefil?=
 =?utf-8?q?l_Latency_Against_Vblank_=28rev7=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Mitul Golani" <mitulkumar.ajitkumar.golani@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Jan 2025 19:38:10 -0000
Message-ID: <173740189040.2268516.11056379939196328971@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250120172209.188488-1-mitulkumar.ajitkumar.golani@intel.com>
In-Reply-To: <20250120172209.188488-1-mitulkumar.ajitkumar.golani@intel.com>
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

--===============4124116227679951713==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Check Scaler and DSC Prefill Latency Against Vblank (rev7)
URL   : https://patchwork.freedesktop.org/series/143159/
State : success

== Summary ==

CI Bug Log - changes from xe-2515-112cf3f777a01cf551c69d74d43f6c2732981706_BAT -> xe-pw-143159v7_BAT
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

  * Linux: xe-2515-112cf3f777a01cf551c69d74d43f6c2732981706 -> xe-pw-143159v7

  IGT_8199: 8df1895672949617992cddbc33c5d683865879e8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2515-112cf3f777a01cf551c69d74d43f6c2732981706: 112cf3f777a01cf551c69d74d43f6c2732981706
  xe-pw-143159v7: 143159v7

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v7/index.html

--===============4124116227679951713==
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
<tr><td><b>Series:</b></td><td>Check Scaler and DSC Prefill Latency Against Vblank (rev7)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143159/">https://patchwork.freedesktop.org/series/143159/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v7/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143159v7/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2515-112cf3f777a01cf551c69d74d43f6c2732981706_BAT -&gt; xe-pw-143159v7_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2515-112cf3f777a01cf551c69d74d43f6c2732981706 -&gt; xe-pw-143159v7</li>
</ul>
<p>IGT_8199: 8df1895672949617992cddbc33c5d683865879e8 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2515-112cf3f777a01cf551c69d74d43f6c2732981706: 112cf3f777a01cf551c69d74d43f6c2732981706<br />
  xe-pw-143159v7: 143159v7</p>

</body>
</html>

--===============4124116227679951713==--
