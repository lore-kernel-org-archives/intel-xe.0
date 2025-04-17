Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C7EC369C7
	for <intel-xe@archiver.kernel.org>; Thu, 17 Apr 2025 10:10:49 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 56F1610EA96;
	Thu, 17 Apr 2025 10:10:49 +0000 (UTC)
Received: from b68e5b3b99e1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E991210EA96;
 Thu, 17 Apr 2025 10:10:47 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5773233327880169022=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/pf=3A_Don=27t_allow_?=
 =?utf-8?q?LMEM_provisioning_if_LMTT_isn=27t_available_on_the_device_=28rev2?=
 =?utf-8?q?=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Pi=C3=B3rkowski=2C_Piotr?= <piotr.piorkowski@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 17 Apr 2025 10:10:47 -0000
Message-ID: <174488464794.13473.3778957356715090369@b68e5b3b99e1>
X-Patchwork-Hint: ignore
References: <20250417084621.249148-1-piotr.piorkowski@intel.com>
In-Reply-To: <20250417084621.249148-1-piotr.piorkowski@intel.com>
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

--===============5773233327880169022==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Don't allow LMEM provisioning if LMTT isn't available on the device (rev2)
URL   : https://patchwork.freedesktop.org/series/146941/
State : success

== Summary ==

CI Bug Log - changes from xe-2965-1afb38d5acb616dc76381ec0d80b081106146bbd_BAT -> xe-pw-146941v2_BAT
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

  * IGT: IGT_8324 -> IGT_8326
  * Linux: xe-2965-1afb38d5acb616dc76381ec0d80b081106146bbd -> xe-pw-146941v2

  IGT_8324: 8a49d9fa87e4de87afd3c3ec6828caf27e07b254 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8326: 8326
  xe-2965-1afb38d5acb616dc76381ec0d80b081106146bbd: 1afb38d5acb616dc76381ec0d80b081106146bbd
  xe-pw-146941v2: 146941v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v2/index.html

--===============5773233327880169022==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Don&#x27;t allow LMEM provisioning if LMTT isn&#x27;t available on the device (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/146941/">https://patchwork.freedesktop.org/series/146941/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-146941v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2965-1afb38d5acb616dc76381ec0d80b081106146bbd_BAT -&gt; xe-pw-146941v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8324 -&gt; IGT_8326</li>
<li>Linux: xe-2965-1afb38d5acb616dc76381ec0d80b081106146bbd -&gt; xe-pw-146941v2</li>
</ul>
<p>IGT_8324: 8a49d9fa87e4de87afd3c3ec6828caf27e07b254 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8326: 8326<br />
  xe-2965-1afb38d5acb616dc76381ec0d80b081106146bbd: 1afb38d5acb616dc76381ec0d80b081106146bbd<br />
  xe-pw-146941v2: 146941v2</p>

</body>
</html>

--===============5773233327880169022==--
