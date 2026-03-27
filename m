Return-Path: <intel-xe-bounces@lists.freedesktop.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7183E10AB832
	for <intel-xe@archiver.kernel.org>; Fri, 27 Mar 2026 00:02:22 +0000 (UTC)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 28D0B10EBAB;
	Fri, 27 Mar 2026 00:02:22 +0000 (UTC)
Received: from a3b018990fe9 (emeril.freedesktop.org [131.252.210.167])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACA4B10EBAB;
 Fri, 27 Mar 2026 00:02:20 +0000 (UTC)
Content-Type: multipart/alternative;
 boundary="===============2386659292640578942=="
MIME-Version: 1.0
Subject: =?utf-8?q?=E2=9C=93_Xe=2ECI=2EBAT=3A_success_for_drm/i915/casf=3A_Integrate_?=
 =?utf-8?q?the_sharpness_filter_properly_into_the_scaler_code?=
From: Patchwork <patchwork@emeril.freedesktop.org>
To: =?utf-8?b?VmlsbGUgU3lyasOkbMOk?= <ville.syrjala@linux.intel.com>
Cc: intel-xe@lists.freedesktop.org
Date: Fri, 27 Mar 2026 00:02:20 -0000
Message-ID: <177456974067.404029.1668102271811971880@a3b018990fe9>
X-Patchwork-Hint: ignore
References: <20260326223139.19116-1-ville.syrjala@linux.intel.com>
In-Reply-To: <20260326223139.19116-1-ville.syrjala@linux.intel.com>
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

--===============2386659292640578942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

== Series Details ==

Series: drm/i915/casf: Integrate the sharpness filter properly into the scaler code
URL   : https://patchwork.freedesktop.org/series/163952/
State : success

== Summary ==

CI Bug Log - changes from xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f_BAT -> xe-pw-163952v1_BAT
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

  * Linux: xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f -> xe-pw-163952v1

  IGT_8834: 8834
  xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f: e7f370d78d32ed29cc3f100fbc3d1fe1a844978f
  xe-pw-163952v1: 163952v1

== Logs ==

For more details see: https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/index.html

--===============2386659292640578942==
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
<tr><td><b>Series:</b></td><td>drm/i915/casf: Integrate the sharpness filter properly into the scaler code</td></tr>
<tr><td><b>URL:</b></td><td><a href="https://patchwork.freedesktop.org/series/163952/">https://patchwork.freedesktop.org/series/163952/</a></td></tr>
<tr><td><b>State:</b></td><td>success</td></tr>

    <tr><td><b>Details:</b></td><td><a href="https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/index.html">https://intel-gfx-ci.01.org/tree/intel-xe/xe-pw-163952v1/index.html</a></td></tr>

</table>


    <h1>CI Bug Log - changes from xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f_BAT -&gt; xe-pw-163952v1_BAT</h1>
<h2>Summary</h2>
<p><strong>SUCCESS</strong></p>
<p>No regressions found.</p>
<h2>Participating hosts (14 -&gt; 14)</h2>
<p>No changes in participating hosts</p>
<h2>Changes</h2>
<p>No changes found</p>
<h2>Build changes</h2>
<ul>
<li>Linux: xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f -&gt; xe-pw-163952v1</li>
</ul>
<p>IGT_8834: 8834<br />
  xe-4799-e7f370d78d32ed29cc3f100fbc3d1fe1a844978f: e7f370d78d32ed29cc3f100fbc3d1fe1a844978f<br />
  xe-pw-163952v1: 163952v1</p>

</body>
</html>

--===============2386659292640578942==--
