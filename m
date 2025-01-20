Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAA41C02185
	for <intel-xe@archiver.kernel.org>; Mon, 20 Jan 2025 08:47:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9C40610E372;
	Mon, 20 Jan 2025 08:47:46 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 79E7710E373;
 Mon, 20 Jan 2025 08:47:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============4018372099096981607=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Add_and_refactor_?=
 =?utf-8?q?workarounds_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Aradhya Bhatia" <aradhya.bhatia@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 20 Jan 2025 08:47:45 -0000
Message-ID: <173736286549.2046733.18259999152325450151@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250120060916.778406-1-aradhya.bhatia@intel.com>
In-Reply-To: <20250120060916.778406-1-aradhya.bhatia@intel.com>
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

--===============4018372099096981607==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Add and refactor workarounds (rev2)
URL   : https://patchwork.freedesktop.org/series/143594/
State : success

== Summary ==

CI Bug Log - changes from xe-2513-aceaa93d2b1d5d5727652a02f5f0742dd9e07ac2_BAT -> xe-pw-143594v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (9 -> 7)
------------------------------

  Missing    (2): bat-pvc-2 bat-adlp-vm 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-2513-aceaa93d2b1d5d5727652a02f5f0742dd9e07ac2 -> xe-pw-143594v2

  IGT_8198: 1d1ae626601119d249b530547b9e226c6a684144 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2513-aceaa93d2b1d5d5727652a02f5f0742dd9e07ac2: aceaa93d2b1d5d5727652a02f5f0742dd9e07ac2
  xe-pw-143594v2: 143594v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v2/index.html

--===============4018372099096981607==
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
<tr><td><b>Series:</b></td><td>drm/xe: Add and refactor workarounds (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/143594/">https://patchwork.freedesktop.org/series/143594/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-143594v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2513-aceaa93d2b1d5d5727652a02f5f0742dd9e07ac2_BAT -&gt; xe-pw-143594v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 7)</h2>
<p>Missing    (2): bat-pvc-2 bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2513-aceaa93d2b1d5d5727652a02f5f0742dd9e07ac2 -&gt; xe-pw-143594v2</li>
</ul>
<p>IGT_8198: 1d1ae626601119d249b530547b9e226c6a684144 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2513-aceaa93d2b1d5d5727652a02f5f0742dd9e07ac2: aceaa93d2b1d5d5727652a02f5f0742dd9e07ac2<br />
  xe-pw-143594v2: 143594v2</p>

</body>
</html>

--===============4018372099096981607==--
