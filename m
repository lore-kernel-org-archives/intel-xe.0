Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37203F53D69
	for <intel-xe@archiver.kernel.org>; Mon, 16 Mar 2026 15:49:35 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CBB9810E325;
	Mon, 16 Mar 2026 15:49:34 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EE1510E325;
 Mon, 16 Mar 2026 15:49:33 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============1806737200597642126=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/xelpdp/tc=3A_Conve?=
 =?utf-8?q?rt_TCSS_power_check_WARN_to_a_debug_message?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Chia-Lin Kao (AceLan)" <acelan.kao@canonical.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 16 Mar 2026 15:49:33 -0000
Message-ID: <177367617323.361947.4877905480997635617@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260316093001.689992-1-acelan.kao@canonical.com>
In-Reply-To: <20260316093001.689992-1-acelan.kao@canonical.com>
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

--===============1806737200597642126==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/xelpdp/tc: Convert TCSS power check WARN to a debug message
URL   : https://patchwork.freedesktop.org/series/163268/
State : success

== Summary ==

CI Bug Log - changes from xe-4727-3c0f46ebae86b197566f2da39cf8f35b137288ac_BAT -> xe-pw-163268v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (14 -> 14)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4727-3c0f46ebae86b197566f2da39cf8f35b137288ac -> xe-pw-163268v1

  IGT_8805: 8805
  xe-4727-3c0f46ebae86b197566f2da39cf8f35b137288ac: 3c0f46ebae86b197566f2da39cf8f35b137288ac
  xe-pw-163268v1: 163268v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163268v1/index.html

--===============1806737200597642126==
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
<tr><td><b>Series:</b></td><td>drm/i915/xelpdp/tc: Convert TCSS power check WARN to a debug message</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163268/">https://patchwork.freedesktop.org/series/163268/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163268v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163268v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4727-3c0f46ebae86b197566f2da39cf8f35b137288ac_BAT -&gt; xe-pw-163268v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4727-3c0f46ebae86b197566f2da39cf8f35b137288ac -&gt; xe-pw-163268v1</li>
</ul>
<p>IGT_8805: 8805<br />
  xe-4727-3c0f46ebae86b197566f2da39cf8f35b137288ac: 3c0f46ebae86b197566f2da39cf8f35b137288ac<br />
  xe-pw-163268v1: 163268v1</p>

</body>
</html>

--===============1806737200597642126==--
