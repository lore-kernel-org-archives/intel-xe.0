Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5CB5BCA6012
	for <intel-xe@archiver.kernel.org>; Fri,  9 Oct 2026 08:53:29 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2050910FFB4;
	Fri,  9 Oct 2026 08:53:29 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B2E0510FFB4;
 Fri,  9 Oct 2026 08:53:28 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============0519597605477343262=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Don=27t_transfer_?=
 =?utf-8?q?shrinker_pages_for_pinned_bos_on_purgeable_state_change?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 09 Oct 2026 08:53:28 -0000
Message-ID: <179153600872.2089.3264980371629250214@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261009070053.7790-1-thomas.hellstrom@linux.intel.com>
In-Reply-To: <20261009070053.7790-1-thomas.hellstrom@linux.intel.com>
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

--===============0519597605477343262==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Don't transfer shrinker pages for pinned bos on purgeable state change
URL   : https://patchwork.freedesktop.org/series/175805/
State : success

== Summary ==

CI Bug Log - changes from xe-5912-4f1de47ae94bb8aee6bc1c6105609646d9411650_BAT -> xe-pw-175805v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (15 -> 14)
------------------------------

  Missing    (1): bat-ptl-vm 


Changes
-------

  No changes found


Build changes
-------------

  * IGT: IGT_9137 -> IGT_9138
  * Linux: xe-5912-4f1de47ae94bb8aee6bc1c6105609646d9411650 -> xe-pw-175805v1

  IGT_9137: 125c0289617f3c7ba7ee376ea1d8aabd2ff5afdc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  IGT_9138: 9138
  xe-5912-4f1de47ae94bb8aee6bc1c6105609646d9411650: 4f1de47ae94bb8aee6bc1c6105609646d9411650
  xe-pw-175805v1: 175805v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175805v1/index.html

--===============0519597605477343262==
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
<tr><td><b>Series:</b></td><td>drm/xe: Don&#x27;t transfer shrinker pages for pinned bos on purgeable state change</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/175805/">https://patchwork.freedesktop.org/series/175805/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175805v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-175805v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5912-4f1de47ae94bb8aee6bc1c6105609646d9411650_BAT -&gt; xe-pw-175805v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (15 -&gt; 14)</h2>
<p>Missing    (1): bat-ptl-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>IGT: IGT_9137 -&gt; IGT_9138</li>
<li>Linux: xe-5912-4f1de47ae94bb8aee6bc1c6105609646d9411650 -&gt; xe-pw-175805v1</li>
</ul>
<p>IGT_9137: 125c0289617f3c7ba7ee376ea1d8aabd2ff5afdc @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  IGT_9138: 9138<br />
  xe-5912-4f1de47ae94bb8aee6bc1c6105609646d9411650: 4f1de47ae94bb8aee6bc1c6105609646d9411650<br />
  xe-pw-175805v1: 175805v1</p>

</body>
</html>

--===============0519597605477343262==--
