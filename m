Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6182C282C6
	for <intel-xe@archiver.kernel.org>; Fri, 28 Feb 2025 20:11:03 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82D8D10ED2E;
	Fri, 28 Feb 2025 20:11:03 +0000 (UTC)
Received: from b555e5b46a47 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A16D610ED2E;
 Fri, 28 Feb 2025 20:11:02 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7604413716538528982=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe/xe=5Fvm=3A_Implement?=
 =?utf-8?q?_xe=5Fvm=5Fget=5Fproperty=5Fioctl_=28rev3=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jonathan Cavitt" <jonathan.cavitt@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 28 Feb 2025 20:11:02 -0000
Message-ID: <174077346264.3295116.5528010193348761294@b555e5b46a47>
X-Patchwork-Hint: ignore
References: <20250228182122.77475-1-jonathan.cavitt@intel.com>
In-Reply-To: <20250228182122.77475-1-jonathan.cavitt@intel.com>
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

--===============7604413716538528982==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe/xe_vm: Implement xe_vm_get_property_ioctl (rev3)
URL   : https://patchwork.freedesktop.org/series/145529/
State : success

== Summary ==

CI Bug Log - changes from xe-2735-9f89c8967478b50030ccb9fa17290e0aec25b36c_BAT -> xe-pw-145529v3_BAT
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

  * Linux: xe-2735-9f89c8967478b50030ccb9fa17290e0aec25b36c -> xe-pw-145529v3

  IGT_8254: bd401847a539540b59959c959888770778139cce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-2735-9f89c8967478b50030ccb9fa17290e0aec25b36c: 9f89c8967478b50030ccb9fa17290e0aec25b36c
  xe-pw-145529v3: 145529v3

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v3/index.html

--===============7604413716538528982==
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
<tr><td><b>Series:</b></td><td>drm/xe/xe_vm: Implement xe_vm_get_property_ioctl (rev3)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/145529/">https://patchwork.freedesktop.org/series/145529/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v3/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-145529v3/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-2735-9f89c8967478b50030ccb9fa17290e0aec25b36c_BAT -&gt; xe-pw-145529v3_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (9 -&gt; 8)</h2>
<p>Missing    (1): bat-adlp-vm </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-2735-9f89c8967478b50030ccb9fa17290e0aec25b36c -&gt; xe-pw-145529v3</li>
</ul>
<p>IGT_8254: bd401847a539540b59959c959888770778139cce @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-2735-9f89c8967478b50030ccb9fa17290e0aec25b36c: 9f89c8967478b50030ccb9fa17290e0aec25b36c<br />
  xe-pw-145529v3: 145529v3</p>

</body>
</html>

--===============7604413716538528982==--
