Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0DCCC83F17
	for <intel-xe@archiver.kernel.org>; Wed, 23 Jul 2025 12:52:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6EF9410E0F6;
	Wed, 23 Jul 2025 12:52:33 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A09D910E0F6;
 Wed, 23 Jul 2025 12:52:32 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8182355513616166830=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Rename_MCFG=5FMCR?=
 =?utf-8?q?=5FSELECTOR_to_STEER=5FSEMAPHORE_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Nitin Gote" <nitin.r.gote@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 23 Jul 2025 12:52:32 -0000
Message-ID: <175327515265.182805.12169635319481603109@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250723114050.3790099-1-nitin.r.gote@intel.com>
In-Reply-To: <20250723114050.3790099-1-nitin.r.gote@intel.com>
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

--===============8182355513616166830==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Rename MCFG_MCR_SELECTOR to STEER_SEMAPHORE (rev2)
URL   : https://patchwork.freedesktop.org/series/151990/
State : success

== Summary ==

CI Bug Log - changes from xe-3462-10aedf862778a34d7a894de5d18607d523a71d78_BAT -> xe-pw-151990v2_BAT
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

  * Linux: xe-3462-10aedf862778a34d7a894de5d18607d523a71d78 -> xe-pw-151990v2

  IGT_8474: 54376e96f3f84e7bc6ccdc0106017cf2778ef08a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-3462-10aedf862778a34d7a894de5d18607d523a71d78: 10aedf862778a34d7a894de5d18607d523a71d78
  xe-pw-151990v2: 151990v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151990v2/index.html

--===============8182355513616166830==
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
<tr><td><b>Series:</b></td><td>drm/xe: Rename MCFG_MCR_SELECTOR to STEER_SEMAPHORE (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/151990/">https://patchwork.freedesktop.org/series/151990/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151990v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-151990v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3462-10aedf862778a34d7a894de5d18607d523a71d78_BAT -&gt; xe-pw-151990v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3462-10aedf862778a34d7a894de5d18607d523a71d78 -&gt; xe-pw-151990v2</li>
</ul>
<p>IGT_8474: 54376e96f3f84e7bc6ccdc0106017cf2778ef08a @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-3462-10aedf862778a34d7a894de5d18607d523a71d78: 10aedf862778a34d7a894de5d18607d523a71d78<br />
  xe-pw-151990v2: 151990v2</p>

</body>
</html>

--===============8182355513616166830==--
