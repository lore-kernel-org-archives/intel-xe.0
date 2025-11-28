Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0F54CFD376
	for <intel-xe@archiver.kernel.org>; Fri, 28 Nov 2025 12:52:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 38F6810E123;
	Fri, 28 Nov 2025 12:52:25 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B06B810E123;
 Fri, 28 Nov 2025 12:52:23 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============5508631025790836077=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/display=3A_Enable_?=
 =?utf-8?q?system_cache_support_for_FBC_=28rev4=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Vinod Govindapillai" <vinod.govindapillai@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Nov 2025 12:52:23 -0000
Message-ID: <176433434371.38403.18412255342955076085@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251127115349.249120-1-vinod.govindapillai@intel.com>
In-Reply-To: <20251127115349.249120-1-vinod.govindapillai@intel.com>
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

--===============5508631025790836077==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/display: Enable system cache support for FBC (rev4)
URL   : https://patchwork.freedesktop.org/series/157944/
State : success

== Summary ==

CI Bug Log - changes from xe-4161-2e2c779bc906d76b96ec0a46d9b85d1b035d2e23_BAT -> xe-pw-157944v4_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 11)
------------------------------

  Missing    (1): bat-dg2-oem2 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_8643 -> IGT_8645
  * Linux: xe-4161-2e2c779bc906d76b96ec0a46d9b85d1b035d2e23 -> xe-pw-157944v4

  IGT_8643: 9e6e12ee7d6d66dd7668aff22b330d3ca23b3e5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_8645: 8645
  xe-4161-2e2c779bc906d76b96ec0a46d9b85d1b035d2e23: 2e2c779bc906d76b96ec0a46d9b85d1b035d2e23
  xe-pw-157944v4: 157944v4

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157944v4/index.html

--===============5508631025790836077==
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
<tr><td><b>Series:</b></td><td>drm/i915/display: Enable system cache support for FBC (rev4)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/157944/">https://patchwork.freedesktop.org/series/157944/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157944v4/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-157944v4/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4161-2e2c779bc906d76b96ec0a46d9b85d1b035d2e23_BAT -&gt; xe-pw-157944v4_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 11)</h2>
<p>Missing    (1): bat-dg2-oem2 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8643 -&gt; IGT_8645</li>
<li>Linux: xe-4161-2e2c779bc906d76b96ec0a46d9b85d1b035d2e23 -&gt; xe-pw-157944v4</li>
</ul>
<p>IGT_8643: 9e6e12ee7d6d66dd7668aff22b330d3ca23b3e5e @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_8645: 8645<br />
  xe-4161-2e2c779bc906d76b96ec0a46d9b85d1b035d2e23: 2e2c779bc906d76b96ec0a46d9b85d1b035d2e23<br />
  xe-pw-157944v4: 157944v4</p>

</body>
</html>

--===============5508631025790836077==--
