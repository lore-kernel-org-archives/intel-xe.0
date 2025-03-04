Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 298BFC021B8
	for <intel-xe@archiver.kernel.org>; Tue,  4 Mar 2025 17:04:38 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EAD1910E652;
	Tue,  4 Mar 2025 17:04:37 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8F5510E652;
 Tue,  4 Mar 2025 17:04:36 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3116681193999943323=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/dp=3A_Fix_link_tra?=
 =?utf-8?q?ining_interrupted_by_HPD_pulse?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Imre Deak" <imre.deak@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Tue, 04 Mar 2025 17:04:36 -0000
Message-ID: <174110787668.677839.7742436892944170072@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250304152917.3407080-1-imre.deak@intel.com>
In-Reply-To: <20250304152917.3407080-1-imre.deak@intel.com>
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

--===============3116681193999943323==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/dp: Fix link training interrupted by HPD pulse
URL   : https://patchwork.freedesktop.org/series/145781/
State : success

== Summary ==

CI Bug Log - changes from xe-2753-96d3f9169d0354f7cb7dd92c05786522947e2e62_BAT -> xe-pw-145781v1_BAT
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

  * Linux: xe-2753-96d3f9169d0354f7cb7dd92c05786522947e2e62 -> xe-pw-145781v1

  IGT_8258: ee442ca9711ab6ae1a1c0fc784d18bfaa6f9244f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2753-96d3f9169d0354f7cb7dd92c05786522947e2e62: 96d3f9169d0354f7cb7dd92c05786522947e2e62
  xe-pw-145781v1: 145781v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145781v1/index.html

--===============3116681193999943323==
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
<tr><td><b>Series:</b></td><td>drm/i915/dp: Fix link training interrupted by HPD pulse</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145781/">https://patchwork.freedesktop.org/series/145781/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145781v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145781v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2753-96d3f9169d0354f7cb7dd92c05786522947e2e62_BAT -&gt; xe-pw-145781v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2753-96d3f9169d0354f7cb7dd92c05786522947e2e62 -&gt; xe-pw-145781v1</li>
</ul>
<p>IGT_8258: ee442ca9711ab6ae1a1c0fc784d18bfaa6f9244f @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2753-96d3f9169d0354f7cb7dd92c05786522947e2e62: 96d3f9169d0354f7cb7dd92c05786522947e2e62<br />
  xe-pw-145781v1: 145781v1</p>

</body>
</html>

--===============3116681193999943323==--
