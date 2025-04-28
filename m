Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7A0E3C36005
	for <intel-xe@archiver.kernel.org>; Mon, 28 Apr 2025 04:11:39 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EBB1E10E333;
	Mon, 28 Apr 2025 04:11:38 +0000 (UTC)
Received: from c664b1dc75d1 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 36FA910E333;
 Mon, 28 Apr 2025 04:11:37 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8413957821719327164=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/gpusvm=3A_set_has=5Fdma?=
 =?utf-8?q?=5Fmapping_inside_mapping_loop_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Dafna Hirschfeld" <dafna.hirschfeld@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 28 Apr 2025 04:11:37 -0000
Message-ID: <174581349722.17460.15176480068358042895@c664b1dc75d1>
X-Patchwork-Hint: ignore
References: <20250428024752.881292-1-matthew.brost@intel.com>
In-Reply-To: <20250428024752.881292-1-matthew.brost@intel.com>
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

--===============8413957821719327164==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/gpusvm: set has_dma_mapping inside mapping loop (rev2)
URL   : https://patchwork.freedesktop.org/series/148313/
State : success

== Summary ==

CI Bug Log - changes from xe-2999-6e67a7af43567bb9f23fe156fde7efa3d214fd20_BAT -> xe-pw-148313v2_BAT
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

  * IGT: IGT_8338 -> IGT_8340
  * Linux: xe-2999-6e67a7af43567bb9f23fe156fde7efa3d214fd20 -> xe-pw-148313v2

  IGT_8338: 8338
  IGT_8340: 9eda33fedff747e846671328a19fa516b5bd7015 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2999-6e67a7af43567bb9f23fe156fde7efa3d214fd20: 6e67a7af43567bb9f23fe156fde7efa3d214fd20
  xe-pw-148313v2: 148313v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148313v2/index.html

--===============8413957821719327164==
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
<tr><td><b>Series:</b></td><td>drm/gpusvm: set has_dma_mapping inside mapping loop (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148313/">https://patchwork.freedesktop.org/series/148313/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148313v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148313v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2999-6e67a7af43567bb9f23fe156fde7efa3d214fd20_BAT -&gt; xe-pw-148313v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_8338 -&gt; IGT_8340</li>
<li>Linux: xe-2999-6e67a7af43567bb9f23fe156fde7efa3d214fd20 -&gt; xe-pw-148313v2</li>
</ul>
<p>IGT_8338: 8338<br />
  IGT_8340: 9eda33fedff747e846671328a19fa516b5bd7015 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2999-6e67a7af43567bb9f23fe156fde7efa3d214fd20: 6e67a7af43567bb9f23fe156fde7efa3d214fd20<br />
  xe-pw-148313v2: 148313v2</p>

</body>
</html>

--===============8413957821719327164==--
