Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B8AC27C53
	for <intel-xe@archiver.kernel.org>; Fri,  7 Jun 2024 16:53:33 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E55A610E614;
	Fri,  7 Jun 2024 16:53:32 +0000 (UTC)
Received: from a6498e030952 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D8A2310E2D9;
 Fri,  7 Jun 2024 16:53:31 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1533741666743947755=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_drm/xe/pf=3A_Assert_LMEM_provisi?=
 =?utf-8?q?oning_is_done_only_on_DGFX?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 07 Jun 2024 16:53:31 -0000
Message-ID: <171777921188.27586.1076606120421591462@a6498e030952>
X-Patchwork-Hint: ignore
References: <20240607153155.1592-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240607153155.1592-1-michal.wajdeczko@intel.com>
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

--===============1533741666743947755==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/pf: Assert LMEM provisioning is done only on DGFX
URL   : https://patchwork.freedesktop.org/series/134625/
State : success

== Summary ==

CI Bug Log - changes from xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9_BAT -> xe-pw-134625v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (3 -> 3)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9 -> xe-pw-134625v1

  IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9: b5a9ff6572c2849d2e02c8595b24639fdf1864a9
  xe-pw-134625v1: 134625v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/index.html

--===============1533741666743947755==
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
<tr><td><b>Series:</b></td><td>drm/xe/pf: Assert LMEM provisioning is done only on DGFX</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/134625/">https://patchwork.freedesktop.org/series/134625/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-134625v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9_BAT -&gt; xe-pw-134625v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (3 -&gt; 3)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9 -&gt; xe-pw-134625v1</li>
</ul>
<p>IGT_7880: 73618605b4370cf902267aaf1d25666ff5e26112 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1423-b5a9ff6572c2849d2e02c8595b24639fdf1864a9: b5a9ff6572c2849d2e02c8595b24639fdf1864a9<br />
  xe-pw-134625v1: 134625v1</p>

</body>
</html>

--===============1533741666743947755==--
