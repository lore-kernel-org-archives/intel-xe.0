Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 108D3CD5BBF
	for <intel-xe@archiver.kernel.org>; Mon, 25 May 2026 05:11:47 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BB09410E09E;
	Mon, 25 May 2026 05:11:46 +0000 (UTC)
Received: from 6beec6c84f66 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3808910E09E;
 Mon, 25 May 2026 05:11:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7958503249541428498=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Fix_decompress_va?=
 =?utf-8?q?lidation_in_vm=5Fbind=5Fioctl=5Fcheck=5Fargs?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Pravalika Gurram" <pravalika.gurram@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 25 May 2026 05:11:45 -0000
Message-ID: <177968590522.3994.1447307026695832926@6beec6c84f66>
X-Patchwork-Hint: ignore
References: <20260525044239.83893-1-pravalika.gurram@intel.com>
In-Reply-To: <20260525044239.83893-1-pravalika.gurram@intel.com>
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

--===============7958503249541428498==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Fix decompress validation in vm_bind_ioctl_check_args
URL   : https://patchwork.freedesktop.org/series/167165/
State : success

== Summary ==

CI Bug Log - changes from xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88_BAT -> xe-pw-167165v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (13 -> 13)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88 -> xe-pw-167165v1

  IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88: 7ce39e849680d6c0bf2795bbb4d986ecd1649d88
  xe-pw-167165v1: 167165v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167165v1/index.html

--===============7958503249541428498==
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
<tr><td><b>Series:</b></td><td>drm/xe: Fix decompress validation in vm_bind_ioctl_check_args</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/167165/">https://patchwork.freedesktop.org/series/167165/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167165v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-167165v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88_BAT -&gt; xe-pw-167165v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (13 -&gt; 13)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88 -&gt; xe-pw-167165v1</li>
</ul>
<p>IGT_8936: 98b65acc4f6edf68cd52b30f27b83049c4c5c83b @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5120-7ce39e849680d6c0bf2795bbb4d986ecd1649d88: 7ce39e849680d6c0bf2795bbb4d986ecd1649d88<br />
  xe-pw-167165v1: 167165v1</p>

</body>
</html>

--===============7958503249541428498==--
