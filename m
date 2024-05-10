Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50E67C25B10
	for <intel-xe@archiver.kernel.org>; Fri, 10 May 2024 21:42:00 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 156EE10E1BB;
	Fri, 10 May 2024 21:42:00 +0000 (UTC)
Received: from 8e613ede5ea5 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D35310E1BB;
 Fri, 10 May 2024 21:41:58 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2452575100876806858=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_CI=2EBAT=3A_success_for_Move_GuC_submission_init_to_post?=
 =?utf-8?q?_hwconfig_step?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Michal Wajdeczko" <michal.wajdeczko@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 10 May 2024 21:41:58 -0000
Message-ID: <171537731805.2056703.2929632200777979283@8e613ede5ea5>
X-Patchwork-Hint: ignore
References: <20240510203810.1952-1-michal.wajdeczko@intel.com>
In-Reply-To: <20240510203810.1952-1-michal.wajdeczko@intel.com>
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

--===============2452575100876806858==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: Move GuC submission init to post hwconfig step
URL   : https://patchwork.freedesktop.org/series/133471/
State : success

== Summary ==

CI Bug Log - changes from xe-1275-afd593c3e9f9218ececa93e30c33182346295ac9_BAT -> xe-pw-133471v1_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (5 -> 5)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-1275-afd593c3e9f9218ececa93e30c33182346295ac9 -> xe-pw-133471v1

  IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git
  xe-1275-afd593c3e9f9218ececa93e30c33182346295ac9: afd593c3e9f9218ececa93e30c33182346295ac9
  xe-pw-133471v1: 133471v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133471v1/index.html

--===============2452575100876806858==
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
<tr><td><b>Series:</b></td><td>Move GuC submission init to post hwconfig step</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/133471/">https://patchwork.freedesktop.org/series/133471/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133471v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-133471v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-1275-afd593c3e9f9218ececa93e30c33182346295ac9_BAT -&gt; xe-pw-133471v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (5 -&gt; 5)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-1275-afd593c3e9f9218ececa93e30c33182346295ac9 -&gt; xe-pw-133471v1</li>
</ul>
<p>IGT_7846: 4a5fd4e7cb2798636f6464e2bd61399f3242b322 @ https://gitlab.freedesktop.org/drm/igt-gpu-tools.git<br />
  xe-1275-afd593c3e9f9218ececa93e30c33182346295ac9: afd593c3e9f9218ececa93e30c33182346295ac9<br />
  xe-pw-133471v1: 133471v1</p>

</body>
</html>

--===============2452575100876806858==--
