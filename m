Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055A2C61CE8
	for <intel-xe@archiver.kernel.org>; Thu, 12 Jun 2025 11:07:25 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C211910E7D5;
	Thu, 12 Jun 2025 11:07:24 +0000 (UTC)
Received: from 1538d3639d33 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 53BAE10E7D2;
 Thu, 12 Jun 2025 11:07:24 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============7152334547226034114=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915=3A_Add_drm=5Fpanic?=
 =?utf-8?q?_support_=28rev9=29?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: "Jocelyn Falempe" <jfalempe@redhat.com>
Cc: intel-xe@lists.freedesktop.org
Date: Thu, 12 Jun 2025 11:07:24 -0000
Message-ID: <174972644433.71058.4184391147746335980@1538d3639d33>
X-Patchwork-Hint: ignore
References: <20250612081344.225200-1-jfalempe@redhat.com>
In-Reply-To: <20250612081344.225200-1-jfalempe@redhat.com>
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

--===============7152334547226034114==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915: Add drm_panic support (rev9)
URL   : https://patchwork.freedesktop.org/series/141937/
State : success

== Summary ==

CI Bug Log - changes from xe-3237-75238c32deae15ee4120b42a5be556ec36807a84_BAT -> xe-pw-141937v9_BAT
====================================================

Summary
-------

  **SUCCESS**

  No regressions found.

  

Participating hosts (7 -> 7)
------------------------------

  No changes in participating hosts


Changes
-------

  No changes found


Build changes
-------------

  * Linux: xe-3237-75238c32deae15ee4120b42a5be556ec36807a84 -> xe-pw-141937v9

  IGT_8405: 8405
  xe-3237-75238c32deae15ee4120b42a5be556ec36807a84: 75238c32deae15ee4120b42a5be556ec36807a84
  xe-pw-141937v9: 141937v9

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141937v9/index.html

--===============7152334547226034114==
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
<tr><td><b>Series:</b></td><td>drm/i915: Add drm_panic support (rev9)</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/141937/">https://patchwork.freedesktop.org/series/141937/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141937v9/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-141937v9/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-3237-75238c32deae15ee4120b42a5be556ec36807a84_BAT -&gt; xe-pw-141937v9_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (7 -&gt; 7)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-3237-75238c32deae15ee4120b42a5be556ec36807a84 -&gt; xe-pw-141937v9</li>
</ul>
<p>IGT_8405: 8405<br />
  xe-3237-75238c32deae15ee4120b42a5be556ec36807a84: 75238c32deae15ee4120b42a5be556ec36807a84<br />
  xe-pw-141937v9: 141937v9</p>

</body>
</html>

--===============7152334547226034114==--
