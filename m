Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57F64CC6B31
	for <intel-xe@archiver.kernel.org>; Wed, 14 Oct 2026 14:12:45 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E8C3510E1B7;
	Wed, 14 Oct 2026 14:12:44 +0000 (UTC)
Received: from 221881a7231d (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 90ECF10E1B7;
 Wed, 14 Oct 2026 14:12:43 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============8924045229460642509=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/gmbus=3A_Add_bit-b?=
 =?utf-8?q?anging_debugfs_control?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Naladala, Ramanaidu" <ramanaidu.naladala@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Wed, 14 Oct 2026 14:12:43 -0000
Message-ID: <179198716358.24133.11134909888618649358@221881a7231d>
X-Patchwork-Hint: ignore
References: <20261014075956.2104356-1-ramanaidu.naladala@intel.com>
In-Reply-To: <20261014075956.2104356-1-ramanaidu.naladala@intel.com>
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

--===============8924045229460642509==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/gmbus: Add bit-banging debugfs control
URL   : https://patchwork.freedesktop.org/series/176104/
State : success

== Summary ==

CI Bug Log - changes from xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662_BAT -> xe-pw-176104v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 12)
------------------------------

  Missing    (2): bat-bmg-1 bat-wcl-1 


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662 -> xe-pw-176104v1

  IGT_9145: 05c13a14f7f8bcda7bff83b8aa033c3c47a4b1fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662: c06d7623a198463e9aa2d09a3c33d96fe66ea662
  xe-pw-176104v1: 176104v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176104v1/index.html

--===============8924045229460642509==
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
<tr><td><b>Series:</b></td><td>drm/i915/gmbus: Add bit-banging debugfs control</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/176104/">https://patchwork.freedesktop.org/series/176104/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176104v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-176104v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662_BAT -&gt; xe-pw-176104v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 12)</h2>
<p>Missing    (2): bat-bmg-1 bat-wcl-1 </p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662 -&gt; xe-pw-176104v1</li>
</ul>
<p>IGT_9145: 05c13a14f7f8bcda7bff83b8aa033c3c47a4b1fb @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-5946-c06d7623a198463e9aa2d09a3c33d96fe66ea662: c06d7623a198463e9aa2d09a3c33d96fe66ea662<br />
  xe-pw-176104v1: 176104v1</p>

</body>
</html>

--===============8924045229460642509==--
