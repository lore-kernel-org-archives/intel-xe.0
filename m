Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7191D5B86F
	for <intel-xe@archiver.kernel.org>; Mon, 15 Dec 2025 21:58:46 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A45EC10E059;
	Mon, 15 Dec 2025 21:58:46 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id BE5F910E059;
 Mon, 15 Dec 2025 21:58:45 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============3612881278834751932=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/xe=3A_Improve_wedged_mo?=
 =?utf-8?q?de_handling_=28rev11=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Lukasz Laguna" <lukasz.laguna@intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Mon, 15 Dec 2025 21:58:45 -0000
Message-ID: <176583592564.90814.7371447277992696780@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20251215174613.3701-1-lukasz.laguna@intel.com>
In-Reply-To: <20251215174613.3701-1-lukasz.laguna@intel.com>
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

--===============3612881278834751932==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/xe: Improve wedged mode handling (rev11)
URL   : https://patchwork.freedesktop.org/series/148214/
State : success

== Summary ==

CI Bug Log - changes from xe-4247-342b565445c93d6fb5221aa9c23be20d65fa16f2_BAT -> xe-pw-148214v11_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (12 -> 12)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-4247-342b565445c93d6fb5221aa9c23be20d65fa16f2 -> xe-pw-148214v11

  IGT_8666: 8666
  xe-4247-342b565445c93d6fb5221aa9c23be20d65fa16f2: 342b565445c93d6fb5221aa9c23be20d65fa16f2
  xe-pw-148214v11: 148214v11

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v11/index.html

--===============3612881278834751932==
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
<tr><td><b>Series:</b></td><td>drm/xe: Improve wedged mode handling (rev11)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/148214/">https://patchwork.freedesktop.org/series/148214/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v11/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-148214v11/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4247-342b565445c93d6fb5221aa9c23be20d65fa16f2_BAT -&gt; xe-pw-148214v11_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (12 -&gt; 12)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4247-342b565445c93d6fb5221aa9c23be20d65fa16f2 -&gt; xe-pw-148214v11</li>
</ul>
<p>IGT_8666: 8666<br />
  xe-4247-342b565445c93d6fb5221aa9c23be20d65fa16f2: 342b565445c93d6fb5221aa9c23be20d65fa16f2<br />
  xe-pw-148214v11: 148214v11</p>

</body>
</html>

--===============3612881278834751932==--
