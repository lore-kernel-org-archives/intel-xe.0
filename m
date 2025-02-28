Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0CA2C282C6
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 18:44:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7A43310E31E;
	Fri, 28 Feb 2025 18:44:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97B1310E31E;
 Fri, 28 Feb 2025 18:44:44 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4204017156918191557=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/vdsc=3A_Use_the_DS?=
 =?utf-8?q?C_config_tables_for_DSI_panels_=28rev5=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Kandpal, Suraj" <suraj.kandpal@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 18:44:44 -0000
Message-ID: <174076828461.3266058.332567239116712981@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228152531.403026-1-suraj.kandpal@intel.com>
In-Reply-To: <20250228152531.403026-1-suraj.kandpal@intel.com>
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

--===============4204017156918191557==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/vdsc: Use the DSC config tables for DSI panels (rev5)
URL   : https://patchwork.freedesktop.org/series/145560/
State : success

== Summary ==

CI Bug Log - changes from xe-2734-c8c8d428da791e0b0ec273170b620c8c0ab5936b_BAT -> xe-pw-145560v5_BAT
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

  * Linux: xe-2734-c8c8d428da791e0b0ec273170b620c8c0ab5936b -> xe-pw-145560v5

  IGT_8254: bd401847a539540b59959c959888770778139cce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2734-c8c8d428da791e0b0ec273170b620c8c0ab5936b: c8c8d428da791e0b0ec273170b620c8c0ab5936b
  xe-pw-145560v5: 145560v5

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145560v5/index.html

--===============4204017156918191557==
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
<tr><td><b>Series:</b></td><td>drm/i915/vdsc: Use the DSC config tables for DSI panels (rev5)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145560/">https://patchwork.freedesktop.org/series/145560/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145560v5/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145560v5/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2734-c8c8d428da791e0b0ec273170b620c8c0ab5936b_BAT -&gt; xe-pw-145560v5_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2734-c8c8d428da791e0b0ec273170b620c8c0ab5936b -&gt; xe-pw-145560v5</li>
</ul>
<p>IGT_8254: bd401847a539540b59959c959888770778139cce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2734-c8c8d428da791e0b0ec273170b620c8c0ab5936b: c8c8d428da791e0b0ec273170b620c8c0ab5936b<br />
  xe-pw-145560v5: 145560v5</p>

</body>
</html>

--===============4204017156918191557==--
