Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A7AFCCA466
	for <intel-xe@archiver.kernel.org>; Thu, 15 Oct 2026 20:24:21 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 08D1710E84F;
	Thu, 15 Oct 2026 20:24:21 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6429810EA09;
 Thu, 15 Oct 2026 20:24:19 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3310853828269258620=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Rebind_BOs_evicte?=
 =?utf-8?q?d_before_the_first_LR_queue_=28rev2=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Arvind Yadav" <arvind.yadav@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 15 Oct 2026 20:24:19 -0000
Message-ID: <179209585940.32155.673473606342557719@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261015162639.3528278-1-arvind.yadav@intel.com>
In-Reply-To: <20261015162639.3528278-1-arvind.yadav@intel.com>
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

--===============3310853828269258620==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Rebind BOs evicted before the first LR queue (rev2)
URL   : https://patchwork.freedesktop.org/series/176148/
State : success

== Summary ==

CI Bug Log - changes from xe-5955-551605da81c33c1a2352b6a6116360609798f171_BAT -> xe-pw-176148v2_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 15)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9149 -> IGT_9150
  * Linux: xe-5955-551605da81c33c1a2352b6a6116360609798f171 -> xe-pw-176148v2

  IGT_9149: 157f243d73fb8c010db8c884db81ca2e558b4ab2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5955-551605da81c33c1a2352b6a6116360609798f171: 551605da81c33c1a2352b6a6116360609798f171
  xe-pw-176148v2: 176148v2

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176148v2/index.html

--===============3310853828269258620==
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
<tr><td><b>Series:</b></td><td>drm/xe: Rebind BOs evicted before the first LR queue (rev2)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176148/">https://patchwork.freedesktop.org/series/176148/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176148v2/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176148v2/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5955-551605da81c33c1a2352b6a6116360609798f171_BAT -&gt; xe-pw-176148v2_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 15)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9149 -&gt; IGT_9150</li>
<li>Linux: xe-5955-551605da81c33c1a2352b6a6116360609798f171 -&gt; xe-pw-176148v2</li>
</ul>
<p>IGT_9149: 157f243d73fb8c010db8c884db81ca2e558b4ab2 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9150: 18811c476bfde62ffbb4c0af55cd6f57e36e0dca @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5955-551605da81c33c1a2352b6a6116360609798f171: 551605da81c33c1a2352b6a6116360609798f171<br />
  xe-pw-176148v2: 176148v2</p>

</body>
</html>

--===============3310853828269258620==--
